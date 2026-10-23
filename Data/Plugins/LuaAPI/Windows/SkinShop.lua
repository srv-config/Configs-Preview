--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- SkinShop.lua - transformation skins bought for a time or for good
------------------------------------------------------------------
-- Client half: Data\Custom\Scripts\UI\Windows\SkinShop.lua
--
-- The catalogue is Config\SkinShop.xml; the client reads the same file
-- encrypted as Data\Local\SkinShop.bmd, so both have to match. The texts,
-- the skin names included, are on the client (CustomText.xml, section
-- SkinShop): the server only sends numbers.
--
-- What each character owns and wears is stored in the database: the
-- IGC_SkinShop_* tables and procedures come with the database scripts.
--
--   state     IGC_SkinShop_Load / Grant / SetActive over DB.QueryDS
--   currency  Coin.Get / Coin.Charge
--   look      Player.SetShopSkin
--
-- Loads are async: the rows reach SkinShopDB below, routed from
-- CallbacksDB.lua.
------------------------------------------------------------------

local S = UIProtocol.SkinShop

local CONFIG = "..\\Data\\Plugins\\LuaAPI\\Config\\SkinShop.xml"
local MAX_OPTS = 5
local EXPIRY_CHECK = 10 -- seconds between looks at the worn skins

local Q_LOAD = Enums.QueryDS.SKINSHOP_LOAD
local Q_SAVE = Enums.QueryDS.SKINSHOP_SAVE

-- The system's own state; global, Callbacks.lua and Timers.lua call into it.
SkinShop = {
	skins = {},  -- [skinId] = { monster, options = { { seconds, price, coin }, ... } }
	chars = {},  -- [CharacterId] = { loaded, owned = { [skinId] = { permanent, expireAt } }, active, index }
}

local function CharId(oPlayer)
	if oPlayer == nil or oPlayer.userData == nil then
		return 0
	end

	return oPlayer.userData.CharacterId or 0
end

------------------------------------------------------------------
-- Catalogue
------------------------------------------------------------------

local function num(node, name, default)
	local v = tonumber(node.attr[name] or "")
	return v ~= nil and v or default
end

-- Same reading rules as the client, so both sides agree on what a skin and its options are.
function SkinShop.LoadConfig()
	local root, err = SimpleXml.LoadFile(CONFIG)

	if root == nil then
		Log.Add("[SkinShop] " .. tostring(err))
		return
	end

	local skins = {}
	local defaultCoin = num(root, "DefaultCurrency", UIProtocol.COIN.WCOIN)
	local list = SimpleXml.Find(root, "Skins")

	for _, node in ipairs(list and list.kids or {}) do
		local id = num(node, "ID", 0)

		if node.name == "Skin" and id > 0 and id < S.NONE and skins[id] == nil then
			local skinCoin = num(node, "Currency", defaultCoin)
			local skin = { monster = num(node, "Monster", -1), options = {} }

			for _, o in ipairs(node.kids) do
				if o.name == "Option" and #skin.options < MAX_OPTS then
					skin.options[#skin.options + 1] = {
						seconds = num(o, "Days", 0) * 86400 + num(o, "Hours", 0) * 3600,
						price = num(o, "Price", 0),
						coin = num(o, "Currency", skinCoin),
					}
				end
			end

			skins[id] = skin
		end
	end

	SkinShop.skins = skins
end

------------------------------------------------------------------
-- Per-character state
------------------------------------------------------------------

local function secondsLeft(entry)
	if entry.permanent then
		return nil
	end

	local left = entry.expireAt - os.time()
	return left > 0 and left or 0
end

local function stateOf(oPlayer)
	local charId = CharId(oPlayer)
	return charId > 0 and SkinShop.chars[charId] or nil
end

local warnedOldGS = false

local function wear(oPlayer, skinId)
	-- a GameServer built before the Skin Shop has no way to show the look
	if Player.SetShopSkin == nil then
		if not warnedOldGS then
			warnedOldGS = true
			Log.Add("[SkinShop] Player.SetShopSkin is missing - this GameServer is older than the Skin Shop")
		end

		return
	end

	local skin = skinId and SkinShop.skins[skinId]
	Player.SetShopSkin(oPlayer, skin and skin.monster or -1)
end

