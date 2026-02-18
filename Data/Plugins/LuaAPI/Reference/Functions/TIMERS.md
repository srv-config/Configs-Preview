# Timer API

## Overview
Create and manage named timers with automatic replacement and optional lifetime limits.

**Key Features:**
- **Named Timers**: All timers require unique names - creating a timer with an existing name automatically replaces the old one
- **Optional Lifetime**: Timers can auto-remove after a specified duration
- **Context-Safe**: Timers are automatically cleared when their context reloads

## Functions

### Timer.Create
Create a one-shot timer (fires once).

```lua
timerId = Timer.Create(interval, name, callback, [aliveTime])
```

**Parameters:**
- `interval` (number): Delay in milliseconds before firing
- `name` (string): REQUIRED unique timer name
- `callback` (function): Function to execute when timer fires
- `aliveTime` (number, optional): Auto-remove timer after this many ms (-1 or omit = no limit)

**Returns:** Timer ID or -1 on error

**Example:**
```lua
-- Simple one-shot timer (fires once after 5 seconds)
Timer.Create(5000, "welcome_message", function()
    Log.Add("Welcome timer fired!")
end)

-- One-shot timer with 30-second lifetime
Timer.Create(10000, "temp_buff_check", function()
    Log.Add("Checking buff...")
end, 30000)  -- Timer auto-removes after 30 seconds total
```

### Timer.CreateRepeating
Create a repeating timer (fires at regular intervals).

```lua
timerId = Timer.CreateRepeating(interval, name, callback, [aliveTime])
```

**Parameters:**
- `interval` (number): Interval between fires in milliseconds
- `name` (string): REQUIRED unique timer name
- `callback` (function): Function to execute on each fire
- `aliveTime` (number, optional): Auto-remove timer after this many ms (-1 or omit = no limit)

**Returns:** Timer ID or -1 on error

**Example:**
```lua
-- Infinite repeating timer (runs forever)
Timer.CreateRepeating(2000, "auto_save", function()
    Log.Add("[Server] Auto-saving...")
    -- Save logic here
end)

-- Repeating timer with 60-second lifetime (fires ~30 times then auto-removes)
Timer.CreateRepeating(2000, "temp_event", function()
    Log.Add("Event tick...")
end, 60000)
```

### Timer.RepeatNTimes
Create a timer that fires N times then auto-removes.

```lua
timerId = Timer.RepeatNTimes(interval, name, count, callback)
```

**Parameters:**
- `interval` (number): Interval between fires in milliseconds
- `name` (string): REQUIRED unique timer name
- `count` (number): Number of times to fire (must be > 0)
- `callback` (function): Function receiving (currentCount, maxCount) as parameters

**Returns:** Timer ID or -1 on error

**Example:**
```lua
-- Countdown timer (fires 10 times)
Timer.RepeatNTimes(1000, "countdown", 10, function(current, total)
    Log.Add(string.format("Countdown: %d/%d", current, total))
    if current == total then
        Log.Add("Event starting!")
    end
end)
```

### Timer.Remove
Remove timer by ID.

```lua
success = Timer.Remove(timerId)
```

**Example:**
```lua
local timerId = Timer.CreateRepeating(1000, "my_timer", function() end)
Timer.Remove(timerId)
```

### Timer.RemoveByName
Remove timer by name.

```lua
success = Timer.RemoveByName(name)
```

**Example:**
```lua
Timer.RemoveByName("auto_save")
```

### Timer.Exists
Check if timer exists by ID.

```lua
exists = Timer.Exists(timerId)
```

### Timer.ExistsByName
Check if timer exists by name.

```lua
exists = Timer.ExistsByName(name)
```

**Example:**
```lua
if not Timer.ExistsByName("auto_save") then
    Timer.CreateRepeating(60000, "auto_save", function()
        -- Save logic
    end)
end
```

### Timer.Start
Start or restart a stopped timer.

```lua
success = Timer.Start(timerId)
```

### Timer.Stop
Stop a running timer (can be restarted later).

```lua
success = Timer.Stop(timerId)
```

