# Scheduler API

## Overview
Event scheduler system for managing timed events with XML configuration support. Supports recurring events, notices, and duration-based events.

## Functions

### Scheduler.LoadFromXML
Load event schedule from XML configuration file.

```lua
success = Scheduler.LoadFromXML(filePath)
```

**Parameters:**
- `filePath` (string): Path to XML configuration file

**Returns:** `boolean` - Success/failure

**Example:**
```lua
local success = Scheduler.LoadFromXML("Config/EventScheduler.xml")
if success then
    Log.Add("Scheduler loaded successfully")
else
    Log.AddC(2, "Failed to load scheduler!")
end
```

### Scheduler.GetEventCount
Get total number of loaded events.

```lua
count = Scheduler.GetEventCount()
```

**Returns:** `number` - Number of events

**Example:**
```lua
local count = Scheduler.GetEventCount()
Log.Add(string.format("Loaded %d scheduled events", count))
```

### Scheduler.CheckEventStarts
Check which events should start at current time.

```lua
eventTypes = Scheduler.CheckEventStarts()
```

**Returns:** `table` - Array of event type IDs that triggered

**Example:**
```lua
local startedEvents = Scheduler.CheckEventStarts()
for _, eventType in ipairs(startedEvents) do
    local name = Scheduler.GetEventName(eventType)
    Log.Add(string.format("Event started: %s (Type: %d)", name, eventType))
    OnEventStart(eventType)
end
```

### Scheduler.CheckEventEnds
Check which events should end at current time (based on duration).

```lua
eventTypes = Scheduler.CheckEventEnds()
```

**Returns:** `table` - Array of event type IDs that ended

**Example:**
```lua
local endedEvents = Scheduler.CheckEventEnds()
for _, eventType in ipairs(endedEvents) do
    local name = Scheduler.GetEventName(eventType)
    Log.Add(string.format("Event ended: %s (Type: %d)", name, eventType))
    OnEventEnd(eventType)
end
```

### Scheduler.CheckEventNotices
Check which events should send notice at current time.

```lua
eventTypes = Scheduler.CheckEventNotices()
```

**Returns:** `table` - Array of event type IDs that need notice

**Example:**
```lua
local noticeEvents = Scheduler.CheckEventNotices()
for _, eventType in ipairs(noticeEvents) do
    local name = Scheduler.GetEventName(eventType)
    local remaining = Scheduler.GetRemainingTime(eventType)
    
    if remaining > 0 then
        local mins = math.floor(remaining / 60)
        Message.Send(-1, 1, string.format(
            "%s starts in %d minutes!", name, mins
        ))
    end
end
```

### Scheduler.GetEventName
Get event name by type ID.

```lua
name = Scheduler.GetEventName(eventType)
```

**Parameters:**
- `eventType` (number): Event type ID

**Returns:** `string` - Event name or empty string if not found

**Example:**
```lua
local name = Scheduler.GetEventName(100)
Log.Add(string.format("Event name: %s", name))
```

### Scheduler.HasSecondPrecisionEvents
Check if any event requires second-precision timing.

```lua
hasSecondPrecision = Scheduler.HasSecondPrecisionEvents()
```

**Returns:** `boolean` - True if any event has second-precision schedule

**Example:**
```lua
if Scheduler.HasSecondPrecisionEvents() then
    Log.Add("Scheduler requires per-second checks")
    -- Call Check functions every second
else
    Log.Add("Scheduler can run per-minute checks")
    -- Call Check functions every minute
end
```

### Scheduler.IsEventActive
Check if event is currently running.

```lua
isActive = Scheduler.IsEventActive(eventType)
```

**Parameters:**
- `eventType` (number): Event type ID

**Returns:** `boolean` - True if event is active, false otherwise

**Example:**
```lua
if Scheduler.IsEventActive(100) then
    Log.Add("Blood Castle is currently active")
else
    Log.Add("Blood Castle is not running")
end
```

### Scheduler.GetElapsedTime
Get elapsed time since event started (in seconds).

```lua
elapsed = Scheduler.GetElapsedTime(eventType)
```

