--[[
Quest_Define.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-08 10:45 AM
[ Author ]  Lee Junhui
[ Version ] 0.0.0.5
[ Text ]                                    
[ Desc ]                                    
--]]

-- LuaQuestClass = QuestExpLuaBind()  -- removed: new Sol2 wrapper registers functions globally

GENS_DUPRIAN    =   1--Duprian
GENS_VANERT =   2--Vanert

--User class
CLASS_WIZARD                                          = 0
CLASS_KNIGHT                                          = 1
CLASS_ELF                                             = 2
CLASS_MAGUMSA                                         = 3
CLASS_DARKLORD                                        = 4
CLASS_SUMMONER                                        = 5
CLASS_MONK                                            = 6

-- Condition check order check
ASK1 = 1
ASK2 = 2
ASK3 = 3
ASK4 = 4
-- Episode number definition
Ep1     =   1
Ep2     =   2
Ep3     =   3
Ep4     =   4
Ep5     =   5
Ep6     =   6
Ep7     =   7
Ep8     =   8
Ep9     =   9
Ep10        =   10
Ep11        =   11
Ep12        =   12
Ep13        =   13
Ep14        =   14
Ep15        =   15
Ep16        =   16
Ep17        =   17
Ep18        =   18
Ep19        =   19
Ep20        =   20

NPC_SHADOW_PHANTOM  =   257-- Shadow Phantom
NPC_GENS_DUPRIAN        =   543-- Gens Duprian
NPC_GENS_VANERT         =   544-- Gens Vanert
NPC_TERSIA          =   566-- Mercenary Manager Tersia
NPC_VAINA           =   567-- Priestess Vaina
NPC_ZAIRO           =   568-- Wandering Merchant Zairo
NPC_DERUBISH        =   581

-- Excellent option additional definition
ExOpt1  =   0x20
ExOpt2  =   0x10
ExOpt3  =   0x08
ExOpt4  =   0x04
ExOpt5  =   0x02
ExOpt6  =   0x01

-- Option additional definition
Opt4    =   1
Opt8    =   2
Opt12   =   3
Opt16   =   4

-- Party status
PartyPlay = 1

	EVENT_MAP_USER_KILL         = 0x0040-- User kill points
	EVENT_MAP_MON_KILL          = 0x0041-- Monster kill points
	EVENT_MAP_BLOOD_GATE            = 0x0042-- Blood Castle gate destruction
	EVENT_MAP_DEVIL_POINT           = 0x0104-- Devil Square point acquisition
	EVENT_MAP_CLEAR_BLOOD           = 0x0100-- Blood Castle clear
	EVENT_MAP_CLEAR_CHAOS           = 0x0101-- Chaos Castle clear
	EVENT_MAP_CLEAR_DEVIL           = 0x0102-- Devil Square clear
	EVENT_MAP_CLEAR_ILLUSION        = 0x0103-- Illusion Temple clear

EN_OVERLAP      =   0x0001-- Overlap
EN_DROP         =   0x0002-- Drop item on ground
EN_WAREHOUSE        =   0x0004-- Warehouse transfer
EN_SELL_SHOP        =   0x0008-- Shop sale
EN_PERSONAL_SHOP    =   0x0010-- Personal shop
EN_PERSONAL_TRADE   =   0x0020-- Personal trade
EN_QUEST_PROG       =   0x0040-- Use item to progress quest 


-- Daily (weekday) quests
Sun =   0
Mon =   1
Tue =   2
Wed =   3
Thu =   4
Fri =   5
Sat =   6

-- PVP quest condition
VULCANUS = 63

-- Quests Configs
QuestResetMasterSkill   = 1
QuestGensMuBlue         = 1
QuestExtendStorage      = 1