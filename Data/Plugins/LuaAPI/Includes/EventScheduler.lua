--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- EventScheduler.lua - Event Scheduling Logic
------------------------------------------------------------------
-- Manages event timing, notices, and delegates to event handlers.
-- Automatically throttles to minute-precision unless events
-- require second-precision timing.
------------------------------------------------------------------

EventScheduler = {}

------------------------------------------------------------------
-- Local State
------------------------------------------------------------------

-- True if any event requires second-precision (Second != -1)
local needsSecondPrecision = false

-- Timestamp of last minute check (for throttling)
local lastMinuteCheck = 0

------------------------------------------------------------------
-- Public Functions
------------------------------------------------------------------

-- Initialize the event scheduler
-- Loads XML configuration and processes events
function EventScheduler.Initialize()
	-- Load events from XML configuration
	Scheduler.LoadFromXML("Plugins\\LuaAPI\\Config\\EventScheduler.xml")
	
	-- Check if scheduler requires second-precision timing
	-- If any event has a specific second value (Second != -1), the scheduler will check events every second
	-- Otherwise, it throttles to once per minute for better performance
	needsSecondPrecision = Scheduler.HasSecondPrecisionEvents()
	lastMinuteCheck = Timer.GetTick()
	
	local count = Scheduler.GetEventCount()
	-- Log.Add(string.format("[LuaEventScheduler] Loaded %d events", count))
end

-- Process scheduled events
-- Called every second from Main.lua timer
-- Automatically throttles to once per minute if second-precision not needed
function EventScheduler.ProcessEvents()
	-- Throttle to once per minute if second precision not needed
	if not needsSecondPrecision then
		local currentTick = Timer.GetTick()
		local elapsed = currentTick - lastMinuteCheck
		
		if elapsed < 60000 then
			return
		end
		
		lastMinuteCheck = currentTick
	end
	
	-- Process event notices (pre-warnings) - now returns EventNotice with time
	local noticeEvents = Scheduler.CheckEventNotices()
	for _, notice in ipairs(noticeEvents) do
		EventHandlers.OnEventNotice(notice.type, notice.secondsRemaining)
	end
	
	-- Process event starts
	local triggeredEvents = Scheduler.CheckEventStarts()
	for _, eventType in ipairs(triggeredEvents) do
		EventHandlers.OnEventStart(eventType)
	end
	
	-- Process event ends (based on duration)
	local endedEvents = Scheduler.CheckEventEnds()
	for _, eventType in ipairs(endedEvents) do
		EventHandlers.OnEventEnd(eventType)
	end
end