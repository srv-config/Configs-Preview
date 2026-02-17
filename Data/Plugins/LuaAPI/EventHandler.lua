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
-- Dispatch Tables
------------------------------------------------------------------

local noticeHandlers = {}  -- Pre-event warning handlers
local startHandlers = {}   -- Event start handlers
local endHandlers = {}     -- Event end handlers

------------------------------------------------------------------
-- Dispatchers
------------------------------------------------------------------

-- Dispatch event notice (called before event starts)
function EventHandlers.OnEventNotice(eventType)
	local handler = noticeHandlers[eventType]
	if handler then
		handler()
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

noticeHandlers[Enums.EventType.SAMPLE_EVENT_1] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_1)
	Message.Send(0, -1, 0, name .. " will start soon!")
	Log.Add(string.format("[Notice] %s starting soon", name))
end

noticeHandlers[Enums.EventType.SAMPLE_EVENT_2] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_2)
	Message.Send(0, -1, 0, name .. " will open soon!")
	Log.Add(string.format("[Notice] %s opening soon", name))
end

noticeHandlers[Enums.EventType.SAMPLE_EVENT_3] = function()
	local name = Scheduler.GetEventName(Enums.EventType.SAMPLE_EVENT_3)
	Message.Send(0, -1, 0, name .. " starting soon!")
	Log.Add(string.format("[Notice] %s starting soon", name))
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