local function sendState(oPlayer)
	local st = stateOf(oPlayer)
	local w = UIPacket.Writer()

	w:byte(4)

	for coin = UIProtocol.COIN.ZEN, UIProtocol.COIN.RUUD do
		w:byte(coin)
		w:dword(Coin.Get(oPlayer, coin))
	end

	w:word(st and st.active or S.NONE)

	local ids = {}

	for id in pairs(st and st.owned or {}) do
		ids[#ids + 1] = id
	end

	table.sort(ids)

	-- a count byte caps the list
	local count = math.min(#ids, 255)
	w:byte(count)

	for i = 1, count do
		local entry = st.owned[ids[i]]
		w:word(ids[i])
		w:byte(entry.permanent and 1 or 0)
		w:dword(secondsLeft(entry) or 0)
	end

	UIWindow.Send(oPlayer, S.id, S.STATE, S.RESULT.OK, w)
end

------------------------------------------------------------------
-- Database
------------------------------------------------------------------
-- Global so the DataServer callback in CallbacksDB.lua can reach it.

SkinShopDB = {}

local pending = {} -- [playerIndex] = { charId, rows = { [key] = { column = value } }, sendState }

function SkinShop.Load(oPlayer, sendWhenDone)
	local charId = CharId(oPlayer)

	if charId <= 0 then
		return
	end

	-- a load already on its way would lose the rows it has if replaced
	local p = pending[oPlayer.Index]

	if p ~= nil and p.charId == charId then
		p.sendState = p.sendState or sendWhenDone
		return
	end

	pending[oPlayer.Index] = { charId = charId, rows = {}, sendState = sendWhenDone }
	DB.QueryDS(oPlayer.Index, Q_LOAD, string.format("EXEC IGC_SkinShop_Load %d", charId))
end

-- One call per column per row; a second packet can overtake the first, so values go into (packet, row) buckets.
function SkinShopDB.OnRow(iPlayerIndex, iQuery, iPacket, iRow, oRow)
	local p = pending[iPlayerIndex]

	if iQuery ~= Q_LOAD or p == nil then
		return
	end

	local key = iPacket * 1000 + iRow
	p.rows[key] = p.rows[key] or {}
	p.rows[key][oRow:GetColumnName()] = oRow:GetValue()
end

function SkinShopDB.OnComplete(iPlayerIndex, iQuery)
	local p = pending[iPlayerIndex]

	if iQuery ~= Q_LOAD or p == nil then
		return
	end

	pending[iPlayerIndex] = nil

	local oPlayer = Player.GetObjByIndex(iPlayerIndex)

	-- the player may have left, or switched character, while the query ran
	if oPlayer == nil or CharId(oPlayer) ~= p.charId then
		return
	end

	local now = os.time()
	local st = { loaded = true, owned = {}, active = nil, index = iPlayerIndex }

	for _, row in pairs(p.rows) do
		local id = tonumber(row.SkinId) or 0

		if id > 0 then
			local permanent = tonumber(row.Permanent) == 1
			st.owned[id] = { permanent = permanent, expireAt = now + (tonumber(row.SecondsLeft) or 0) }

			if tonumber(row.Active) == 1 then
				st.active = id
			end
		end
	end

	SkinShop.chars[p.charId] = st

	-- a skin that expired offline, or one the catalogue dropped, does not go back on
	local entry = st.active and st.owned[st.active]

	if st.active ~= nil and (entry == nil or secondsLeft(entry) == 0 or SkinShop.skins[st.active] == nil) then
		st.active = nil
		DB.QueryDS(iPlayerIndex, Q_SAVE, string.format("EXEC IGC_SkinShop_SetActive %d, 0", p.charId))
	end

	wear(oPlayer, st.active)

	if p.sendState then
		sendState(oPlayer)
	end
end

local function saveActive(oPlayer, st)
	DB.QueryDS(oPlayer.Index, Q_SAVE, string.format("EXEC IGC_SkinShop_SetActive %d, %d", CharId(oPlayer), st.active or 0))
end

------------------------------------------------------------------
-- Entering and leaving the game, expiry
------------------------------------------------------------------

-- documented to fire after a teleport too: a cached character only gets its look back, which loading the character clears
function SkinShop.OnJoin(oPlayer)
	local st = stateOf(oPlayer)

	if st ~= nil and st.index == oPlayer.Index then
		wear(oPlayer, st.active)
	else
		SkinShop.Load(oPlayer, false)
	end
end

function SkinShop.OnLeave(oPlayer)
	local charId = CharId(oPlayer)

	if charId > 0 then
		SkinShop.chars[charId] = nil
	end

	pending[oPlayer.Index] = nil
end

local sinceCheck = 0
local reloadSweep = true

function SkinShop.OnSecond()
	-- a reload drops every cache; done here, not at load, because all 8 Lua contexts load the script and only ctx0 runs timers
	if reloadSweep then
		reloadSweep = false

		Object.ForEachPlayer(function(oPlayer)
			if stateOf(oPlayer) == nil then
				SkinShop.Load(oPlayer, false)
			end

			return true
		end)
	end

	sinceCheck = sinceCheck + 1

	if sinceCheck < EXPIRY_CHECK then
		return
	end

	sinceCheck = 0

	for charId, st in pairs(SkinShop.chars) do
		local entry = st.active and st.owned[st.active]

		if entry ~= nil and secondsLeft(entry) == 0 then
			local oPlayer = Player.GetObjByIndex(st.index)
			local skinId = st.active
			st.active = nil

			if oPlayer ~= nil and CharId(oPlayer) == charId then
				wear(oPlayer, nil)
				saveActive(oPlayer, st)
				-- the client words the notice from its CustomText, in the player's language
				UIWindow.Send(oPlayer, S.id, S.EXPIRY, S.RESULT.OK, UIPacket.Writer():word(skinId))
				sendState(oPlayer)
			else
				SkinShop.chars[charId] = nil
			end
		end
	end
end

------------------------------------------------------------------
-- Window callbacks
------------------------------------------------------------------

UIWindow.OnOpen(S.id, function(oPlayer)
	local st = stateOf(oPlayer)

	if st ~= nil and st.loaded then
		sendState(oPlayer)
	else
		SkinShop.Load(oPlayer, true)
	end

	return 0
end)

UIWindow.On(S.id, S.BUY, function(oPlayer, reader)
	local skinId = reader:word()
	local optIndex = reader:byte()
	local price = reader:dword()
	local coin = reader:byte()

	local st = stateOf(oPlayer)
	local skin = SkinShop.skins[skinId]
	local opt = skin and skin.options[optIndex + 1]

	if st == nil or st.loaded ~= true then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.BLOCKED)
		return
	end

	if opt == nil then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.BAD_SKIN)
		return
	end

	-- the price the player agreed to has to be the one charged
	if opt.price ~= price or opt.coin ~= coin then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.PRICE_CHANGED)
		sendState(oPlayer)
		return
	end

	local entry = st.owned[skinId]

	if entry ~= nil and entry.permanent then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.OWNED)
		return
	end

	-- a trade or a personal shop holds a claim on the player's money
	if Player.CheckItemAction(oPlayer) ~= Enums.ItemActionBlock.OK then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.BLOCKED)
		return
	end

	-- charge first: a failure here costs the player nothing
	if Coin.Charge(oPlayer, opt.coin, opt.price) == false then
		UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.NO_FUNDS)
		return
	end

	local now = os.time()

	if opt.seconds == 0 then
		st.owned[skinId] = { permanent = true, expireAt = 0 }
	else
		local from = (entry ~= nil and entry.expireAt > now) and entry.expireAt or now
		st.owned[skinId] = { permanent = false, expireAt = from + opt.seconds }
	end

	DB.QueryDS(oPlayer.Index, Q_SAVE, string.format("EXEC IGC_SkinShop_Grant %d, %d, %d, %d, %d, %d",
		CharId(oPlayer), skinId, opt.seconds, optIndex, opt.price, opt.coin))

	Log.Add(string.format("[SkinShop] [%s][%s] bought skin %d option %d for %d (coin %d)",
		oPlayer.AccountId, oPlayer.Name, skinId, optIndex + 1, opt.price, opt.coin))

	UIWindow.Send(oPlayer, S.id, S.BUY, S.RESULT.OK)
	sendState(oPlayer)
