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
-- Convenience wrappers and helpers for common timer patterns.
-- Includes delays, countdowns, debounce, throttle, and timeouts.
------------------------------------------------------------------

TimerHelpers = {}

------------------------------------------------------------------
-- Delayed execution (convenience wrapper)
------------------------------------------------------------------

-- Execute function after delay (seconds)
function TimerHelpers.Delay(seconds, callback)
	return Timer.Create(seconds * 1000, callback)
end

-- Example: TimerHelpers.Delay(5, function() print("5 seconds") end)

------------------------------------------------------------------
-- Repeating execution (convenience wrapper)
------------------------------------------------------------------

-- Execute function repeatedly (seconds interval)
function TimerHelpers.Repeat(seconds, callback)
	return Timer.CreateRepeating(seconds * 1000, callback)
end

-- Example: TimerHelpers.Repeat(1, function() print("Every second") end)

------------------------------------------------------------------
-- Countdown timer with callback
------------------------------------------------------------------

function TimerHelpers.Countdown(seconds, onTick, onComplete)
	local remaining = seconds
	
	local timerId = Timer.CreateRepeating(1000, function()
		if remaining > 0 then
			if onTick then
				onTick(remaining)
			end
			remaining = remaining - 1
		else
			Timer.Remove(timerId)
			if onComplete then
				onComplete()
			end
		end
	end)
	
	return timerId
end

-- Example:
-- TimerHelpers.Countdown(10, 
--     function(remaining) print(remaining .. " seconds left") end,
--     function() print("Done!") end
-- )

------------------------------------------------------------------
-- Schedule (execute at specific intervals with limit)
------------------------------------------------------------------

function TimerHelpers.Schedule(intervalSeconds, maxExecutions, callback)
	local execCount = 0
	
	local timerId = Timer.CreateRepeating(intervalSeconds * 1000, function()
		execCount = execCount + 1
		
		if callback then
			callback(execCount)
		end
		
		if execCount >= maxExecutions then
			Timer.Remove(timerId)
		end
	end)
	
	return timerId
end

-- Example: Execute 5 times, every 2 seconds
-- TimerHelpers.Schedule(2, 5, function(count) 
--     print("Execution " .. count) 
-- end)

------------------------------------------------------------------
-- Debounce (prevent rapid repeated execution)
------------------------------------------------------------------

TimerHelpers.DebounceTimers = {}

function TimerHelpers.Debounce(key, delayMs, callback)
	-- Cancel existing timer for this key
	if TimerHelpers.DebounceTimers[key] then
		Timer.Remove(TimerHelpers.DebounceTimers[key])
	end
	
	-- Create new timer
	local timerId = Timer.Create(delayMs, function()
		TimerHelpers.DebounceTimers[key] = nil
		if callback then
			callback()
		end
	end)
	
	TimerHelpers.DebounceTimers[key] = timerId
	return timerId
end

-- Example: Prevent spam clicking
-- function onButtonClick(player)
--     TimerHelpers.Debounce("click_" .. player.Index, 1000, function()
--         ProcessClick(player)
--     end)
-- end

------------------------------------------------------------------
-- Throttle (limit execution frequency)
------------------------------------------------------------------

TimerHelpers.ThrottleState = {}

function TimerHelpers.Throttle(key, intervalMs, callback)
	local state = TimerHelpers.ThrottleState[key]
	
	if not state or not Timer.Exists(state.timerId) then
		-- First call or timer expired - execute immediately
		if callback then
			callback()
		end
		
		-- Create cooldown timer
		local timerId = Timer.Create(intervalMs, function()
			TimerHelpers.ThrottleState[key] = nil
		end)
		
		TimerHelpers.ThrottleState[key] = { timerId = timerId }
		return true
	end
	
	-- Still in cooldown - ignore
	return false
end

-- Example: Limit chat frequency
-- function onPlayerChat(player, message)
--     if TimerHelpers.Throttle("chat_" .. player.Index, 2000, function()
--         BroadcastMessage(player, message)
--     end) then
--         -- Message sent
--     else
--         Message.Send(0, player.Index, 0, "Please wait before chatting again")
--     end
-- end

------------------------------------------------------------------
-- Timeout (auto-cancel if condition not met)
------------------------------------------------------------------

function TimerHelpers.Timeout(timeoutMs, condition, onSuccess, onTimeout)
	local checkInterval = math.min(100, timeoutMs / 10)  -- Check 10 times or every 100ms
	local elapsed = 0
	
	local timerId = Timer.CreateRepeating(checkInterval, function()
		elapsed = elapsed + checkInterval
		
		if condition() then
			-- Condition met - success
			Timer.Remove(timerId)
			if onSuccess then
				onSuccess()
			end
		elseif elapsed >= timeoutMs then
			-- Timeout reached
			Timer.Remove(timerId)
			if onTimeout then
				onTimeout()
			end
		end
	end)
	
	return timerId
end

-- Example: Wait for player to enter area
-- TimerHelpers.Timeout(30000, 
--     function() return IsPlayerInArea(player, x, y, range) end,
--     function() GiveReward(player) end,
--     function() Message.Send(0, player.Index, 0, "Timeout!") end
-- )