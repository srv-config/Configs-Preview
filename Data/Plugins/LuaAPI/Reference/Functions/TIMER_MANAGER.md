# TimerManager - Named Timer Storage System

Simple storage for timer IDs with names. Access your timers from anywhere in your code.

---

## Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
- [Usage Examples](#usage-examples)
- [Naming Patterns](#naming-patterns)
- [Best Practices](#best-practices)
- [FAQ](#faq)

---

## Overview

**The Problem:**

```lua
-- File: Events.lua
function StartEvent()
    local timerId = Timer.Create(60000, function()
        Message.Send(0, -1, 1, "Event ended!")
    end)
    -- timerId is LOCAL - can't access from other files!
end

-- File: Commands.lua
function StopEvent()
    Timer.Remove(timerId)  // ❌ ERROR: timerId doesn't exist here!
end
```

**The Solution:**

```lua
-- File: Events.lua
function StartEvent()
    local timerId = Timer.Create(60000, function()
        Message.Send(0, -1, 1, "Event ended!")
    end)
    TimerManager.Set("my_event", timerId)  // Store with name
end

-- File: Commands.lua
function StopEvent()
    TimerManager.Remove("my_event")  // ✅ Works! Accessible anywhere!
end
```

**That's it.** Store timer IDs with names. Access them from anywhere.

---

## Quick Start

### 1. Load TimerManager

Add to your `Main.lua`:

```lua
Use("Scripts\\Includes\\TimerManager.lua")
```

### 2. Store Timer with Name

```lua
local timerId = Timer.Create(60000, function()
    Message.Send(0, -1, 1, "Event ended!")
end)

TimerManager.Set("my_event", timerId)
```

### 3. Remove Timer from Anywhere

```lua
TimerManager.Remove("my_event")
```

---

## API Reference

### TimerManager.Set(name, timerId)

Store timer ID with name. Automatically removes old timer if name already exists.

**Parameters:**
- `name` (string): Unique timer name
- `timerId` (number): Timer ID from Timer.Create/CreateRepeating/RepeatNTimes

**Example:**
```lua
local timerId = Timer.Create(60000, callback)
TimerManager.Set("boss_spawn", timerId)

-- Calling Set() again with same name auto-removes old timer:
local newTimerId = Timer.Create(30000, callback)
TimerManager.Set("boss_spawn", newTimerId)  // Old timer removed automatically
```

---

### TimerManager.Get(name)

Get timer ID by name.

**Parameters:**
- `name` (string): Timer name

**Returns:**
- Timer ID (number) or `nil` if not found

**Example:**
```lua
local timerId = TimerManager.Get("boss_spawn")
if timerId then
    Log.Add("Timer ID: " .. timerId)
else
    Log.Add("Timer not found")
end
```

---

### TimerManager.Remove(name)

Remove timer by name.

**Parameters:**
- `name` (string): Timer name

**Returns:**
- `true` if removed, `false` if not found

**Example:**
```lua
if TimerManager.Remove("boss_spawn") then
    Log.Add("Timer removed successfully")
else
    Log.Add("Timer not found")
end
```

---

### TimerManager.Exists(name)

Check if timer exists.

**Parameters:**
- `name` (string): Timer name

**Returns:**
- `true` if exists, `false` otherwise

**Example:**
```lua
if TimerManager.Exists("boss_spawn") then
    Log.Add("Boss event is active")
end
```

---

### TimerManager.Clear()

Remove ALL stored timers.

**Example:**
```lua
TimerManager.Clear()
Log.Add("All timers removed")
```

---

### TimerManager.Count()

Get number of stored timers.

**Returns:**
- Number of timers (number)

**Example:**
```lua
local count = TimerManager.Count()
Log.Add("Active timers: " .. count)
```

---

### TimerManager.List()

Get array of all timer names (for debugging).

**Returns:**
- Array of strings

**Example:**
```lua
local names = TimerManager.List()
for _, name in ipairs(names) do
    Log.Add("Timer: " .. name)
end
```

---

## Usage Examples

### Example 1: Server Event

```lua
function StartHappyHour()
    local timerId = Timer.Create(3600000, function()
        Message.Send(0, -1, 1, "Happy Hour ended!")
        Log.Add("[Event] Happy Hour completed")
    end)
    
    TimerManager.Set("happy_hour", timerId)
    Message.Send(0, -1, 1, "Happy Hour started!")
end

function StopHappyHour()
    if TimerManager.Remove("happy_hour") then
        Message.Send(0, -1, 1, "Happy Hour cancelled!")
    end
end

function IsHappyHourActive()
    return TimerManager.Exists("happy_hour")
end
```

---

### Example 2: Player Buff

```lua
function ApplyBuff(playerIndex, buffId, duration)
    local name = "player_" .. playerIndex .. "_buff_" .. buffId
    
    -- Apply buff effect
    local oPlayer = Player.GetObjByIndex(playerIndex)
    if oPlayer then
        AddBuffEffect(oPlayer, buffId, 0, 100, 0, 0, duration / 1000, 0, -1)
    end
    
    -- Create removal timer
    local timerId = Timer.Create(duration, function()
        if Player.IsConnected(playerIndex) then
            local oPlayer = Player.GetObjByIndex(playerIndex)
            if oPlayer then
                RemoveBuffEffect(oPlayer, buffId)
                Message.Send(0, playerIndex, 0, "Buff expired!")
            end
        end
    end)
    
    TimerManager.Set(name, timerId)
end

function RemoveBuff(playerIndex, buffId)
    local name = "player_" .. playerIndex .. "_buff_" .. buffId
    
    if TimerManager.Remove(name) then
        local oPlayer = Player.GetObjByIndex(playerIndex)
        if oPlayer then
            RemoveBuffEffect(oPlayer, buffId)
            Message.Send(0, playerIndex, 0, "Buff removed!")
        end
    end
end

function onPlayerDisconnect(oPlayer)
    -- Clean up player's buff timers
    TimerManager.Remove("player_" .. oPlayer.Index .. "_buff_5")
    TimerManager.Remove("player_" .. oPlayer.Index .. "_buff_10")
    -- Add more as needed
end
```

---

### Example 3: Cooldown System

```lua
function UseSkill(playerIndex, skillId, cooldownMs)
    local name = "player_" .. playerIndex .. "_skill_" .. skillId
    
    -- Check if on cooldown
    if TimerManager.Exists(name) then
        Message.Send(0, playerIndex, 0, "Skill on cooldown!")
        return false
    end
    
    -- Execute skill
    Message.Send(0, playerIndex, 0, "Skill used!")
    -- ... actual skill code here ...
    
    -- Set cooldown timer
    local timerId = Timer.Create(cooldownMs, function()
        if Player.IsConnected(playerIndex) then
            Message.Send(0, playerIndex, 0, "Skill ready!")
        end
    end)
    
    TimerManager.Set(name, timerId)
    return true
end

-- Usage:
-- UseSkill(100, 5, 5000)  // Player 100, Skill 5, 5 second cooldown
```

---

### Example 4: Multiple Event Timers

```lua
function StartBossEvent()
    -- Warning timer (5 minutes before)
    local warnId = Timer.Create(300000, function()
        Message.Send(0, -1, 1, "Boss spawns in 5 minutes!")
    end)
    TimerManager.Set("boss_warning", warnId)
    
    -- Spawn timer (10 minutes)
    local spawnId = Timer.Create(600000, function()
        Message.Send(0, -1, 1, "Boss has spawned!")
        -- Spawn boss code here
    end)
    TimerManager.Set("boss_spawn", spawnId)
    
    Log.Add("[Event] Boss event scheduled")
end

function CancelBossEvent()
    local removed = 0
    
    if TimerManager.Remove("boss_warning") then
        removed = removed + 1
    end
    
    if TimerManager.Remove("boss_spawn") then
        removed = removed + 1
    end
    
    if removed > 0 then
        Message.Send(0, -1, 1, "Boss event cancelled!")
        Log.Add("[Event] Boss event cancelled, removed " .. removed .. " timers")
    end
end
```

---

### Example 5: Quest Timer

```lua
function StartQuest(playerIndex, questId, timeLimitMs)
    local name = "player_" .. playerIndex .. "_quest_" .. questId
    
    local timerId = Timer.Create(timeLimitMs, function()
        if Player.IsConnected(playerIndex) then
            Message.Send(0, playerIndex, 1, "Quest time expired!")
            -- Fail quest code here
        end
    end)
    
    TimerManager.Set(name, timerId)
    Message.Send(0, playerIndex, 0, "Quest started! Time limit: " .. (timeLimitMs / 60000) .. " minutes")
end

function CompleteQuest(playerIndex, questId)
    local name = "player_" .. playerIndex .. "_quest_" .. questId
    
    if TimerManager.Remove(name) then
        Message.Send(0, playerIndex, 1, "Quest completed!")
        -- Reward code here
    end
end

function FailQuest(playerIndex, questId)
    local name = "player_" .. playerIndex .. "_quest_" .. questId
    TimerManager.Remove(name)
    Message.Send(0, playerIndex, 1, "Quest failed!")
end
```

---

### Example 6: Repeating Server Timer

```lua
function StartAutoSave()
    local timerId = Timer.CreateRepeating(300000, function()  -- Every 5 minutes
        Log.Add("[Server] Auto-saving...")
        -- Save logic here
    end)
    
    TimerManager.Set("auto_save", timerId)
    Log.Add("[Server] Auto-save enabled (every 5 minutes)")
end

function StopAutoSave()
    if TimerManager.Remove("auto_save") then
        Log.Add("[Server] Auto-save disabled")
    end
end
```

---

### Example 7: AFK System

```lua
function ResetAFKTimer(playerIndex)
    local name = "player_" .. playerIndex .. "_afk"
    
    local timerId = Timer.Create(300000, function()  -- 5 minutes
        if Player.IsConnected(playerIndex) then
            Message.Send(0, playerIndex, 1, "AFK timeout - disconnecting!")
            -- Disconnect player code here
        end
    end)
    
    TimerManager.Set(name, timerId)  -- Auto-replaces old AFK timer
end

function onPlayerLogin(oPlayer)
    ResetAFKTimer(oPlayer.Index)
end

function onPlayerMove(oPlayer)
    ResetAFKTimer(oPlayer.Index)  -- Reset timer on any movement
end

function onPlayerDisconnect(oPlayer)
    local name = "player_" .. oPlayer.Index .. "_afk"
    TimerManager.Remove(name)
end
```

---

### Example 8: Limited Repeat with Countdown

```lua
function StartCountdown(seconds)
    Timer.RepeatNTimes(1000, seconds, function(current, total)
        local remaining = total - current
        
        if remaining > 0 then
            Message.Send(0, -1, 1, "Event starts in " .. remaining .. " seconds!")
        else
            Message.Send(0, -1, 1, "Event started!")
        end
    end)
end

-- Usage:
-- StartCountdown(10)  // 10... 9... 8... Event started!
```

---

### Example 9: Player Temporary Teleport

```lua
function TeleportTemporary(playerIndex, mapId, x, y, returnAfterMs)
    local name = "player_" .. playerIndex .. "_temp_teleport"
    
    -- Store original position
    local oPlayer = Player.GetObjByIndex(playerIndex)
    if not oPlayer then return end
    
    local origMap = oPlayer.MapNumber
    local origX = oPlayer.X
    local origY = oPlayer.Y
    
    -- Teleport to new location
    Teleport(playerIndex, mapId, x, y)
    Message.Send(0, playerIndex, 0, "Teleporting back in " .. (returnAfterMs / 1000) .. " seconds...")
    
    -- Create return timer
    local timerId = Timer.Create(returnAfterMs, function()
        if Player.IsConnected(playerIndex) then
            Teleport(playerIndex, origMap, origX, origY)
            Message.Send(0, playerIndex, 0, "Teleported back!")
        end
    end)
    
    TimerManager.Set(name, timerId)
end

function CancelTemporaryTeleport(playerIndex)
    local name = "player_" .. playerIndex .. "_temp_teleport"
    TimerManager.Remove(name)
end
```

---

### Example 10: Debug Command

```lua
function ShowAllTimers()
    local count = TimerManager.Count()
    Log.Add("===========================================")
    Log.Add("[TimerManager] Active Timers: " .. count)
    Log.Add("===========================================")
    
    if count == 0 then
        Log.Add("No active timers")
        return
    end
    
    local names = TimerManager.List()
    for i, name in ipairs(names) do
        local timerId = TimerManager.Get(name)
        Log.Add(string.format("%d. %s (ID: %d)", i, name, timerId))
    end
    Log.Add("===========================================")
end
```

---

## Naming Patterns

You control the naming scheme. Here are common patterns:

### Server/Global Events

Simple descriptive names:

```lua
"boss_spawn"
"happy_hour"
"event_warning"
"auto_save"
"server_restart"
```

---

### Player-Specific Timers

Include player index in name:

```lua
"player_100_buff"
"player_100_cooldown"
"player_100_afk"
"player_100_quest"
```

---

### Player + Type Timers

Include both player index and specific type:

```lua
"player_100_buff_5"          // Player 100, Buff ID 5
"player_100_skill_10"        // Player 100, Skill ID 10
"player_100_quest_25"        // Player 100, Quest ID 25
"player_200_cooldown_heal"   // Player 200, Heal cooldown
```

---

### Hierarchical Names

Use underscores for structure:

```lua
"event_boss_warning"
"event_boss_spawn"
"event_boss_death"

"player_100_combat_regen"
"player_100_combat_potion"
"player_100_quest_timeout"
```

---

## Best Practices

### ✅ DO:

**Use descriptive names:**
```lua
TimerManager.Set("boss_spawn_warning", timerId)  // ✅ Clear
TimerManager.Set("bsw", timerId)                 // ❌ Unclear
```

**Include player index for player timers:**
```lua
local name = "player_" .. playerIndex .. "_buff"
TimerManager.Set(name, timerId)
```

**Always check Player.IsConnected in player callbacks:**
```lua
Timer.Create(60000, function()
    if Player.IsConnected(playerIndex) then  // ✅ Always check!
        Message.Send(0, playerIndex, 0, "Message")
    end
end)
```

**Clean up on disconnect:**
```lua
function onPlayerDisconnect(oPlayer)
    TimerManager.Remove("player_" .. oPlayer.Index .. "_buff")
    TimerManager.Remove("player_" .. oPlayer.Index .. "_cooldown")
    TimerManager.Remove("player_" .. oPlayer.Index .. "_quest")
end
```

**Use consistent naming conventions:**
```lua
// Choose one pattern and stick with it:
"player_100_buff_5"   // Good
"buff_player_100_5"   // Also good
"100_buff_5_player"   // Bad - inconsistent
```

---

### ❌ DON'T:

**Don't use unclear names:**
```lua
TimerManager.Set("t1", timerId)      // ❌ What is t1?
TimerManager.Set("temp", timerId)    // ❌ Temp what?
```

**Don't forget disconnect cleanup:**
```lua
function onPlayerDisconnect(oPlayer)
    // ❌ Missing cleanup = memory leak!
}
```

**Don't skip connection checks:**
```lua
Timer.Create(60000, function()
    Message.Send(0, playerIndex, 0, "Text")  // ❌ Player might be offline!
end)
```

**Don't create timers in loops without cleanup:**
```lua
for i = 1, 1000 do
    local timerId = Timer.Create(60000, callback)
    TimerManager.Set("timer" .. i, timerId)  // ❌ Creates 1000 timers!
end
// Need to clean these up later!
```

---

## FAQ

### Q: Do I need to load TimerManager in Main.lua?

**A:** No, but it's recommended. You can load it anywhere:

```lua
// Recommended: Load once in Main.lua
Use("Scripts\\Includes\\TimerManager.lua")

Use("Scripts\\Includes\\TimerManager.lua")
function MyFunction()
    TimerManager.Set("timer", timerId)
end
```

If you load it in Main.lua, it's available everywhere immediately. If you load it in individual files, Lua caches it so it only executes once anyway.

---

### Q: What happens if I Set() with a name that already exists?

**A:** The old timer is **automatically removed** and replaced with the new one:

```lua
TimerManager.Set("my_timer", timerId1)
TimerManager.Set("my_timer", timerId2)  // timerId1 automatically removed
```

This is useful for resetting timers:

```lua
function ResetAFKTimer(playerIndex)
    local name = "player_" .. playerIndex .. "_afk"
    local timerId = Timer.Create(300000, callback)
    TimerManager.Set(name, timerId)  // Auto-removes old AFK timer
end
```

---

### Q: Can I use special characters in names?

**A:** Yes, but stick to alphanumeric and underscore for clarity:

```lua
TimerManager.Set("player_100_buff", timerId)     // ✅ Good
TimerManager.Set("player-100-buff", timerId)     // ✅ Works but less common
TimerManager.Set("player.100.buff", timerId)     // ✅ Works
TimerManager.Set("player 100 buff", timerId)     // ✅ Works but avoid spaces
TimerManager.Set("player/100/buff", timerId)     // ✅ Works
```

Recommended: Use `underscore_case` for consistency.

---

### Q: How do I remove all timers for a specific player?

**A:** Remove them individually in onPlayerDisconnect:

```lua
function onPlayerDisconnect(oPlayer)
    local idx = oPlayer.Index
    
    -- Remove all player's timers
    TimerManager.Remove("player_" .. idx .. "_buff")
    TimerManager.Remove("player_" .. idx .. "_buff_5")
    TimerManager.Remove("player_" .. idx .. "_buff_10")
    TimerManager.Remove("player_" .. idx .. "_cooldown")
    TimerManager.Remove("player_" .. idx .. "_quest_1")
    TimerManager.Remove("player_" .. idx .. "_afk")
end
```

If you have many timers per player, consider using a consistent prefix and looping:

```lua
function onPlayerDisconnect(oPlayer)
    local prefix = "player_" .. oPlayer.Index .. "_"
    local names = TimerManager.List()
    
    for _, name in ipairs(names) do
        if name:sub(1, #prefix) == prefix then
            TimerManager.Remove(name)
        end
    end
end
```

---

### Q: Can I get the timer ID from a name?

**A:** Yes, use `Get()`:

```lua
local timerId = TimerManager.Get("boss_spawn")
if timerId then
    Log.Add("Timer ID: " .. timerId)
    
    -- You can also use core Timer functions:
    local remaining = Timer.GetRemaining(timerId)
    local isActive = Timer.IsActive(timerId)
end
```

---

### Q: Does TimerManager work with Timer.RepeatNTimes()?

**A:** Yes! Store the timer ID just like any other timer:

```lua
local timerId = Timer.RepeatNTimes(1000, 10, function(current, total)
    Log.Add("Tick " .. current .. "/" .. total)
end)

TimerManager.Set("countdown", timerId)

// You can remove it early:
TimerManager.Remove("countdown")  // Stops before completing all 10 ticks
```

---

### Q: What's the difference between TimerManager and Timer system?

**A:** 

**Timer System** (C++ core):
- Creates/removes timers by ID
- Handles timer execution
- `Timer.Create()`, `Timer.Remove(timerId)`

**TimerManager** (Lua helper):
- Stores timer IDs with names
- Makes IDs accessible from anywhere
- `TimerManager.Set(name, timerId)`, `TimerManager.Remove(name)`

Think of it like:
- **Timer** = Create actual timers
- **TimerManager** = Phone book for timer IDs

---

### Q: Can multiple names point to the same timer ID?

**A:** Yes, but it's not recommended:

```lua
local timerId = Timer.Create(60000, callback)

TimerManager.Set("name1", timerId)
TimerManager.Set("name2", timerId)

// Both names store same timer ID
TimerManager.Remove("name1")  // Removes timer, but name2 still has dead ID
```

Better practice: One name per timer.

---

### Q: Does TimerManager work across different Lua contexts?

**A:** Yes! TimerManager is global and the underlying Timer system is global, so it works across all 8 Lua execution contexts.

```lua
// Context 1:
TimerManager.Set("my_timer", timerId)

// Context 5 (different context):
TimerManager.Remove("my_timer")  // ✅ Works!
```

---

### Q: What happens if I Remove() a timer that doesn't exist?

**A:** Nothing bad. It returns `false`:

```lua
local removed = TimerManager.Remove("non_existent")
if removed then
    Log.Add("Removed successfully")
else
    Log.Add("Timer not found")  // This executes
end
```

Safe to call Remove() even if you're unsure the timer exists.

---

### Q: Can I rename a timer?

**A:** Not directly, but you can Set() with new name and Remove() old:

```lua
// Store with old name
TimerManager.Set("old_name", timerId)

// "Rename" by storing under new name
local timerId = TimerManager.Get("old_name")
TimerManager.Set("new_name", timerId)
TimerManager.Remove("old_name")
```

Or simpler - just let Set() replace it:

```lua
TimerManager.Set("old_name", timerId)
// Later, just use new name:
TimerManager.Set("new_name", timerId)  // Now accessible by new_name only
```

---

### Q: How many timers can I store?

**A:** No hard limit. Limited only by Lua table size and system memory. The underlying Timer system can handle 10,000+ timers efficiently.

However, best practice is to clean up timers you don't need anymore to avoid memory bloat.

---

### Q: Does TimerManager automatically clean up expired timers?

**A:** No. One-shot timers (from `Timer.Create()`) auto-remove themselves from the Timer system after firing, but their name entry stays in TimerManager storage.

For one-shot timers, clean up manually after they fire:

```lua
local timerId = Timer.Create(60000, function()
    Message.Send(0, -1, 1, "Event!")
    TimerManager.Remove("my_event")  // Clean up name entry
end)

TimerManager.Set("my_event", timerId)
```

Or don't worry about it - dead timer IDs are harmless, just take up minimal memory.

---

### Q: Can I use TimerManager with Timer.CreateRepeating()?

**A:** Yes:

```lua
local timerId = Timer.CreateRepeating(1000, function()
    Log.Add("Every second")
end)

TimerManager.Set("repeating_timer", timerId)

// Stop it later from anywhere:
TimerManager.Remove("repeating_timer")
```

---

### Q: Is TimerManager thread-safe?

**A:** Yes. The underlying Timer system uses CRITICAL_SECTION protection. Lua is single-threaded, so TimerManager's table operations are safe.

---

## See Also

- **TIMER_SYSTEM_DOCUMENTATION.md** - Core Timer API reference
- **EventScheduler.lua** - XML-based event scheduling system
- **Timer.RepeatNTimes()** - Limited repeating timers

