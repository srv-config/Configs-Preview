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
-- Modules auto-reload when scripts refresh from C++.
------------------------------------------------------------------

local BASE = "Plugins\\LuaAPI\\"

-- Load global dependencies (order matters)
LoadScript(BASE .. "Defines\\Helpers.lua")
LoadScript(BASE .. "Defines\\Constants.lua")
LoadScript(BASE .. "Defines\\Enums.lua")
LoadScript(BASE .. "EventHandler.lua")
LoadScript(BASE .. "Callbacks.lua")
LoadScript(BASE .. "Includes\\TimerHelpers.lua")
LoadScript(BASE .. "Includes\\EventScheduler.lua")
LoadScript(BASE .. "Timers.lua")

-- Initialize event scheduler
EventScheduler.Initialize()
