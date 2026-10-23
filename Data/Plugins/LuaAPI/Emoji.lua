--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Emoji.lua - the server's switch for chat emoji
------------------------------------------------------------------
-- Client half: Data\Custom\Scripts\UI\Windows\Emoji.lua
--
-- The server does not handle emoji: the chat carries the codes as plain
-- text and the client draws the pictures. This script only tells the
-- client, which asks once it is in game, whether Config\Emoji.xml has
-- them on.
------------------------------------------------------------------

Emoji = Emoji or {}

local CONFIG = "..\\Data\\Plugins\\LuaAPI\\Config\\Emoji.xml"
-- General channel opcode, the same number as CONFIG_OP in the client's UI\Windows\Emoji.lua
local CONFIG_OP = 130

Emoji.enabled = true

function Emoji.LoadConfig()
	local root, err = SimpleXml.LoadFile(CONFIG)

	if root == nil then
		Log.Add("[Emoji] " .. tostring(err) .. " - emoji stay on")
		Emoji.enabled = true
		return
	end

	Emoji.enabled = (tonumber(root.attr.Enable or "1") or 1) ~= 0
end

function Emoji.SendConfig(oPlayer)
	local w = UIPacket.Writer()
	w:byte(Emoji.enabled and 1 or 0)
	Net.Send(oPlayer, CONFIG_OP, w)
end

Net.On(CONFIG_OP, function(oPlayer, reader)
	Emoji.SendConfig(oPlayer)
end)

Emoji.LoadConfig()