**Parameters:**
- `eventType` (number): Event type ID

**Returns:** `number` - Elapsed time in seconds, or -1 if event is not active

**Example:**
```lua
local elapsed = Scheduler.GetElapsedTime(100)
if elapsed >= 0 then
    local mins = math.floor(elapsed / 60)
    local secs = elapsed % 60
    Log.Add(string.format("Event running for %d:%02d", mins, secs))
end
```

### Scheduler.GetRemainingTime
Get remaining time until event ends (in seconds).

```lua
remaining = Scheduler.GetRemainingTime(eventType)
```

**Parameters:**
- `eventType` (number): Event type ID

**Returns:** `number` - Remaining time in seconds, or -1 if event is not active or has no duration

**Example:**
```lua
local remaining = Scheduler.GetRemainingTime(100)
if remaining >= 0 then
    local mins = math.floor(remaining / 60)
    local secs = remaining % 60
    Message.Send(-1, 0, string.format(
        "Event ends in %d:%02d", mins, secs
    ))
end
```

### Scheduler.GetProgress
Get event progress as percentage (0-100).

```lua
progress = Scheduler.GetProgress(eventType)
```

**Parameters:**
- `eventType` (number): Event type ID

**Returns:** `number` - Progress percentage (0-100), or -1 if event is not active or has no duration

**Example:**
```lua
local progress = Scheduler.GetProgress(100)
if progress >= 0 then
    Log.Add(string.format("Event progress: %d%%", progress))
end
```

## Complete Examples

### Example 1: Basic Event Monitoring
```lua
-- Called every second/minute from game loop
function CheckScheduledEvents()
    -- Check for starting events
    local startedEvents = Scheduler.CheckEventStarts()
    for _, eventType in ipairs(startedEvents) do
        OnEventStart(eventType)
    end
    
    -- Check for ending events
    local endedEvents = Scheduler.CheckEventEnds()
    for _, eventType in ipairs(endedEvents) do
        OnEventEnd(eventType)
    end
    
    -- Check for notices
    local noticeEvents = Scheduler.CheckEventNotices()
    for _, eventType in ipairs(noticeEvents) do
        OnEventNotice(eventType)
    end
end

function OnEventStart(eventType)
    local name = Scheduler.GetEventName(eventType)
    Message.Send(-1, 1, string.format("%s has started!", name))
    Log.Add(string.format("Event %d started: %s", eventType, name))
end

function OnEventEnd(eventType)
    local name = Scheduler.GetEventName(eventType)
    Message.Send(-1, 1, string.format("%s has ended!", name))
    Log.Add(string.format("Event %d ended: %s", eventType, name))
end

function OnEventNotice(eventType)
    local name = Scheduler.GetEventName(eventType)
    local remaining = Scheduler.GetRemainingTime(eventType)
    
    if remaining > 0 then
        local mins = math.floor(remaining / 60)
        Message.Send(-1, 1, string.format(
            "%s starts in %d minutes!", name, mins
        ))
    end
end
```

### Example 2: Event Timer Display
```lua
function DisplayEventTimer(eventType)
    if not Scheduler.IsEventActive(eventType) then
        Message.Send(-1, 0, "No event is currently running")
        return
    end
    
    local name = Scheduler.GetEventName(eventType)
    local elapsed = Scheduler.GetElapsedTime(eventType)
    local remaining = Scheduler.GetRemainingTime(eventType)
    local progress = Scheduler.GetProgress(eventType)
    
    if remaining >= 0 then
        local mins = math.floor(remaining / 60)
        local secs = remaining % 60
        
        Message.Send(-1, 1, string.format(
            "%s | Time Left: %d:%02d | Progress: %d%%",
            name, mins, secs, progress
        ))
    else
        Message.Send(-1, 1, string.format(
            "%s | Elapsed: %d seconds",
            name, elapsed
        ))
    end
end

-- Display timer every 30 seconds
Timer.CreateRepeating(30000, "event_timer_display", function()
    if Scheduler.IsEventActive(100) then
        DisplayEventTimer(100)
    end
end)
```

