--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- CoinExchange.lua - WCoin to Ruud at a rate this server owns
------------------------------------------------------------------
-- Client half: Data\Custom\Scripts\UI\Windows\CoinExchange.lua
--
-- The daily allowance and the conversion history are stored per character in
-- the database. Create the tables and procedures first with the script in
-- Data\Plugins\LuaAPI\SQL Scripts\CoinExchange.sql.
--
--   state   IGC_CoinExchange_LoadDaily / LoadHistory / AddConversion over DB.QueryDS
--   currency  Coin.Get / Coin.Charge / Coin.Add
--
-- Loads are async: the window opens with whatever is cached, and refreshes when
-- the DataServer answers (see CoinExchangeDB below, routed from CallbacksDB.lua).
------------------------------------------------------------------

local S = UIProtocol.Exchange

local MAX_HISTORY = 20

-- DataServer query numbers - named in Defines\Enums.lua
local Q_LOAD_DAILY = Enums.QueryDS.EXCHANGE_LOAD_DAILY
local Q_LOAD_HISTORY = Enums.QueryDS.EXCHANGE_LOAD_HISTORY
local Q_SAVE = Enums.QueryDS.EXCHANGE_SAVE

-- The system's own state, under the same name the client uses for its half.
Exchange = {
	rate = 10, -- 10 WCoin -> 1 Ruud
	DAILY_LIMIT = 100000, -- WCoin one character may convert per day
	used = {}, -- [CharacterId] = { day = 'YYYY-MM-DD', wcoin = N }
	history = {}, -- [CharacterId] = { { date, spent, gained }, ... }
}

local function CharId(oPlayer)
	if oPlayer == nil or oPlayer.userData == nil then
		return 0
	end

	return oPlayer.userData.CharacterId or 0
end

-- Today's converted total, from the per-character cache filled by the load.
-- The cache carries the day it belongs to, so it reads as 0 after midnight
-- without a separate rollover pass.
function Exchange.UsedToday(oPlayer)
	local rec = Exchange.used[CharId(oPlayer)]

	if rec == nil or rec.day ~= os.date("%Y-%m-%d") then
		return 0
	end

	return rec.wcoin
end

------------------------------------------------------------------
-- Database: load on open, persist on convert
------------------------------------------------------------------
-- Global so the DataServer callback in CallbacksDB.lua can reach it.

CoinExchangeDB = {}

local pendDaily = {} -- [playerIndex] = { charId = , value = 0 }
local pendHist = {} -- [playerIndex] = { charId = , rows = { [key] = {..} } }

local function RequestLoad(oPlayer)
	local charId = CharId(oPlayer)

	if charId <= 0 then
		return
	end

	pendDaily[oPlayer.Index] = { charId = charId, value = 0 }
	pendHist[oPlayer.Index] = { charId = charId, rows = {} }

	DB.QueryDS(oPlayer.Index, Q_LOAD_DAILY,
		string.format("EXEC IGC_CoinExchange_LoadDaily %d", charId))
	DB.QueryDS(oPlayer.Index, Q_LOAD_HISTORY,
		string.format("EXEC IGC_CoinExchange_LoadHistory %d, %d", charId, MAX_HISTORY))
end

-- One call per column per row. A second packet is a separate async task and can
-- overtake the first, so each value goes into its own (packet, row) bucket and
-- order stops mattering.
function CoinExchangeDB.OnRow(iPlayerIndex, iQuery, iPacket, iRow, oRow)
	if iQuery == Q_LOAD_DAILY then
		local p = pendDaily[iPlayerIndex]

		if p ~= nil and oRow:GetColumnName() == "UsedWCoin" then
			p.value = tonumber(oRow:GetValue()) or 0
		end

	elseif iQuery == Q_LOAD_HISTORY then
		local p = pendHist[iPlayerIndex]

		if p ~= nil then
			local key = iPacket * 1000 + iRow
			p.rows[key] = p.rows[key] or {}
			p.rows[key][oRow:GetColumnName()] = oRow:GetValue()
		end
	end
end

local sendRates    -- forward declarations
local sendHistory

