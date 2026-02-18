# Lua Iterator Examples

Complete example collection demonstrating all 12 high-performance iterator and utility functions.

---

## ⚠️ Examples Notice

**These examples are under active development and testing.** While we aim for accuracy, some examples may contain errors or outdated function calls. These will be corrected on a regular basis as issues are identified and reported.

If you encounter problems with an example:
- Verify the function signatures in the main documentation
- Test thoroughly in a development environment first
- Report any issues to the development team

---

## 📁 Files Overview

### **Core Examples**
| File | Functions Covered | Examples Count | Description |
|------|-------------------|----------------|-------------|
| `IteratorExamples.lua` | All 9 iterators | 50+ | Complete examples for each iterator function |
| `UtilityExamples.lua` | Count & Find functions | 30+ | Simple and filtered counting, player finding |
| `FilterExamples.lua` | Count with filters | 40+ | Advanced filtering techniques |

### **Usage Category Examples**
| File | Category | Examples Count | Description |
|------|----------|----------------|-------------|
| `TimerExamples.lua` | Timer Functions | 20+ | Per-second, per-minute, hourly timers |
| `EventExamples.lua` | Server Events | 15+ | Boss events, invasions, Blood Castle, etc. |
| `PvPExamples.lua` | PvP Systems | 20+ | Arena, FFA, guild wars, duels |
| `AdminExamples.lua` | GM Commands | 25+ | Player management, monitoring, mass operations |
| `CombatExamples.lua` | Combat Mechanics | 25+ | AOE damage, buffs, DOT, crowd control |

---

## 🎯 Quick Reference

### By Iterator Function

#### 1. **Object.ForEach** → `IteratorExamples.lua` (lines 10-120)
- Count all object types
- Find objects at coordinates
- Cleanup operations

#### 2. **Object.ForEachPlayer** → `IteratorExamples.lua` (lines 122-230)
- Global announcements
- Online bonuses
- Server statistics
- Auto-save systems

#### 3. **Object.ForEachPlayerOnMap** → `IteratorExamples.lua` (lines 232-340)
- Map teleportation
- Map-specific buffs
- Zone bonuses
- Map demographics

#### 4. **Object.ForEachMonster** → `IteratorExamples.lua` (lines 342-430)
- Heal all monsters
- Kill all monsters
- Buff monsters
- Find wounded monsters

#### 5. **Object.ForEachMonsterOnMap** → `IteratorExamples.lua` (lines 432-510)
- Clear map monsters
- Buff map monsters
- Spawn control
- Find bosses

#### 6. **Object.ForEachMonsterByClass** → `IteratorExamples.lua` (lines 512-590)
- Find Golden Goblins
- Announce boss spawns
- Kill specific types
- Type-specific buffs

#### 7. **Object.ForEachPartyMember** → `IteratorExamples.lua` (lines 592-680)
- Party bonuses
- Party location checks
- Party teleportation
- Party broadcasts

#### 8. **Object.ForEachGuildMember** → `IteratorExamples.lua` (lines 682-780)
- Guild announcements
- Guild achievements
- Guild statistics
- Guild teleportation

#### 9. **Object.ForEachNearby** → `IteratorExamples.lua` (lines 782-880)
- AOE heal/damage
- Find nearest enemy
- Count nearby players
- Area buffs

#### 10. **Object.CountPlayersOnMap** → `UtilityExamples.lua` (lines 10-200)
- Simple counting (all players)
- Filtered counting (level, VIP, class, etc.)
- Area counting
- Complex criteria

#### 11. **Object.CountMonstersOnMap** → `UtilityExamples.lua` (lines 202-350)
- Simple counting (all monsters)
- Boss counting
- Type-specific counting
- Area counting

#### 12. **Object.GetObjByName** → `UtilityExamples.lua` (lines 352-450)
- Teleport by name
- Online check
- Send private message
- Award by name

---

## 📚 By Use Case

### **Server Events**
See: `EventExamples.lua`
- Boss Events (preparation, rewards)
- Invasion Events (waves, victory/defeat)
- Blood Castle
- Devil Square
- Castle Siege
- Survival Events