### Example 3: Event Phase System
```lua
function GetEventPhase(eventType)
    local progress = Scheduler.GetProgress(eventType)
    
    if progress < 0 then
        return "INACTIVE"
    elseif progress < 25 then
        return "STARTING"
    elseif progress < 75 then
        return "ACTIVE"
    elseif progress < 100 then
        return "ENDING"
    else
        return "FINISHED"
    end
end

function OnEventTick(eventType)
    local phase = GetEventPhase(eventType)
    
    if phase == "STARTING" then
        -- Event just started, spawn monsters
        SpawnEventMonsters()
    elseif phase == "ENDING" then
        -- Event ending soon, final warning
        local remaining = Scheduler.GetRemainingTime(eventType)
        if remaining <= 60 then
            Message.Send(-1, 1, "Event ending in 1 minute!")
        end
    end
end
```

### Example 4: Dynamic Rewards Based on Progress
```lua
function CalculateEventReward(eventType, baseReward)
    local progress = Scheduler.GetProgress(eventType)
    
    if progress < 0 then
        return 0
    end
    
    -- Bonus for completing event
    local multiplier = 1.0
    
    if progress >= 100 then
        multiplier = 2.0  -- Double reward for full completion
    elseif progress >= 75 then
        multiplier = 1.5  -- 50% bonus for 75%+ completion
    elseif progress >= 50 then
        multiplier = 1.25 -- 25% bonus for 50%+ completion
    end
    
    return math.floor(baseReward * multiplier)
end

function GiveEventCompletionReward(oPlayer, eventType)
    local reward = CalculateEventReward(eventType, 100000)

    if reward > 0 then
        Player.SetMoney(oPlayer.Index, reward, false)
        Message.Send(0, oPlayer.Index, 0, string.format(
            "Event Reward: +%d Zen!", reward
        ))
    end
end
```

### Example 5: Countdown Announcements
```lua
-- Announce remaining time at specific intervals
Timer.CreateRepeating(60000, "event_countdown", function()
    local eventType = 100
    
    if not Scheduler.IsEventActive(eventType) then
        return
    end
    
    local remaining = Scheduler.GetRemainingTime(eventType)
    
    if remaining < 0 then
        return
    end
    
    local mins = math.floor(remaining / 60)
    local name = Scheduler.GetEventName(eventType)
    
    -- Announce at specific time marks
    if remaining == 600 then
        Message.Send(-1, 1, string.format("%s ends in 10 minutes!", name))
    elseif remaining == 300 then
        Message.Send(-1, 1, string.format("%s ends in 5 minutes!", name))
    elseif remaining == 60 then
        Message.Send(-1, 1, string.format("%s ends in 1 minute!", name))
    elseif remaining % 600 == 0 and mins > 10 then
        Message.Send(-1, 0, string.format("%s: %d minutes remaining", name, mins))
    end
end)
```

### Example 6: Event Statistics Tracking
```lua
local eventStats = {}

function OnEventStart(eventType)
    eventStats[eventType] = {
        startTime = os.time(),
        participants = 0,
        completions = 0
    }
    
    local name = Scheduler.GetEventName(eventType)
    Message.Send(-1, 1, string.format("%s has started!", name))
end

function OnEventEnd(eventType)
    local stats = eventStats[eventType]
    if stats then
        local name = Scheduler.GetEventName(eventType)
        local duration = os.time() - stats.startTime
        
        Log.Add(string.format(
            "Event %s ended | Duration: %ds | Participants: %d | Completions: %d",
            name, duration, stats.participants, stats.completions
        ))
        
        Message.Send(-1, 1, string.format(
            "%s ended! %d players participated, %d completed",
            name, stats.participants, stats.completions
        ))
    end
end

function TrackEventParticipation(oPlayer, eventType)
    if eventStats[eventType] then
        eventStats[eventType].participants = eventStats[eventType].participants + 1
    end
end

function TrackEventCompletion(oPlayer, eventType)
    if eventStats[eventType] then
        eventStats[eventType].completions = eventStats[eventType].completions + 1
    end
end
```

