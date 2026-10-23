--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- UIProtocol.lua - Wire Contract for the Lua UI Window Channel
------------------------------------------------------------------
-- Server mirror of the client's Data\Custom\Scripts\UI\Protocol.lua
-- (window ids additionally mirror the client's Registry.lua).
-- Both sides MUST stay value-for-value identical - change one,
-- change the other.
--
-- One table per system, holding its actions, its result codes and
-- its limits. A system's constants never live outside its own
-- table, so two windows can never disagree about what a number
-- means.
--
-- There are two channels, carrying the same payload primitives and
-- differing only in what addresses a message:
--
--   windows   addressed by window id + action, routed by
--             UIWindow.lua and described by this file.
--   general   addressed by an opcode, for anything without a window
--             of its own. Routed by Includes\Net.lua.
--
-- Rules shared by both channels:
--   * the ANS result travels as an unsigned BYTE, 0 means success
--   * an open request is granted only on result 0
--   * payload primitives, all little-endian:
--       byte 1  word 2  dword 4  qword 8    unsigned integers
--       float 4  double 8                   IEEE
--       text                                WORD length + raw bytes
--       str                                 fixed width, zero padded
--     float holds only ~7 significant digits - reach for double, or for
--     dword/qword when the value is a whole number. qword is exact to 2^53
--     on the client, whose Lua numbers are doubles; item serials use the
--     full 64 bits, so send those as two dwords or as text. See UIPacket.lua.
------------------------------------------------------------------

UIProtocol = {}

-- Window ids (client: Registry.lua R.win)
UIProtocol.WINDOW = {
	DEMO     = 1,
	EXCHANGE = 3,
	SKINSHOP = 20,
}

------------------------------------------------------------------
-- Coin Exchange - converts WCoin to Ruud at a fixed rate.
--
-- C->S  CONVERT   dword amount
--
-- S->C  RATE      dword rate, dword wcoin, dword ruud
-- S->C  HISTORY   byte count, then per entry:
--                   text  date
--                   dword spent
--                   dword gained
--
-- The rate also travels on the general channel under TICKER_OP, so the client's
-- HUD ticker has it without the window being open.
------------------------------------------------------------------
UIProtocol.Exchange = {
	id = UIProtocol.WINDOW.EXCHANGE,

	RATE    = 1,
	CONVERT = 2,
	HISTORY = 3,

	MIN = 100,
	MAX = 100000,

	TICKER_OP = 110,

	RESULT = {
		OK         = 0,
		BAD_AMOUNT = 10,
		NO_FUNDS   = 11,
		LIMIT      = 12,
	},
}

------------------------------------------------------------------
-- Skin Shop - transformation skins bought for a time or for good.
--
-- C->S  BUY       word skin, byte option (0-based, <Option> order),
--                 dword price, byte coin - what the player saw; a timed skin
--                 already owned is extended
-- C->S  EQUIP     word skin
-- C->S  UNEQUIP   nothing
--
-- S->C  STATE     byte n, n x (byte coin, dword balance),
--                 word active (NONE when no skin is worn),
--                 byte m, m x (word skin, byte permanent, dword secondsLeft)
-- S->C  EXPIRY    word skin - the worn skin ran out and came off; the client
--                 shows the notice in its own language (CustomText)
--
-- BUY, EQUIP and UNEQUIP are answered with the same action and a result; a
-- success and a changed price are followed by a full STATE.
------------------------------------------------------------------
UIProtocol.SkinShop = {
	id = UIProtocol.WINDOW.SKINSHOP,

	STATE   = 1,
	BUY     = 2,
	EQUIP   = 3,
	UNEQUIP = 4,
	EXPIRY  = 5,

	NONE = 65535,

	RESULT = {
		OK            = 0,
		BAD_SKIN      = 10,
		NO_FUNDS      = 11,
		OWNED         = 12,
		NOT_OWNED     = 13,
		EXPIRED       = 14,
		PRICE_CHANGED = 15,
		BLOCKED       = 16,
	},
}

-- Shared game enum, not a per-window protocol value: currency ids as used
-- server-wide by CoinMng and by every ItemBank.xml *CoinType attribute. The
-- XML writes -1 for "free"; on the wire it travels as an unsigned byte.
UIProtocol.COIN = {
	ZEN    = 0,
	WCOIN  = 1,
	GOBLIN = 2,
	RUUD   = 3,
	FREE   = 255,
}
