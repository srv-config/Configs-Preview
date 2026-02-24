--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- TimerHelpers.lua - Timer Utility Functions
------------------------------------------------------------------
-- Convenience wrappers for common timer patterns.
-- Provides seconds-based API and patterns like debounce, throttle,
-- countdown, timeout, and retry with automatic cleanup.
------------------------------------------------------------------

TimerHelpers = {}

------------------------------------------------------------------
-- Delayed execution (seconds convenience)
------------------------------------------------------------------

-- Execute function after delay (seconds)
-- @param seconds: Delay in seconds
-- @param name: REQUIRED timer name (string)
-- @param callback: Function to execute
-- @return: Timer ID or -1 on error
function TimerHelpers.Delay(seconds, name, callback)
	return Timer.Create(seconds * 1000, name, callback)
end

-- Example: 
-- TimerHelpers.Delay(5, "NoticeTimer", function() 
--     Log.Add("5 seconds have passed") 
-- end)

------------------------------------------------------------------
-- Repeating execution (seconds convenience)
------------------------------------------------------------------

-- Execute function repeatedly (seconds interval)
-- @param seconds: Interval in seconds
-- @param name: REQUIRED timer name (string)
-- @param callback: Function to execute
-- @param aliveTimeSeconds: Optional - auto-remove after this many seconds
-- @return: Timer ID or -1 on error
function TimerHelpers.Repeat(seconds, name, callback, aliveTimeSeconds)
	local aliveTimeMs = aliveTimeSeconds and (aliveTimeSeconds * 1000) or -1
	return Timer.CreateRepeating(seconds * 1000, name, callback, aliveTimeMs)
end

-- Example:
-- TimerHelpers.Repeat(1, "HealthRegen", function()
--     Log.Add("Tick")
-- end)
--
-- With auto-remove after 60 seconds:
-- TimerHelpers.Repeat(1, "TempBuff", function()
--     -- Your repeating logic here
-- end, 60)

------------------------------------------------------------------
-- Countdown timer
------------------------------------------------------------------

-- Execute countdown with per-second callback
-- @param seconds: Countdown duration
-- @param name: REQUIRED timer name (string)
-- @param onTick: Called each second with remaining time
-- @param onComplete: Called when countdown finishes
-- @return: Timer ID or -1 on error
function TimerHelpers.Countdown(seconds, name, onTick, onComplete)
	return Timer.RepeatNTimes(1000, name, seconds, function(current, total)
		local remaining = total - current + 1
		
		if onTick then
			onTick(remaining)
		end
		
		if current == total and onComplete then
			onComplete()
		end
	end)
end

-- Example:
-- TimerHelpers.Countdown(10, "EventCountdown",
--     function(remaining) 
--         Log.Add("Event starts in " .. remaining .. " seconds")
--     end,
--     function() 
--         Log.Add("Event started!")
--     end
-- )

------------------------------------------------------------------
-- Debounce (prevent rapid repeated execution)
------------------------------------------------------------------

-- Debounce a function call - restarts timer on each call
-- Only the last call executes after the delay period with no new calls
-- GameServer automatically removes old timer with same name
-- @param name: Unique debounce identifier (prefix added automatically)
-- @param delayMs: Delay in milliseconds
-- @param callback: Function to execute after delay
-- @return: Timer ID
function TimerHelpers.Debounce(name, delayMs, callback)
	return Timer.Create(delayMs, "Debounce_" .. name, callback)
end

-- Example: Prevent spam clicking
-- function onButtonClick(player)
--     TimerHelpers.Debounce("button_" .. player.Index, 1000, function()
--         Log.Add("Button clicked by player " .. player.Index)
--         -- Process click here
--     end)
-- end
-- 
-- Rapid clicks restart the timer each time.
-- Only the last click executes after 1 second of no new clicks.

------------------------------------------------------------------
-- Throttle (limit execution frequency)
------------------------------------------------------------------

