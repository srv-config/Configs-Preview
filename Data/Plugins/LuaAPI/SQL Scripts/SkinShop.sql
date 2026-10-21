-- Skin Shop tables and procedures for the MuOnline database; re-runnable, see Client\SkinShop\README.md in the server repo.

SET NOCOUNT ON;
GO

/* ---- what a character owns: ExpireAt NULL means permanent --------------- */
IF OBJECT_ID(N'dbo.IGC_SkinShop_Owned', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IGC_SkinShop_Owned
    (
        CharacterId INT      NOT NULL,
        SkinId      INT      NOT NULL,
        ExpireAt    DATETIME NULL,
        CONSTRAINT PK_IGC_SkinShop_Owned PRIMARY KEY (CharacterId, SkinId)
    );
END
GO

/* ---- the skin a character wears: no row means none ---------------------- */
IF OBJECT_ID(N'dbo.IGC_SkinShop_Active', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IGC_SkinShop_Active
    (
        CharacterId INT NOT NULL,
        SkinId      INT NOT NULL,
        CONSTRAINT PK_IGC_SkinShop_Active PRIMARY KEY (CharacterId)
    );
END
GO

/* ---- every purchase, for support questions ------------------------------ */
IF OBJECT_ID(N'dbo.IGC_SkinShop_History', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IGC_SkinShop_History
    (
        Id          BIGINT   IDENTITY(1,1) NOT NULL,
        CharacterId INT      NOT NULL,
        SkinId      INT      NOT NULL,
        OptionIndex TINYINT  NOT NULL,
        Seconds     INT      NOT NULL,   -- 0 = permanent
        Price       INT      NOT NULL,
        CoinType    TINYINT  NOT NULL,   -- 0 Zen, 1 WCoin, 2 Goblin Point, 3 Ruud
        BoughtAt    DATETIME NOT NULL CONSTRAINT DF_IGC_SkinShop_Hist_At DEFAULT (GETDATE()),
        CONSTRAINT PK_IGC_SkinShop_History PRIMARY KEY (Id)
    );

    CREATE INDEX IX_IGC_SkinShop_History_Char
        ON dbo.IGC_SkinShop_History (CharacterId, BoughtAt DESC);
END
GO

/* ---- owned skins; SecondsLeft is 0 for a permanent or an expired one ---- */
IF OBJECT_ID(N'dbo.IGC_SkinShop_Load', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_SkinShop_Load;
GO
CREATE PROCEDURE dbo.IGC_SkinShop_Load
    @CharacterId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @now DATETIME = GETDATE();

    SELECT
        o.SkinId,
        CASE WHEN o.ExpireAt IS NULL THEN 1 ELSE 0 END AS Permanent,
        CASE WHEN o.ExpireAt IS NULL OR o.ExpireAt <= @now THEN 0
             ELSE DATEDIFF(SECOND, @now, o.ExpireAt) END AS SecondsLeft,
        CASE WHEN a.SkinId = o.SkinId THEN 1 ELSE 0 END AS Active
    FROM dbo.IGC_SkinShop_Owned AS o
    LEFT JOIN dbo.IGC_SkinShop_Active AS a ON a.CharacterId = o.CharacterId
    WHERE o.CharacterId = @CharacterId;
END
GO

/* ---- one purchase: a timed one extends from the later of now and expiry - */
IF OBJECT_ID(N'dbo.IGC_SkinShop_Grant', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_SkinShop_Grant;
GO
CREATE PROCEDURE dbo.IGC_SkinShop_Grant
    @CharacterId INT,
    @SkinId      INT,
    @Seconds     INT,
    @OptionIndex TINYINT,
    @Price       INT,
    @CoinType    TINYINT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @now DATETIME = GETDATE();

    IF EXISTS (SELECT 1 FROM dbo.IGC_SkinShop_Owned WHERE CharacterId = @CharacterId AND SkinId = @SkinId)
    BEGIN
        UPDATE dbo.IGC_SkinShop_Owned
        SET ExpireAt = CASE
                WHEN @Seconds = 0 OR ExpireAt IS NULL THEN NULL
                WHEN ExpireAt > @now THEN DATEADD(SECOND, @Seconds, ExpireAt)
                ELSE DATEADD(SECOND, @Seconds, @now) END
        WHERE CharacterId = @CharacterId AND SkinId = @SkinId;
    END
    ELSE
    BEGIN
        INSERT dbo.IGC_SkinShop_Owned (CharacterId, SkinId, ExpireAt)
        VALUES (@CharacterId, @SkinId, CASE WHEN @Seconds = 0 THEN NULL ELSE DATEADD(SECOND, @Seconds, @now) END);
    END

    INSERT dbo.IGC_SkinShop_History (CharacterId, SkinId, OptionIndex, Seconds, Price, CoinType)
    VALUES (@CharacterId, @SkinId, @OptionIndex, @Seconds, @Price, @CoinType);
END
GO

/* ---- the worn skin; 0 takes it off -------------------------------------- */
IF OBJECT_ID(N'dbo.IGC_SkinShop_SetActive', N'P') IS NOT NULL
    DROP PROCEDURE dbo.IGC_SkinShop_SetActive;
GO
CREATE PROCEDURE dbo.IGC_SkinShop_SetActive
    @CharacterId INT,
    @SkinId      INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @SkinId = 0
    BEGIN
        DELETE dbo.IGC_SkinShop_Active WHERE CharacterId = @CharacterId;
        RETURN;
    END

    UPDATE dbo.IGC_SkinShop_Active SET SkinId = @SkinId WHERE CharacterId = @CharacterId;

    IF @@ROWCOUNT = 0
        INSERT dbo.IGC_SkinShop_Active (CharacterId, SkinId) VALUES (@CharacterId, @SkinId);
END
GO
