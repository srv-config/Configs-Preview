--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Main.lua - Server Script Entry Point
------------------------------------------------------------------
-- Initializes core server functionality and timer callbacks.
-- Modules auto-reload when scripts refresh.
------------------------------------------------------------------

local BASE = "Plugins\\LuaAPI\\"

-- Load global dependencies (order matters)
LoadScript(BASE .. "Defines\\Helpers.lua")
LoadScript(BASE .. "Defines\\Constants.lua")
LoadScript(BASE .. "Defines\\Enums.lua")
LoadScript(BASE .. "Defines\\UIProtocol.lua")
LoadScript(BASE .. "EventHandler.lua")
LoadScript(BASE .. "Callbacks.lua")
LoadScript(BASE .. "CallbacksDB.lua")
LoadScript(BASE .. "CallbacksUI.lua")
LoadScript(BASE .. "Includes\\TimerHelpers.lua")
LoadScript(BASE .. "Includes\\EventScheduler.lua")
LoadScript(BASE .. "Includes\\SimpleXml.lua")
LoadScript(BASE .. "Includes\\UIPacket.lua")
LoadScript(BASE .. "Includes\\UIWindow.lua")
LoadScript(BASE .. "Includes\\Net.lua")
LoadScript(BASE .. "Timers.lua")

-- Lua UI windows - one script per window, routed by UIWindow.
-- Unlike the client, the server does not scan this folder: every window
-- needs its own line here or it silently will not register.
LoadScript(BASE .. "Windows\\CoinExchange.lua")

-- Initialize event scheduler
EventScheduler.Initialize()
