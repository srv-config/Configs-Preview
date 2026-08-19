--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Net.lua - Router for the General Lua Channel
------------------------------------------------------------------
-- There are two channels and this is the general one:
--
--   windows   addressed by window id - see Includes\UIWindow.lua
--   general   addressed by an opcode - this file
--
-- Use it for systems with no window of their own: HUD feeds,
-- notifications, live counters, anything addressed by an opcode
-- rather than by a window id.
--
--   Net.On(op, function(oPlayer, reader) ... end)
--   Net.Send(oPlayer, op, writer)
--
-- The client side is Net.OnPacket(op, fn) / Net.CreatePacket(op),
-- with the same payload primitives as the window channel
-- (Includes\UIPacket.lua).
------------------------------------------------------------------

Net = Net or {}

local handlers = {}   -- [opcode] = fn

function Net.On(opcode, fn)
	handlers[opcode] = fn
end

function Net.Send(oPlayer, opcode, payload)
	if oPlayer == nil then
		return
	end

	Net.SendPacket(oPlayer.Index, opcode, payload and payload:build() or nil)
end

------------------------------------------------------------------
-- Dispatcher - called from CallbacksUI.lua
------------------------------------------------------------------

function Net.Dispatch(oPlayer, opcode, data)
	local fn = handlers[opcode]

	if fn == nil then
		return
	end

	local ok, err = pcall(fn, oPlayer, UIPacket.Reader(data))

	if ok == false then
		Log.Add(string.format("[LuaNet] Opcode %d handler error: %s", opcode, tostring(err)))
	end
end