### **PvP Systems**
See: `PvPExamples.lua`
- Arena Matchmaking & Teams
- Free-For-All (FFA)
- Guild Wars
- Territory Control
- Duel System

### **Admin/GM Commands**
See: `AdminExamples.lua`
- Player Management (teleport, kick, ban)
- Broadcast Commands
- Mass Operations
- Server Monitoring
- Security & Anti-Cheat

### **Combat Mechanics**
See: `CombatExamples.lua`
- AOE Damage Skills
- Buffs & Debuffs
- Damage Over Time (DOT)
- Lifesteal & Leech
- Crowd Control (fear, taunt, silence)
- Summoning
- Cleave/Sweep Attacks
- Environmental Damage

### **Timer Functions**
See: `TimerExamples.lua`
- Per-Second (buffs, activity monitoring)
- Per-Minute (bonuses, auto-save, population)
- Per-5-Minutes (spawn control, statistics)
- Per-Hour (rewards, rankings, cleanup)
- Event-Based (siege, boss, tournaments)

### **Filter Examples**
See: `FilterExamples.lua`
- Player Filters (level, VIP, stats, location)
- Monster Filters (class, HP, area)
- Practical Use Cases (event validation, PvP balance)

---

## 💡 How to Use

### 1. **Find Your Use Case**
Browse the table above or open the relevant file.

### 2. **Copy Function**
Each function is self-contained and ready to use:

```lua
-- From IteratorExamples.lua
function SendGlobalAnnouncement(message, messageType)
    local count = 0
    
    Object.ForEachPlayer(function(oPlayer)
        Message.Send(0, oPlayer.Index, messageType or 0, message)
        count = count + 1
        return true
    end)
    
    Log.Add(string.format("Sent announcement to %d players", count))
end
```

### 3. **Adapt to Your Server**
Modify parameters, rewards, or logic to fit your server's needs.

### 4. **Test**
Always test new functions in a development environment first!

---

## ⚠️ Important Notes

### **VIP System**
Examples assume this VIP level system:
```lua
-1 = No VIP
 0 = Basic VIP (minimum)
 1+ = Higher VIP levels
```

If your server uses a different system, adjust comparisons:
- `>= 0` = Has any VIP level
- `> 0` = Has VIP level 1 or higher
- `== -1` = No VIP

See: `VIP_SYSTEM_NOTE.md` for details.

### **Performance**
All iterator functions are 10-100x faster than manual Lua loops. Use them for:
- ✅ Timer functions processing many objects
- ✅ Event systems
- ✅ Mass operations
- ✅ Statistics collection

Avoid for:
- ❌ Single player operations (use `GetObjByName` instead)
- ❌ Simple checks (use `CountPlayersOnMap` without filter)

### **Callback Return Values**
```lua
-- Continue iteration
return true

-- Break iteration early
return false

-- Also continues (no return)
-- Just omit return statement
```

---

## 🔧 Common Patterns

### **Simple Count**
```lua
local count = Object.CountPlayersOnMap(0)
```

### **Filtered Count**
```lua
local vipCount = Object.CountPlayersOnMap(0, function(oPlayer)
    return oPlayer.userData.VIPType >= 0
end)
```

### **Find and Process**
```lua
local oPlayer = Object.GetObjByName("PlayerName")
if oPlayer then
    Player.SetMoney(oPlayer.Index, 1000000, false)
end
```

### **Iterate and Process**
```lua
Object.ForEachPlayer(function(oPlayer)
    if oPlayer.Level >= 400 then
        -- Process high level player
    end
    return true
end)
```

### **Early Exit**
```lua
Object.ForEachMonster(function(oMonster)
    if oMonster.Class == 275 then
        Log.Add("Found Golden Goblin!")
        return false  -- Stop searching
    end
    return true
end)
```

---

## 📖 Example Index

