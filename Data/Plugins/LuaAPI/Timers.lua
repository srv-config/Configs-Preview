--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Timer Callbacks (called by C++ engine)
------------------------------------------------------------------

-- Called every second
function onTimerProcessSecond()
	EventScheduler.ProcessEvents()
end

-- Called every minute
function onTimerProcessMinute()
	-- Add minute-based processing here
end

-- Called every hour
function onTimerProcessHour()
	-- Add hour-based processing here
end

-- Called on day change (midnight)
function onTimerProcessDayChange()
	-- Add day-change processing here
end