function CoinExchangeDB.OnComplete(iPlayerIndex, iQuery)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)

	if iQuery == Q_LOAD_DAILY then
		local p = pendDaily[iPlayerIndex]
		pendDaily[iPlayerIndex] = nil

		if p == nil then
			return
		end

		Exchange.used[p.charId] = { day = os.date("%Y-%m-%d"), wcoin = p.value }

		if oPlayer ~= nil and CharId(oPlayer) == p.charId then
			Exchange.SendTicker(oPlayer)
		end

	elseif iQuery == Q_LOAD_HISTORY then
		local p = pendHist[iPlayerIndex]
		pendHist[iPlayerIndex] = nil

		if p == nil then
			return
		end

		-- SQL returns newest first; the (packet, row) key preserves that order, so
		-- sort the keys before building the list pairs() would otherwise scramble.
		local keys = {}
		for k in pairs(p.rows) do
			keys[#keys + 1] = k
		end
		table.sort(keys)

		local list = {}
		for _, k in ipairs(keys) do
			local row = p.rows[k]
			list[#list + 1] = {
				date = row.ConvertLabel or "",
				spent = tonumber(row.SpentWCoin) or 0,
				gained = tonumber(row.GainedRuud) or 0,
			}
		end

		Exchange.history[p.charId] = list

		if oPlayer ~= nil and CharId(oPlayer) == p.charId then
			sendHistory(oPlayer)
		end
	end
end

------------------------------------------------------------------
-- Payload builders
------------------------------------------------------------------

sendRates = function(oPlayer)
	local w = UIPacket.Writer()
	w:dword(Exchange.rate)
	w:dword(Coin.Get(oPlayer, Enums.CoinType.WCOIN))
	w:dword(Coin.Get(oPlayer, Enums.CoinType.RUUD))

	UIWindow.Send(oPlayer, S.id, S.RATE, S.RESULT.OK, w)
end

sendHistory = function(oPlayer)
	local list = Exchange.history[CharId(oPlayer)] or {}
	local w = UIPacket.Writer()

	w:byte(#list)

	for _, entry in ipairs(list) do
		w:text(entry.date)
		w:dword(entry.spent)
		w:dword(entry.gained)
	end

	UIWindow.Send(oPlayer, S.id, S.HISTORY, S.RESULT.OK, w)
end

-- Prepend to the cached history so the window updates without waiting for a
-- reload; the row it mirrors is what AddConversion wrote to the database.
local function remember(oPlayer, spent, gained)
	local charId = CharId(oPlayer)
	local list = Exchange.history[charId]

	if list == nil then
		list = {}
		Exchange.history[charId] = list
	end

	table.insert(list, 1, { date = os.date("%m-%d %H:%M"), spent = spent, gained = gained })

	while #list > MAX_HISTORY do
		table.remove(list)
	end
end

------------------------------------------------------------------
-- Window callbacks
------------------------------------------------------------------

-- Open verdict. Kick off the load and answer with what is cached; the load
-- refreshes the window when the DataServer replies.
UIWindow.OnOpen(S.id, function(oPlayer)
	RequestLoad(oPlayer)
	sendRates(oPlayer)
	sendHistory(oPlayer)
	return 0
end)

UIWindow.On(S.id, S.CONVERT, function(oPlayer, reader)
	local amount = reader:dword()

	-- the field limits what a player can type, not what can arrive
	if amount < S.MIN or amount > S.MAX or amount % Exchange.rate ~= 0 then
		UIWindow.Send(oPlayer, S.id, S.CONVERT, S.RESULT.BAD_AMOUNT)
		return
	end

	if Exchange.UsedToday(oPlayer) + amount > Exchange.DAILY_LIMIT then
		UIWindow.Send(oPlayer, S.id, S.CONVERT, S.RESULT.LIMIT)
		return
	end

	-- charge first: a failure here costs the player nothing
	if Coin.Charge(oPlayer, Enums.CoinType.WCOIN, amount) == false then
		UIWindow.Send(oPlayer, S.id, S.CONVERT, S.RESULT.NO_FUNDS)
		return
	end

	local gained = amount // Exchange.rate
	Coin.Add(oPlayer, Enums.CoinType.RUUD, gained)

	-- bump today's cached counter, keyed to today so midnight resets it
	local charId = CharId(oPlayer)
	local rec = Exchange.used[charId]
	local today = os.date("%Y-%m-%d")

	if rec == nil or rec.day ~= today then
		rec = { day = today, wcoin = 0 }
		Exchange.used[charId] = rec
	end

	rec.wcoin = rec.wcoin + amount

	remember(oPlayer, amount, gained)

	-- persist: bumps the daily counter and appends a history row (fire and forget)
	DB.QueryDS(oPlayer.Index, Q_SAVE,
		string.format("EXEC IGC_CoinExchange_AddConversion %d, %d, %d", charId, amount, gained))

	UIWindow.Send(oPlayer, S.id, S.CONVERT, S.RESULT.OK)
	sendRates(oPlayer)
	sendHistory(oPlayer)
	Exchange.SendTicker(oPlayer)
end)

------------------------------------------------------------------
-- General channel: the HUD ticker, which has no window of its own
------------------------------------------------------------------

function Exchange.SendTicker(oPlayer)
	local w = UIPacket.Writer()
	w:dword(Exchange.rate)
	w:dword(Exchange.UsedToday(oPlayer))
	w:dword(Exchange.DAILY_LIMIT)

	Net.Send(oPlayer, S.TICKER_OP, w)
end

Net.On(S.TICKER_OP, function(oPlayer, reader)
	Exchange.SendTicker(oPlayer)
end)