### **IteratorExamples.lua**
```
Object.ForEach
├── CountAllObjects()
├── FindObjectAtPosition()
└── CleanupDisconnectedObjects()

Object.ForEachPlayer
├── SendGlobalAnnouncement()
├── AwardOnlineBonus()
├── CollectPlayerStats()
├── FindRichestPlayer()
└── AutoSaveAllPlayers()

Object.ForEachPlayerOnMap
├── TeleportAllFromMap()
├── ApplyMapBuff()
├── IsMapEmpty()
├── AwardZoneBonus()
└── GetMapDemographics()

Object.ForEachMonster
├── HealAllMonsters()
├── KillAllMonsters()
├── BuffAllMonsters()
├── FindWoundedMonsters()
└── GetMonsterStats()

Object.ForEachMonsterOnMap
├── ClearMapMonsters()
├── BuffMapMonsters()
├── CheckMonsterDensity()
└── FindBossOnMap()

Object.ForEachMonsterByClass
├── FindGoldenGoblins()
├── AnnounceBossSpawn()
├── KillMonsterType()
└── BuffMonsterType()

Object.ForEachPartyMember
├── AwardPartyBonus()
├── IsPartyTogether()
├── GetPartyAverageLevel()
├── TeleportParty()
└── PartyBroadcast()

Object.ForEachGuildMember
├── GuildBroadcast()
├── AwardGuildAchievement()
├── GetOnlineGuildCount()
├── TeleportGuildToWar()
└── GetGuildStats()

Object.ForEachNearby
├── AOEHeal()
├── AOEDamage()
├── FindNearestEnemy()
├── CountPlayersInArea()
├── ApplyAreaBuff()
└── GetNearbyObjectsInfo()
```

### **UtilityExamples.lua**
```
CountPlayersOnMap (Simple)
├── CheckMapPopulation()
├── MonitorCrowdedMaps()
└── IsMapBalanced()

CountPlayersOnMap (Filtered)
├── CountElitePlayersPerMap()
├── CountVIPPlayersOnMap()
├── CountPlayersByClassOnMap()
├── CountRichPlayersOnMap()
├── CountVeteranPlayersOnMap()
├── CountPlayersInArea()
├── CountSoloPlayersOnMap()
├── CountPartiedPlayersOnMap()
├── CountGuildPlayersOnMap()
└── CountLowHPPlayersOnMap()

CountMonstersOnMap (Simple)
├── CheckMapRespawn()
├── MonitorMonsterDensity()
└── IsMapClear()

CountMonstersOnMap (Filtered)
├── CountBossesOnMap()
├── CountMonsterTypeOnMap()
├── CountWoundedMonstersOnMap()
├── CountTankMonstersOnMap()
├── CountMonstersInArea()
└── CountEliteMonstersOnMap()

GetObjByName
├── TeleportPlayerByName()
├── IsPlayerOnline()
├── SendPrivateMessage()
├── GetPlayerInfo()
├── AwardPlayerByName()
└── KickPlayerByName()

Combined Usage
├── CheckEventEligibility()
├── CheckPvPBalance()
├── CalculateDynamicDifficulty()
├── AutoSpawnControl()
├── CheckGuildWarReady()
├── InvitePlayersToParty()
└── AwardTopPlayers()
```

---

## 🎓 Learning Path

1. **Start with simple examples** → `UtilityExamples.lua`
2. **Learn iterators** → `IteratorExamples.lua`
3. **Explore filters** → `FilterExamples.lua`
4. **Add timers** → `TimerExamples.lua`
5. **Build events** → `EventExamples.lua`
6. **Create PvP** → `PvPExamples.lua`
7. **Admin tools** → `AdminExamples.lua`
8. **Combat systems** → `CombatExamples.lua`

---

## 📝 Contributing

When adding new examples:
1. Use clear, descriptive function names
2. Include comments explaining logic
3. Add to appropriate file
4. Update this README

---

## ❓ Support

- See main documentation: `../Reference/GLOBAL_FUNCTIONS.md`
- C++ implementation: `../ObjectIterators_CPP_Implementation.cpp`
- Change log: `../ITERATOR_UPDATE.md`
- VIP notes: `../VIP_SYSTEM_NOTE.md`

---

**Total Examples: 200+**  
**Total Functions Covered: 12/12**  
**All ready to copy-paste and use!** ✅
