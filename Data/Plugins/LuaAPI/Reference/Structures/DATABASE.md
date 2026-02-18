# Database Query Structures

Complete reference for database query result structures exposed to Lua.

---

## ⚠️ CRITICAL: Data Type Handling

**All database query results are returned as strings**, regardless of the actual column type in the database (INT, FLOAT, REAL, VARCHAR, etc.).

### Type Conversion Required

You must manually convert string results to appropriate Lua types:

```lua
-- For integers (INT, BIGINT, SMALLINT, TINYINT)
local playerLevel = math.tointeger(oRow:GetValue())

-- For floating-point numbers (FLOAT, REAL, DECIMAL, NUMERIC)
local experienceRate = tonumber(oRow:GetValue())

-- For strings (VARCHAR, CHAR, TEXT) - no conversion needed
local playerName = oRow:GetValue()
```

**Example:**
```lua
-- Query returns: Level (INT), Money (BIGINT), Name (VARCHAR)
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	local columnName = oRow:GetColumnName()
	local valueStr = oRow:GetValue()  -- Always a string!
	
	if columnName == "Level" then
		local level = math.tointeger(valueStr)  -- Convert to integer
		Log.Add(string.format("Player level: %d", level))
	elseif columnName == "Money" then
		local money = math.tointeger(valueStr)  -- Convert to integer
		Log.Add(string.format("Player money: %d", money))
	elseif columnName == "Name" then
		Log.Add(string.format("Player name: %s", valueStr))  -- Already string
	end
end
```

---

## Table of Contents

