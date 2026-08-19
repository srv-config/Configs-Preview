--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- UI Callbacks - Lua Windows and the General Channel
------------------------------------------------------------------
-- These entry points only route; put window logic in the window's
-- own script under Windows\:
--
--   UIWindow.OnOpen(id, function(oPlayer, iParam)
--       return 0                              -- 0 opens the window
--   end)
--
--   UIWindow.On(id, action, function(oPlayer, reader, iParam)
--       local amount = reader:dword()
--       local w = UIPacket.Writer()
--       w:byte(1):dword(amount)
--       UIWindow.Send(oPlayer, id, action, 0, w)
--   end)
--
-- Non-window traffic uses the general channel, addressed by an opcode
-- instead of a window id:
--
--   Net.On(op, function(oPlayer, reader) ... end)
--   Net.Send(oPlayer, op, writer)
--
-- Wire format and result codes live in Defines\UIProtocol.lua.
-- Anything that creates or deletes items must first check
-- Player.CheckItemAction(oPlayer) == Enums.ItemActionBlock.OK.
------------------------------------------------------------------

-- Called when the client asks to open a Lua window (Sync)
-- Return 0 to let the window open, anything else keeps it closed.
function onLuaWindowOpen(oPlayer, windowId, iParam)
	return UIWindow.DispatchOpen(oPlayer, windowId, iParam)
end

-- Called when an open Lua window sends an action (Async)
function onLuaWindowUse(oPlayer, windowId, iParam, data)
	UIWindow.DispatchUse(oPlayer, windowId, iParam, data)
end

-- Called when a packet arrives on the general channel (Async)
function onLuaPacket(oPlayer, opcode, data)
	Net.Dispatch(oPlayer, opcode, data)
end
