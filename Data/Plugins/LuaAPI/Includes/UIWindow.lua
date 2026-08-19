--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- UIWindow.lua - Router for the Lua UI Window Channel
------------------------------------------------------------------
-- Server counterpart of the client's UI\Net.lua. It holds what every
-- window registered and routes each call to the right handler, so a
-- new window is a new script and nothing more.
--
-- The two globals the engine actually calls - onLuaWindowOpen and
-- onLuaWindowUse - live in CallbacksUI.lua with the rest of the
-- callbacks; they forward straight to the dispatchers at the bottom
-- of this file.
--
--   UIWindow.OnOpen(id, function(oPlayer, iParam) return 0 end)
--   UIWindow.On(id, action, function(oPlayer, reader, iParam) ... end)
--   UIWindow.Send(oPlayer, id, action, result, writer)
--
-- Open verdict: return 0 to let the client show the window, anything
-- else keeps it closed (opens only on result 0).
------------------------------------------------------------------

UIWindow = {}

local useHandlers = {}    -- [windowId][iParam | "default"] = fn
local openHandlers = {}   -- [windowId] = fn

-- Register a use handler. Omit iParam (pass the function as 2nd arg) to make it
-- the window's fallback for any unrouted action.
function UIWindow.On(windowId, iParam, fn)
	if type(iParam) == "function" then
		fn, iParam = iParam, nil
	end

	useHandlers[windowId] = useHandlers[windowId] or {}
	useHandlers[windowId][iParam ~= nil and iParam or "default"] = fn
end

function UIWindow.OnOpen(windowId, fn)
	openHandlers[windowId] = fn
end

-- Answer (or push) over the window channel. `payload` is a UIPacket.Writer or nil.
function UIWindow.Send(oPlayer, windowId, iParam, result, payload)
	if oPlayer == nil then
		return
	end

	UI.SendWindowUse(oPlayer.Index, windowId, iParam, result or 0, payload and payload:build() or nil)
end

------------------------------------------------------------------
-- Dispatchers - called from CallbacksUI.lua
------------------------------------------------------------------

function UIWindow.DispatchOpen(oPlayer, windowId, iParam)
	local fn = openHandlers[windowId]

	if fn == nil then
		return 0
	end

	local ok, result = pcall(fn, oPlayer, iParam)

	if ok == false then
		Log.Add(string.format("[LuaUI] Window %d open handler error: %s", windowId, tostring(result)))
		return 1
	end

	return result or 0
end

function UIWindow.DispatchUse(oPlayer, windowId, iParam, data)
	local window = useHandlers[windowId]

	if window == nil then
		return
	end

	local fn = window[iParam] or window["default"]

	if fn == nil then
		return
	end

	local ok, err = pcall(fn, oPlayer, UIPacket.Reader(data), iParam)

	if ok == false then
		Log.Add(string.format("[LuaUI] Window %d action %d handler error: %s", windowId, iParam, tostring(err)))
	end
end