- [QueryResultDS Structure](#queryresultds-structure)
- [QueryResultJS Structure](#queryresultjs-structure)
- [Usage Examples](#usage-examples)

---

## QueryResultDS Structure

**Access:** Via `DSDBQueryReceive` callback parameter

**C++ Type:** `LuaQueryResultDS`

**Description:** Read-only structure containing DataServer database query results. Cannot be instantiated - only accessible through callback.

### Fields

| Field | Type | Description |
|-------|------|-------------|
| `ColumnType` | BYTE | Column data type (0-255) |

### Methods

#### GetColumnName

```lua
oRow:GetColumnName()
```

**Returns:** `string` - Column name (max 30 characters)

**Usage:**
```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local columnName = oRow:GetColumnName()
    Log.Add("Column: " .. columnName)
end
```

---

#### GetValue

```lua
oRow:GetValue()
```

**Returns:** `string` - Column value (max 64 characters)

**Usage:**
```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local value = oRow:GetValue()
    Log.Add("Value: " .. value)
end
```

---

### Callback Function

#### DSDBQueryReceive

```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
```

**Called when:** DataServer query results are received

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `iPlayerIndex` | int | Player object index who initiated the query |
| `iQueryNumber` | int | Unique query identifier (defined when query was sent) |
| `bIsLastPacket` | bool | `1` if last packet, `0` if more packets coming |
| `iCurrentRow` | int | Current row number being processed within this packet |
| `iColumnCount` | int | Total number of columns returned by the query |
| `iCurrentPacket` | int | Current packet number (0-based, increments for multi-packet results) |
| `oRow` | QueryResultDS | Query result row object containing column data |

**Notes:**

- Large result sets are split into multiple packets (max 32 rows per packet)
- This callback is triggered once per row in the result set
- Use `iQueryNumber` to match responses with their corresponding queries
- Check `bIsLastPacket` to know when all results have been received
- Each `oRow` contains data for one column of the current row

**Usage:**
```lua
-- Send query
DB.QueryDS(iPlayerIndex, 1001, string.format("SELECT Name, Level FROM Character WHERE AccountID = '%s'", accountId))

-- Receive results
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    if iQueryNumber == 1001 then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        Log.Add(string.format("%s = %s", columnName, value))
        
        if bIsLastPacket == 1 then
            Log.Add("Query complete")
        end
    end
end
```

---

## QueryResultJS Structure

**Access:** Via `JSDBQueryReceive` callback parameter

**C++ Type:** `LuaQueryResultJS` (also known as `stLuaRow`)

**Description:** Read-only structure containing JoinServer database query results. Cannot be instantiated - only accessible through callback.

**Note:** This structure is also referenced as `stLuaRow` in some contexts - they are identical.

### Fields

| Field | Type | Description |
|-------|------|-------------|
| `ColumnType` | BYTE | Column data type (0-255) |

### Methods

#### GetColumnName

```lua
oRow:GetColumnName()
```

**Returns:** `string` - Column name (max 30 characters)

**Usage:**
```lua
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local columnName = oRow:GetColumnName()
    Log.Add("Column: " .. columnName)
end
```

---

#### GetValue

```lua
oRow:GetValue()
```

**Returns:** `string` - Column value (max 64 characters)

**Usage:**
```lua
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local value = oRow:GetValue()
    Log.Add("Value: " .. value)
end
```

---

### Callback Function

#### JSDBQueryReceive

```lua
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
```

**Called when:** JoinServer query results are received

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `iPlayerIndex` | int | Player object index who initiated the query |
| `iQueryNumber` | int | Unique query identifier (defined when query was sent) |
| `bIsLastPacket` | bool | `1` if last packet, `0` if more packets coming |
| `iCurrentRow` | int | Current row number being processed within this packet |
| `iColumnCount` | int | Total number of columns returned by the query |
| `iCurrentPacket` | int | Current packet number (0-based, increments for multi-packet results) |
| `oRow` | QueryResultJS | Query result row object containing column data |

**Notes:**

- Large result sets are split into multiple packets (max 32 rows per packet)
- This callback is triggered once per row in the result set
- Use `iQueryNumber` to match responses with their corresponding queries
- Check `bIsLastPacket` to know when all results have been received
- Each `oRow` contains data for one column of the current row

**Usage:**
```lua
-- Send query
DB.QueryJS(iPlayerIndex, 2001, string.format("SELECT memb__id, credits FROM MEMB_INFO WHERE memb__id = '%s'", accountId))

-- Receive results
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    if iQueryNumber == 2001 then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        Log.Add(string.format("%s = %s", columnName, value))
        
        if bIsLastPacket == 1 then
            Log.Add("Query complete")
        end
    end
end
```

---

## Usage Examples

### Example 1: Basic Query Result Handler (DataServer)

```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local columnName = oRow:GetColumnName()
    local value = oRow:GetValue()
    
    Log.Add(string.format("Player: %d", iPlayerIndex))
    Log.Add(string.format("Query: %d", iQueryNumber))
    Log.Add(string.format("Column: %s = %s", columnName, value))
    
    if bIsLastPacket == 1 then
        Log.Add("All results received")
    end
end
```

### Example 2: Basic Query Result Handler (JoinServer)

```lua
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    local columnName = oRow:GetColumnName()
    local value = oRow:GetValue()
    
    Log.Add(string.format("Player: %d", iPlayerIndex))
    Log.Add(string.format("Query: %d", iQueryNumber))
    Log.Add(string.format("Column: %s = %s", columnName, value))
    
    if bIsLastPacket == 1 then
        Log.Add("All results received")
    end
end
```

### Example 3: Collect Complete Result Set (DataServer)

```lua
-- Global storage
local queryResults = {}

function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    -- Initialize storage for this query
    if queryResults[iQueryNumber] == nil then
        queryResults[iQueryNumber] = {}
    end
    
    -- Initialize storage for this row
    if queryResults[iQueryNumber][iCurrentRow] == nil then
        queryResults[iQueryNumber][iCurrentRow] = {}
    end
    
    -- Store column data
    local columnName = oRow:GetColumnName()
    local value = oRow:GetValue()
    queryResults[iQueryNumber][iCurrentRow][columnName] = value
    
    -- Process complete results when last packet received
    if bIsLastPacket == 1 then
        Log.Add(string.format("Query %d complete with %d rows", iQueryNumber, iCurrentRow))
        
        -- Process all rows
        for rowNum, rowData in pairs(queryResults[iQueryNumber]) do
            Log.Add(string.format("Row %d:", rowNum))
            for colName, colValue in pairs(rowData) do
                Log.Add(string.format("  %s: %s", colName, colValue))
            end
        end
        
        -- Clean up
        queryResults[iQueryNumber] = nil
    end
end
```

### Example 4: Handle Specific Query by Number (with Type Conversion)

```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	local columnName = oRow:GetColumnName()
	local valueStr = oRow:GetValue()  -- Always returns string!
	
	if iQueryNumber == 1001 then
		-- Handle player stats query
		if columnName == "Level" then
			local level = math.tointeger(valueStr)  -- Convert to integer
			Log.Add(string.format("Player level: %d", level))
		elseif columnName == "Kills" then
			local kills = math.tointeger(valueStr)  -- Convert to integer
			Log.Add(string.format("Player kills: %d", kills))
		elseif columnName == "Money" then
			local money = math.tointeger(valueStr)  -- Convert to integer
			Log.Add(string.format("Player money: %d", money))
		end
		
	elseif iQueryNumber == 1002 then
		-- Handle guild query
		if columnName == "GuildName" then
			Log.Add(string.format("Guild: %s", valueStr))  -- String - no conversion
		elseif columnName == "GuildMaster" then
			Log.Add(string.format("Master: %s", valueStr))  -- String - no conversion
		end
	end
end
```

### Example 5: Track Packet Progress

```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    Log.Add(string.format("Processing packet %d, row %d", iCurrentPacket, iCurrentRow))
    Log.Add(string.format("Total columns in result: %d", iColumnCount))
    
    local columnName = oRow:GetColumnName()
    local columnType = oRow.ColumnType
    local value = oRow:GetValue()
    
    Log.Add(string.format("%s (type %d): %s", columnName, columnType, value))
    
    if bIsLastPacket == 1 then
        Log.Add(string.format("Query %d finished", iQueryNumber))
    end
end
```

### Example 6: Build Character Data with Type Conversion (DataServer)

```lua
-- Global storage for character data
local characterData = {}

-- Send query
function LoadCharacterData(iPlayerIndex, characterName)
	DB.QueryDS(iPlayerIndex, 3001, 
		string.format("SELECT Name, cLevel, Strength, Dexterity, Vitality, Energy, Money FROM Character WHERE Name = '%s'", characterName))
end

-- Receive results
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	if iQueryNumber == 3001 then
		local columnName = oRow:GetColumnName()
		local valueStr = oRow:GetValue()
		
		-- Store character data
		if characterData[iPlayerIndex] == nil then
			characterData[iPlayerIndex] = {}
		end
		
		-- Convert numeric columns to proper types
		if columnName == "cLevel" or columnName == "Strength" or columnName == "Dexterity" or 
		   columnName == "Vitality" or columnName == "Energy" or columnName == "Money" then
			characterData[iPlayerIndex][columnName] = math.tointeger(valueStr)
		else
			characterData[iPlayerIndex][columnName] = valueStr  -- String (Name)
		end
		
		-- Process when complete
		if bIsLastPacket == 1 then
			local data = characterData[iPlayerIndex]
			
			Log.Add(string.format("Character: %s", data.Name or "Unknown"))
			Log.Add(string.format("Level: %d", data.cLevel or 0))
			Log.Add(string.format("STR: %d, DEX: %d, VIT: %d, ENE: %d", 
				data.Strength or 0,
				data.Dexterity or 0,
				data.Vitality or 0,
				data.Energy or 0))
			Log.Add(string.format("Money: %d", data.Money or 0))
			
			-- Send to player
			Message.Send(0, iPlayerIndex, 0, 
				string.format("Character loaded: %s (Level %d)", data.Name, data.cLevel))
			
			-- Clean up
			characterData[iPlayerIndex] = nil
		end
	end
end
```

### Example 7: Account Credits Query with Type Conversion (JoinServer)

```lua
-- Send query
function CheckAccountCredits(iPlayerIndex, accountId)
	DB.QueryJS(iPlayerIndex, 4001,
		string.format("SELECT credits, vip_level FROM MEMB_INFO WHERE memb__id = '%s'", accountId))
end

-- Receive results
function JSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	if iQueryNumber == 4001 then
		local columnName = oRow:GetColumnName()
		local valueStr = oRow:GetValue()
		
		if columnName == "credits" then
			local credits = math.tointeger(valueStr)  -- Convert to integer
			Message.Send(0, iPlayerIndex, 0, string.format("Credits: %d", credits))
		elseif columnName == "vip_level" then
			local vipLevel = math.tointeger(valueStr)  -- Convert to integer
			Message.Send(0, iPlayerIndex, 0, string.format("VIP Level: %d", vipLevel))
		end
	end
end
```

### Example 8: Top Players Ranking with Type Conversion (DataServer)

```lua
-- Global ranking data
local rankingData = {}

-- Send query (not associated with a specific player)
function LoadTopPlayers()
	DB.QueryDS(-1, 5001,
		"SELECT TOP 10 Name, cLevel, Resets FROM Character ORDER BY Resets DESC, cLevel DESC")
end

-- Receive results
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	if iQueryNumber == 5001 then
		local columnName = oRow:GetColumnName()
		local valueStr = oRow:GetValue()
		
		-- Initialize row storage
		if rankingData[iCurrentRow] == nil then
			rankingData[iCurrentRow] = {}
		end
		
		-- Store column data with proper type conversion
		if columnName == "Name" then
			rankingData[iCurrentRow][columnName] = valueStr  -- String
		else
			rankingData[iCurrentRow][columnName] = math.tointeger(valueStr)  -- Integer
		end
		
		-- Display when complete
		if bIsLastPacket == 1 then
			Log.Add("=== TOP 10 PLAYERS ===")
			
			for rank, data in pairs(rankingData) do
				Log.Add(string.format("%d. %s - Level %d - Resets: %d",
					rank,
					data.Name or "Unknown",
					data.cLevel or 0,
					data.Resets or 0))
			end
			
			-- Clean up
			rankingData = {}
		end
	end
end
```

### Example 9: Multi-Packet Results

```lua
-- Global storage for large result sets
local largeQueryResults = {}

function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    if iQueryNumber == 6001 then
        Log.Add(string.format("Packet %d - Row %d of large query", iCurrentPacket, iCurrentRow))
        
        -- Initialize storage
        if largeQueryResults[iCurrentRow] == nil then
            largeQueryResults[iCurrentRow] = {}
        end
        
        -- Store data
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        largeQueryResults[iCurrentRow][columnName] = value
        
        -- Only process when last packet received
        if bIsLastPacket == 1 then
            Log.Add(string.format("Large query complete: %d total rows received", iCurrentRow))
            
            -- Process all rows
            for rowNum, rowData in pairs(largeQueryResults) do
                -- Process each row...
            end
            
            -- Clean up
            largeQueryResults = {}
        end
    end
end
```

### Example 10: Error Handling

```lua
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
    if iQueryNumber == 7001 then
        -- Check if query returned results
        if iCurrentRow == 0 and bIsLastPacket == 1 then
            Log.Add("Query returned no results")
            Message.Send(0, iPlayerIndex, 0, "No data found")
            return
        end
        
        -- Check column count
        if iColumnCount == 0 then
            Log.Add("Query returned no columns")
            return
        end
        
        -- Safe value extraction
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        if columnName == nil or value == nil then
            Log.Add("Invalid column data")
            return
        end
        
        -- Process valid data
        Log.Add(string.format("%s = %s", columnName, value))
    end
end
```

---

## Important Notes

1. **Read-Only Structures:**
   - Both QueryResultDS and QueryResultJS are read-only
   - Cannot be instantiated directly in Lua
   - Only accessible through callback parameters

2. **Callback Execution:**
   - Callback is triggered once per column per row
   - For a query returning 3 columns and 5 rows, callback fires 15 times
   - Track `iCurrentRow` to distinguish between rows
   - Track `iColumnCount` to know how many columns per row

3. **Multi-Packet Results:**
   - Large result sets split into packets (max 32 rows per packet)
   - Use `bIsLastPacket` to detect completion
   - `iCurrentPacket` increments for each packet
   - Results must be accumulated across packets

4. **Query Number Usage:**
   - Use unique query numbers to identify different queries
   - Recommend ranges: 1000-1999 (DataServer), 2000-2999 (JoinServer)
   - Track active queries to avoid conflicts

5. **Data Types:**
   - All values returned as strings
   - Convert to numbers when needed: `tonumber(value)`
   - Handle NULL values: check for empty strings or nil

6. **Performance:**
   - Minimize database queries
   - Cache results when possible
   - Use prepared queries with parameters
   - Avoid queries in tight loops

7. **String Limits:**
   - Column names: max 30 characters
   - Column values: max 64 characters
   - Longer values may be truncated

8. **Player Index:**
   - Use `-1` for queries not associated with a specific player
   - Use actual player index for player-specific queries
   - The `iPlayerIndex` is used to identify which player receives the callback results
   - Always validate player index in callbacks before processing results

---

## See Also

- [PLAYER.md](PLAYER.md) - Player object reference
- [ITEM.md](ITEM.md) - Item structures
- [../Functions/GLOBAL_FUNCTIONS.md](../Functions/GLOBAL_FUNCTIONS.md) - DB.QueryDS(), DB.QueryJS()
- [../Functions/CALLBACKS.md](../Functions/CALLBACKS.md) - All callback functions