end)

UIWindow.On(S.id, S.EQUIP, function(oPlayer, reader)
	local skinId = reader:word()
	local st = stateOf(oPlayer)
	local entry = st and st.owned[skinId]

	if entry == nil then
		UIWindow.Send(oPlayer, S.id, S.EQUIP, S.RESULT.NOT_OWNED)
		return
	end

	if secondsLeft(entry) == 0 then
		UIWindow.Send(oPlayer, S.id, S.EQUIP, S.RESULT.EXPIRED)
		return
	end

	-- owned, but no longer in the catalogue, so there is no monster to show
	if SkinShop.skins[skinId] == nil then
		UIWindow.Send(oPlayer, S.id, S.EQUIP, S.RESULT.BAD_SKIN)
		return
	end

	st.active = skinId
	wear(oPlayer, skinId)
	saveActive(oPlayer, st)

	UIWindow.Send(oPlayer, S.id, S.EQUIP, S.RESULT.OK)
	sendState(oPlayer)
end)

UIWindow.On(S.id, S.UNEQUIP, function(oPlayer)
	local st = stateOf(oPlayer)

	if st == nil then
		UIWindow.Send(oPlayer, S.id, S.UNEQUIP, S.RESULT.BLOCKED)
		return
	end

	st.active = nil
	wear(oPlayer, nil)
	saveActive(oPlayer, st)

	UIWindow.Send(oPlayer, S.id, S.UNEQUIP, S.RESULT.OK)
	sendState(oPlayer)
end)

------------------------------------------------------------------
-- Script (re)load
------------------------------------------------------------------

SkinShop.LoadConfig()