-- Throttle function execution - ignores calls during cooldown period
-- First call executes immediately and starts cooldown
-- Subsequent calls during cooldown are ignored
-- @param name: Unique throttle identifier (prefix added automatically)
-- @param intervalMs: Cooldown period in milliseconds
-- @param callback: Function to execute (only if not in cooldown)
-- @return: true if executed, false if throttled
function TimerHelpers.Throttle(name, intervalMs, callback)
	local timerName = "Throttle_" .. name
	
	-- Check if still in cooldown period
	if Timer.ExistsByName(timerName) then
		return false  -- Throttled - ignore this call
	end
	
	-- Execute callback immediately
	if callback then
		callback()
	end
	
	-- Start cooldown period
	Timer.Create(intervalMs, timerName, function()
		-- Cooldown ended - timer automatically removed
	end)
	
	return true  -- Executed
end

-- Example: Limit chat frequency
-- function onPlayerChat(player, message)
--     if TimerHelpers.Throttle("chat_" .. player.Index, 2000, function()
--         Log.Add("Player " .. player.Index .. " sent: " .. message)
--         -- Broadcast message here
--     end) then
--         -- Message sent
--     else
--         Message.Send(0, player.Index, 0, "Please wait before chatting again")
--     end
-- end
-- 
-- First call executes immediately and starts 2 second cooldown.
-- Subsequent calls within 2 seconds are ignored.

------------------------------------------------------------------
-- Timeout (auto-cancel if condition not met)
------------------------------------------------------------------

-- Execute callback when condition is met, or timeout
-- Checks condition repeatedly until met or timeout reached
-- @param name: REQUIRED timer name (string)
-- @param timeoutMs: Maximum time to wait in milliseconds
-- @param condition: Function returning true when condition is met
-- @param onSuccess: Called when condition is met
-- @param onTimeout: Called when timeout is reached
-- @return: Timer ID or -1 on error
function TimerHelpers.Timeout(name, timeoutMs, condition, onSuccess, onTimeout)
	local checkInterval = math.min(100, timeoutMs / 10)  -- Check 10 times or every 100ms
	local elapsed = 0
	
	return Timer.CreateRepeating(checkInterval, name, function()
		elapsed = elapsed + checkInterval
		
		if condition() then
			-- Condition met - success
			Timer.RemoveByName(name)
			if onSuccess then
				onSuccess()
			end
		elseif elapsed >= timeoutMs then
			-- Timeout reached
			Timer.RemoveByName(name)
			if onTimeout then
				onTimeout()
			end
		end
	end, timeoutMs)  -- aliveTime prevents infinite execution
end

-- Example: Wait for player to enter area
-- local targetX, targetY, targetRange = 100, 100, 10
-- 
-- TimerHelpers.Timeout("PlayerAreaCheck", 30000,
--     function() 
--         -- Check if player is in area
--         local dx = player.X - targetX
--         local dy = player.Y - targetY
--         local distance = math.sqrt(dx * dx + dy * dy)
--         return distance <= targetRange
--     end,
--     function() 
--         Log.Add("Player reached area")
--         -- Give reward
--     end,
--     function() 
--         Message.Send(0, player.Index, 0, "You didn't reach the area in time!")
--     end
-- )

------------------------------------------------------------------
-- Retry with exponential backoff
------------------------------------------------------------------

-- Retry a function with exponential backoff until success or max attempts
-- Delay doubles after each failed attempt
-- @param name: REQUIRED timer name (string)
-- @param initialDelayMs: Initial delay in milliseconds
-- @param maxAttempts: Maximum number of attempts
-- @param operation: Function to execute, should return true on success
-- @param onSuccess: Called when operation succeeds
-- @param onFailure: Called when all attempts exhausted
-- @return: Timer ID or -1 on error
function TimerHelpers.RetryWithBackoff(name, initialDelayMs, maxAttempts, operation, onSuccess, onFailure)
	local attempt = 0
	local delay = initialDelayMs
	
	local function tryExecute()
		attempt = attempt + 1
		
		local success = operation(attempt, maxAttempts)
		
		if success then
			if onSuccess then
				onSuccess(attempt)
			end
		elseif attempt >= maxAttempts then
			if onFailure then
				onFailure(attempt)
			end
		else
			-- Schedule retry with exponential backoff
			delay = delay * 2
			Timer.Create(delay, name, tryExecute)
		end
	end
	
	return Timer.Create(initialDelayMs, name, tryExecute)