### Example 7: Multiple Event Management
```lua
function GetActiveEvents()
    local activeEvents = {}
    local totalEvents = Scheduler.GetEventCount()
    
    -- Check all possible event types (adjust range as needed)
    for eventType = 1, 200 do
        if Scheduler.IsEventActive(eventType) then
            table.insert(activeEvents, {
                type = eventType,
                name = Scheduler.GetEventName(eventType),
                elapsed = Scheduler.GetElapsedTime(eventType),
                remaining = Scheduler.GetRemainingTime(eventType),
                progress = Scheduler.GetProgress(eventType)
            })
        end
    end
    
    return activeEvents
end

function DisplayAllActiveEvents()
    local events = GetActiveEvents()
    
    if #events == 0 then
        Message.Send(-1, 0, "No events currently active")
        return
    end
    
    Message.Send(-1, 1, string.format("=== %d Active Events ===", #events))
    
    for _, event in ipairs(events) do
        if event.remaining >= 0 then
            local mins = math.floor(event.remaining / 60)
            Message.Send(-1, 0, string.format(
                "%s: %d mins left (%d%%)",
                event.name, mins, event.progress
            ))
        else
            Message.Send(-1, 0, string.format(
                "%s: Active (%d seconds elapsed)",
                event.name, event.elapsed
            ))
        end
    end
end
```

## XML Configuration Format

```xml
<?xml version="1.0" encoding="utf-8"?>
<EventScheduler>
    <!-- Event with duration and notice -->
    <Event Type="100" Name="Blood Castle" NoticePeriod="300" Duration="900">
        <Start Hour="12" Minute="0" />
        <Start Hour="18" Minute="0" />
        <Start Hour="22" Minute="0" />
    </Event>
    
    <!-- Event every day at specific time -->
    <Event Type="101" Name="Devil Square" Duration="600">
        <Start Hour="14" Minute="30" />
        <Start Hour="20" Minute="30" />
    </Event>
    
    <!-- Event on specific day of week -->
    <Event Type="102" Name="Castle Siege" Duration="7200">
        <Start DayOfWeek="0" Hour="20" Minute="0" />  <!-- Sunday -->
    </Event>
    
    <!-- Event every hour -->
    <Event Type="103" Name="Golden Invasion" Duration="300">
        <Start Minute="0" />  <!-- Every hour at :00 -->
    </Event>
    
    <!-- Event with second precision -->
    <Event Type="104" Name="Test Event" Duration="60">
        <Start Hour="15" Minute="30" Second="0" />
    </Event>
</EventScheduler>
```

**Time Component Values:**
- `Year`: Specific year (e.g., 2025) or -1 for any year
- `Month`: 1-12 or -1 for any month
- `Day`: 1-31 or -1 for any day
- `DayOfWeek`: 0-6 (0=Sunday, 6=Saturday) or -1 for any day
- `Hour`: 0-23 or -1 for any hour
- `Minute`: 0-59 or -1 for any minute
- `Second`: 0-59 or -1 for any second

**Note:** Use -1 or omit attribute to match "any" value for that component.

## Best Practices

1. **Check Frequency**: Call `CheckEventStarts()`, `CheckEventEnds()`, `CheckEventNotices()` every second if using second-precision, otherwise every minute is sufficient

2. **Event IDs**: Use consistent event type IDs (1-999 recommended) and document them

3. **Duration**: Always specify duration (in seconds) for events that should auto-end

4. **Notice Period**: Set notice period (in seconds) for events that need pre-start announcements

5. **Active Check**: Always check `IsEventActive()` before using time functions

6. **Error Handling**: Check return values (-1 indicates inactive/invalid event)

## Notes

- Scheduler automatically prevents duplicate triggers within the same second
- Events with no duration remain active until manually ended
- Multiple start times can be defined per event
- Time components support wildcards (-1 = any)
- All time functions return -1 for inactive events
- Progress and remaining time require event to have duration defined

## See Also
- [Timer API](TIMERS.md) - For custom timers
- [Message API](../Structures/PLAYER.md) - For event announcements