### Timer.IsActive
Check if timer is currently running.

```lua
active = Timer.IsActive(timerId)
```

### Timer.GetRemaining
Get remaining time until next fire.

```lua
ms = Timer.GetRemaining(timerId)  -- Returns milliseconds or -1 if invalid
```

### Timer.GetTick
Get current server tick count.

```lua
tick = Timer.GetTick()
```

## Named Timer Auto-Replace

**Creating a timer with an existing name automatically replaces the old one:**

```lua
-- First timer
Timer.CreateRepeating(1000, "status_check", function()
    Log.Add("Check 1")
end)

-- This REPLACES the first timer (same name)
Timer.CreateRepeating(2000, "status_check", function()
    Log.Add("Check 2")
end)

-- Only "Check 2" will fire (every 2 seconds)
```

This prevents duplicate timers when reloading scripts or reusing timer names.

## Lifetime Management

**aliveTime** controls total timer lifetime (not individual intervals):

```lua
-- Timer fires every 2 seconds, but auto-removes after 10 seconds total
-- Will fire approximately 5 times (at 2s, 4s, 6s, 8s, 10s) then auto-remove
Timer.CreateRepeating(2000, "limited_timer", function()
    Log.Add("Tick")
end, 10000)
```

## Complete Examples

### Example 1: Event Countdown System
```lua
function StartEventCountdown()
    Timer.RepeatNTimes(1000, "event_countdown", 10, function(current, total)
        local remaining = total - current + 1
        Message.Send(-1, 1, string.format("Event starts in %d seconds!", remaining))
        
        if current == total then
            StartEvent()
        end
    end)
end
```

### Example 2: Temporary Buff System
```lua
function GiveTemporaryBuff(oPlayer, buffId, duration)
    -- Apply buff
    Buff.Add(oPlayer.Index, buffId, duration)
    
    -- Create timer that auto-removes after duration
    local timerName = string.format("buff_check_%d_%d", oPlayer.Index, buffId)
    Timer.Create(duration * 1000, timerName, function()
        Log.Add(string.format("Buff %d expired for player %s", buffId, oPlayer.Name))
    end, duration * 1000)
end
```

### Example 3: Auto-Save with Manual Control
```lua
local AUTO_SAVE_INTERVAL = 300000  -- 5 minutes

function ToggleAutoSave()
    if Timer.ExistsByName("auto_save") then
        Timer.RemoveByName("auto_save")
        Log.Add("Auto-save disabled")
    else
        Timer.CreateRepeating(AUTO_SAVE_INTERVAL, "auto_save", function()
            Log.Add("[Server] Auto-saving...")
            SaveAllPlayers()
        end)
        Log.Add("Auto-save enabled")
    end
end
```

### Example 4: Player-Specific Cooldown
```lua
function SetPlayerCooldown(oPlayer, action, seconds)
    local timerName = string.format("cooldown_%d_%s", oPlayer.Index, action)
    
    -- Auto-replace existing cooldown
    Timer.Create(seconds * 1000, timerName, function()
        Log.Add(string.format("%s cooldown expired for %s", action, oPlayer.Name))
    end)
end

function IsOnCooldown(oPlayer, action)
    local timerName = string.format("cooldown_%d_%s", oPlayer.Index, action)
    return Timer.ExistsByName(timerName)
end
```

## Best Practices

1. **Use descriptive timer names**: `"player_123_teleport_cooldown"` not `"timer1"`
2. **Include identifiers in names**: For player-specific timers, include player index/ID
3. **Clean up on player disconnect**: Remove player-specific timers when players leave
4. **Use aliveTime for temporary timers**: Prevents timer leaks
5. **Check existence before creating**: Use `ExistsByName()` to avoid unintended replacements

## Context Safety

Timers are automatically cleared when their context reloads:

```lua
-- Script reload automatically clears all timers from this context
-- No manual cleanup needed when using /reload command
```

## See Also
- [ActionTick API](../Structures/PLAYER.md) - For player-specific tick timers
- [Event Scheduler](CALLBACKS.md) - For scheduled events