end

-- Example: Retry operation
-- TimerHelpers.RetryWithBackoff("RetryOperation", 1000, 5,
--     function(attempt, max)
--         Log.Add("Attempt " .. attempt .. "/" .. max)
--         -- Try operation, return true if successful
--         return math.random() > 0.7  -- Example: 30% success rate
--     end,
--     function(attempt)
--         Log.Add("Succeeded after " .. attempt .. " attempts")
--     end,
--     function(attempt)
--         Log.Add("Failed after " .. attempt .. " attempts")
--     end
-- )

------------------------------------------------------------------
-- Interval with jitter (prevent thundering herd)
------------------------------------------------------------------

-- Create repeating timer with random jitter
-- Prevents all servers/clients from executing at exact same time
-- @param baseIntervalMs: Base interval in milliseconds
-- @param jitterPercent: Jitter as percentage (0-100)
-- @param name: REQUIRED timer name (string)
-- @param callback: Function to execute
-- @param aliveTimeMs: Optional - auto-remove after this many ms
-- @return: Timer ID or -1 on error
function TimerHelpers.RepeatWithJitter(baseIntervalMs, jitterPercent, name, callback, aliveTimeMs)
	-- Calculate jitter range
	local jitterRange = baseIntervalMs * (jitterPercent / 100)
	local minInterval = baseIntervalMs - (jitterRange / 2)
	local maxInterval = baseIntervalMs + (jitterRange / 2)
	
	-- Random interval within range
	local interval = math.random(minInterval, maxInterval)
	
	return Timer.CreateRepeating(interval, name, callback, aliveTimeMs or -1)
end

-- Example: Periodic task with jitter
-- TimerHelpers.RepeatWithJitter(60000, 10, "PeriodicTask", function()
--     Log.Add("Task executed")
--     -- Your periodic task here
-- end)
-- Executes every 60s ±6s (54-66s)

------------------------------------------------------------------
-- Cancel multiple timers by pattern
------------------------------------------------------------------

-- Remove multiple timers with a common name pattern
-- @param namePattern: Base name pattern (e.g., "Player_" .. index)
-- @param suffixes: Array of timer name suffixes to append
function TimerHelpers.CancelTimers(namePattern, suffixes)
	for _, suffix in ipairs(suffixes) do
		local name = namePattern .. "_" .. suffix
		Timer.RemoveByName(name)
	end
end

-- Example: Clean up all player timers on disconnect
-- function onPlayerDisconnect(player)
--     local prefix = "Player_" .. player.Index
--     TimerHelpers.CancelTimers(prefix, {
--         "Buff",
--         "Debuff",
--         "Poison",
--         "Cooldown"
--     })
-- end

------------------------------------------------------------------
-- Helper: Generate unique timer name
------------------------------------------------------------------

-- Generate unique timer name with prefix and random suffix
-- @param prefix: Name prefix
-- @return: Unique name string
function TimerHelpers.UniqueName(prefix)
	return prefix .. "_" .. os.time() .. "_" .. math.random(1000, 9999)
end

-- Example:
-- local name = TimerHelpers.UniqueName("TempTimer")
-- Timer.Create(1000, name, function()
--     Log.Add("Unique timer fired")
-- end)

------------------------------------------------------------------
-- USAGE NOTES
------------------------------------------------------------------

-- Timer names are REQUIRED by the GameServer.
-- GameServer automatically removes old timer when you create a new one 
-- with the same name - no manual cleanup needed!
--
-- Best practices:
--   1. Use descriptive names: "EventCountdown" not "t1"
--   2. Use prefixes for related timers: "Player_123_Buff"
--   3. Use Debounce for actions that shouldn't spam
--   4. Use Throttle for rate-limited operations
--   5. Clean up timers on disconnect using CancelTimers()
--
-- Direct timer API:
--   Timer.Create(intervalMs, name, callback)
--   Timer.CreateRepeating(intervalMs, name, callback, aliveTimeMs)
--   Timer.RepeatNTimes(intervalMs, name, count, callback)
--   Timer.RemoveByName(name)
--   Timer.ExistsByName(name)
--   Timer.GetCount()
