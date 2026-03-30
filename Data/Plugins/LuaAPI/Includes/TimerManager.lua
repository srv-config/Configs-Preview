--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- TimerManager.lua - Simple Named Timer Storage
------------------------------------------------------------------
-- Stores timer IDs with string names for easy access across files.
-- Automatically removes old timer when same name is reused.
------------------------------------------------------------------

TimerManager = TimerManager or {}

------------------------------------------------------------------
-- Private Storage
------------------------------------------------------------------

-- Single storage: name -> timerId
local timers = {}

------------------------------------------------------------------
-- Functions
------------------------------------------------------------------

-- Store timer with name (auto-removes old timer with same name)
-- @param name: Timer name (string)
-- @param timerId: Timer ID from Timer.Create/CreateRepeating/RepeatNTimes
function TimerManager.Set(name, timerId)
	-- Remove old timer if exists
	if timers[name] then
		Timer.Remove(timers[name])
	end
	
	timers[name] = timerId
end

-- Get timer ID by name
-- @param name: Timer name
-- @return: Timer ID or nil if not found
function TimerManager.Get(name)
	return timers[name]
end

-- Remove timer by name
-- @param name: Timer name
-- @return: true if removed, false if not found
function TimerManager.Remove(name)
	if timers[name] then
		Timer.Remove(timers[name])
		timers[name] = nil
		return true
	end
	return false
end

-- Check if timer exists
-- @param name: Timer name
-- @return: true if exists
function TimerManager.Exists(name)
	return timers[name] ~= nil
end

-- Remove all timers
function TimerManager.Clear()
	for name, timerId in pairs(timers) do
		Timer.Remove(timerId)
	end
	timers = {}
end

-- Get count of stored timers
-- @return: Number of timers
function TimerManager.Count()
	local count = 0
	for _ in pairs(timers) do
		count = count + 1
	end
	return count
end

-- List all timer names (for debugging)
-- @return: Array of timer names
function TimerManager.List()
	local names = {}
	for name, _ in pairs(timers) do
		table.insert(names, name)
	end
	return names
end