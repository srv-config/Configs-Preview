--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Helpers.lua - Global Helper Functions
------------------------------------------------------------------
-- Utility functions for color conversion and item ID calculation.
-- Loaded globally via Use() - no require needed.
------------------------------------------------------------------

Helpers = {}

-- Replicates COLORREF RGB macro from Windows API
-- Converts RGB color components (0-255) to a single DWORD value
-- Usage: local color = Helpers.RGB(255, 0, 0)  -- Red
function Helpers.RGB(r, g, b)
	return (r & 0xFF) | ((g & 0xFF) << 8) | ((b & 0xFF) << 16)
end

-- Calculate ItemId from ItemType and ItemIndex
-- ItemType: Item group/category (0-15)
-- ItemIndex: Item index within the group (0-511)
-- Usage: local itemId = Helpers.MakeItemId(14, 13)
function Helpers.MakeItemId(ItemType, ItemIndex)
	return ItemType * 512 + ItemIndex
end

-- Extract ItemType from ItemId
-- Returns the item group/category (0-15)
-- Usage: local itemType = Helpers.GetItemType(7181)  -- Returns 14
function Helpers.GetItemType(ItemId)
	return math.floor(ItemId / 512)
end

-- Extract ItemIndex from ItemId
-- Returns the item index within the group (0-511)
-- Usage: local itemIndex = Helpers.GetItemIndex(7181)  -- Returns 13
function Helpers.GetItemIndex(ItemId)
	return ItemId % 512
end

