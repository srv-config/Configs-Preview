--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- EventHandler.lua - Event Implementation Handlers
------------------------------------------------------------------
-- Contains all event handler implementations for scheduled events.
-- Uses dispatch tables for O(1) event lookup and execution.
-- Add new events by creating entries in the appropriate handler table.
------------------------------------------------------------------

EventHandlers = {}

------------------------------------------------------------------
-- Helper Functions
------------------------------------------------------------------

-- Format time remaining in human-readable format
local function FormatTimeRemaining(seconds)
	if seconds < 60 then
		-- Less than 1 minute: show seconds
		return string.format("%d second%s", seconds, seconds ~= 1 and "s" or "")

	elseif seconds < 3600 then
		-- Less than 1 hour: show minutes and seconds
		local minutes = math.floor(seconds / 60)
		local secs = seconds % 60

		if secs == 0 then
			return string.format("%d minute%s", minutes, minutes ~= 1 and "s" or "")
		else
			return string.format("%d minute%s %d second%s", 
				minutes, minutes ~= 1 and "s" or "",
				secs, secs ~= 1 and "s" or "")
		end

	else
		-- 1 hour or more: show hours and minutes
		local hours = math.floor(seconds / 3600)
		local minutes = math.floor((seconds % 3600) / 60)

		if minutes == 0 then
			return string.format("%d hour%s", hours, hours ~= 1 and "s" or "")
		else
			return string.format("%d hour%s %d minute%s", 
				hours, hours ~= 1 and "s" or "",
				minutes, minutes ~= 1 and "s" or "")
		end
	end
end

------------------------------------------------------------------
-- Dispatch Tables
------------------------------------------------------------------

local noticeHandlers = {}  -- Pre-event warning handlers
local startHandlers = {}   -- Event start handlers
local endHandlers = {}     -- Event end handlers

------------------------------------------------------------------
-- Dispatchers
------------------------------------------------------------------

-- Dispatch event notice (called before event starts)
-- Arguments:
--   eventType - The event type ID
--   timeRemaining - Seconds until event starts
function EventHandlers.OnEventNotice(eventType, timeRemaining)
	local handler = noticeHandlers[eventType]
	if handler then
		handler(timeRemaining)
	end
end

-- Dispatch event start
function EventHandlers.OnEventStart(eventType)
	local handler = startHandlers[eventType]
	if handler then
		handler()
	end
end

-- Dispatch event end (after duration expires)
function EventHandlers.OnEventEnd(eventType)
	local handler = endHandlers[eventType]
	if handler then
		handler()
	end
end

------------------------------------------------------------------
-- Notice Handlers (Pre-Event Warnings)
------------------------------------------------------------------

noticeHandlers[Enums.EventType.SAMPLE_EVENT_1] = function(timeRemaining)
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_1)
	local timeStr = FormatTimeRemaining(timeRemaining)
	Message.Send(0, -1, 0, name .. " starts in " .. timeStr .. "!")
	Log.Add(string.format("[Notice] %s starting in %s", name, timeStr))
end

noticeHandlers[Enums.EventType.SAMPLE_EVENT_2] = function(timeRemaining)
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_2)
	local timeStr = FormatTimeRemaining(timeRemaining)
	Message.Send(0, -1, 0, name .. " opens in " .. timeStr .. "!")
	Log.Add(string.format("[Notice] %s opening in %s", name, timeStr))
end

noticeHandlers[Enums.EventType.SAMPLE_EVENT_3] = function(timeRemaining)
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_3)
	local timeStr = FormatTimeRemaining(timeRemaining)
	Message.Send(0, -1, 0, name .. " starts in " .. timeStr .. "!")
	Log.Add(string.format("[Notice] %s starting in %s", name, timeStr))
end

------------------------------------------------------------------
-- Start Handlers (Event Begin)
------------------------------------------------------------------

startHandlers[Enums.EventType.SAMPLE_EVENT_1] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_1)
	Message.Send(0, -1, 1, name .. " has started!")
	Log.Add(string.format("[Event] %s started", name))
end

startHandlers[Enums.EventType.SAMPLE_EVENT_2] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_2)
	Message.Send(0, -1, 1, name .. " is now open!")
	Log.Add(string.format("[Event] %s opened", name))
end

startHandlers[Enums.EventType.SAMPLE_EVENT_3] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_3)
	Message.Send(0, -1, 1, name .. " - Double EXP!")
	Log.Add(string.format("[Event] %s started", name))
end

------------------------------------------------------------------
-- End Handlers (Event Completion)
------------------------------------------------------------------

endHandlers[Enums.EventType.SAMPLE_EVENT_1] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_1)
	Message.Send(0, -1, 1, name .. " has ended!")
	Log.Add(string.format("[Event] %s ended", name))
end

endHandlers[Enums.EventType.SAMPLE_EVENT_2] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_2)
	Message.Send(0, -1, 1, name .. " has closed!")
	Log.Add(string.format("[Event] %s closed", name))
end

endHandlers[Enums.EventType.SAMPLE_EVENT_3] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_3)
	Message.Send(0, -1, 1, name .. " has ended!")
	Log.Add(string.format("[Event] %s ended", name))
end