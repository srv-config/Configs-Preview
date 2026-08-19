--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Database Callbacks - Query Results
------------------------------------------------------------------
-- Fires once per column, per row; values are strings (tonumber).
-- An empty result still fires once with oRow = nil. Large results
-- span several packets in any order, so accumulate by btCurrentPacket
-- and finish on bIsLastPacket.
------------------------------------------------------------------

-- Called when DataServer database query result is received (Async)
function onDSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
	local Q = Enums.QueryDS

	if (oRow ~= nil) then
		-- Coin Exchange loads (Windows\CoinExchange.lua)
		if (iQueryNumber == Q.EXCHANGE_LOAD_DAILY or iQueryNumber == Q.EXCHANGE_LOAD_HISTORY) then
			CoinExchangeDB.OnRow(iPlayerIndex, iQueryNumber, btCurrentPacket, iCurrentRow, oRow)
		end
	end

	if (bIsLastPacket == 1 or bIsLastPacket == true) then
		if (iQueryNumber == Q.EXCHANGE_LOAD_DAILY or iQueryNumber == Q.EXCHANGE_LOAD_HISTORY) then
			CoinExchangeDB.OnComplete(iPlayerIndex, iQueryNumber)
		end
	end
end

-- Called when JoinServer database query result is received (Async)
function onJSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
	if (oRow ~= nil) then

	end
end
