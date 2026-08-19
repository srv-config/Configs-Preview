/* ===========================================================================
   Coin Exchange - schema and stored procedures
   Target: SQL Server 2012 and later (uses FORMAT, MERGE, TOP (@var)).

   Run once against the game (Muonline) database. Re-runnable: it creates the
   tables and procedures only if they are missing / drops-and-recreates the procs.

   Used by Data\Plugins\LuaAPI\Windows\CoinExchange.lua through DB.QueryDS:
     IGC_CoinExchange_LoadDaily     - today's converted total for a character
     IGC_CoinExchange_LoadHistory   - the character's recent conversions
     IGC_CoinExchange_AddConversion - record one conversion (counter + history)
   =========================================================================== */

SET NOCOUNT ON;
GO

/* ---- daily counter: one row per character per day ---------------------- */
IF OBJECT_ID(N'dbo.IGC_CoinExchange_Daily', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IGC_CoinExchange_Daily
    (
        CharacterId INT  NOT NULL,
        ConvertDate DATE NOT NULL,
        UsedWCoin   INT  NOT NULL CONSTRAINT DF_IGC_CE_Daily_Used DEFAULT (0),
        CONSTRAINT PK_IGC_CoinExchange_Daily PRIMARY KEY (CharacterId, ConvertDate)
    );
END
GO

/* ---- history: one row per conversion ----------------------------------- */
IF OBJECT_ID(N'dbo.IGC_CoinExchange_History', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IGC_CoinExchange_History
    (
        Id          BIGINT   IDENTITY(1,1) NOT NULL,
        CharacterId INT      NOT NULL,
        ConvertedAt DATETIME NOT NULL CONSTRAINT DF_IGC_CE_Hist_At DEFAULT (GETDATE()),
        SpentWCoin  INT      NOT NULL,
        GainedRuud  INT      NOT NULL,
        CONSTRAINT PK_IGC_CoinExchange_History PRIMARY KEY (Id)
    );

    CREATE INDEX IX_IGC_CoinExchange_History_Char
        ON dbo.IGC_CoinExchange_History (CharacterId, ConvertedAt DESC);
END
GO

/* ---- today's converted total (empty result => nothing converted today) - */
IF OBJECT_ID(N'dbo.IGC_CoinExchange_LoadDaily', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_CoinExchange_LoadDaily;
GO
CREATE PROCEDURE dbo.IGC_CoinExchange_LoadDaily
    @CharacterId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UsedWCoin
    FROM dbo.IGC_CoinExchange_Daily
    WHERE CharacterId = @CharacterId
      AND ConvertDate = CAST(GETDATE() AS DATE);
END
GO

/* ---- recent conversions, newest first ---------------------------------- */
IF OBJECT_ID(N'dbo.IGC_CoinExchange_LoadHistory', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_CoinExchange_LoadHistory;
GO
CREATE PROCEDURE dbo.IGC_CoinExchange_LoadHistory
    @CharacterId INT,
    @Max         INT = 20
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@Max)
        FORMAT(ConvertedAt, N'MM-dd HH:mm') AS ConvertLabel,
        SpentWCoin,
        GainedRuud
    FROM dbo.IGC_CoinExchange_History
    WHERE CharacterId = @CharacterId
    ORDER BY ConvertedAt DESC;
END
GO

/* ---- record one conversion: bump today's counter, append history ------- */
IF OBJECT_ID(N'dbo.IGC_CoinExchange_AddConversion', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_CoinExchange_AddConversion;
GO
CREATE PROCEDURE dbo.IGC_CoinExchange_AddConversion
    @CharacterId INT,
    @SpentWCoin  INT,
    @GainedRuud  INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @today DATE = CAST(GETDATE() AS DATE);

    MERGE dbo.IGC_CoinExchange_Daily AS t
    USING (SELECT @CharacterId AS CharacterId, @today AS ConvertDate) AS s
        ON (t.CharacterId = s.CharacterId AND t.ConvertDate = s.ConvertDate)
    WHEN MATCHED THEN
        UPDATE SET UsedWCoin = t.UsedWCoin + @SpentWCoin
    WHEN NOT MATCHED THEN
        INSERT (CharacterId, ConvertDate, UsedWCoin)
        VALUES (@CharacterId, @today, @SpentWCoin);

    INSERT dbo.IGC_CoinExchange_History (CharacterId, SpentWCoin, GainedRuud)
    VALUES (@CharacterId, @SpentWCoin, @GainedRuud);
END
GO
