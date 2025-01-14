local T, C, L, _ = unpack(select(2, ...))
if C.nameplate.enable ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Polymorph -> http://www.wowhead.com/spell=118
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists! Report this to Shestak.|r")
		return "Empty"
	end
end

T.DebuffWhiteList = {
	-- Death Knight
	[SpellName(108194)] = true,	-- Asphyxiate
	[SpellName(47476)] = true,	-- Strangulate
	[SpellName(55078)] = true,	-- Blood Plague
	[SpellName(55095)] = true,	-- Frost Fever
	-- Druid
	[SpellName(33786)] = true,	-- Cyclone
	[SpellName(339)] = true,	-- Entangling Roots
	[SpellName(164812)] = true,	-- Moonfire
	[SpellName(164815)] = true,	-- Sunfire
	[SpellName(58180)] = true,	-- Infected Wounds
	[SpellName(155722)] = true,	-- Rake
	[SpellName(1079)] = true,	-- Rip
	-- Hunter
	[SpellName(3355)] = true,	-- Freezing Trap
	[SpellName(194279)] = true,	-- Caltrops
	[SpellName(13812)] = true,	-- Explosive Trap
	[SpellName(217200)] = true,	-- Barbed Shot
	-- Mage
	[SpellName(118)] = true,	-- Polymorph
	[SpellName(31661)] = true,	-- Dragon's Breath
	[SpellName(122)] = true,	-- Frost Nova
	[SpellName(44457)] = true,	-- Living Bomb
	[SpellName(114923)] = true,	-- Nether Tempest
	[SpellName(120)] = true,	-- Cone of Cold
	-- Monk
	[SpellName(115078)] = true,	-- Paralysis
	-- Paladin
	[SpellName(20066)] = true,	-- Repentance
	[SpellName(853)] = true,	-- Hammer of Justice
	[SpellName(183218)] = true,	-- Hand of Hindrance
	-- Priest
	[SpellName(204213)] = true,	-- Purge the Wicked
	[SpellName(9484)] = true,	-- Shackle Undead
	[SpellName(8122)] = true,	-- Psychic Scream
	[SpellName(64044)] = true,	-- Psychic Horror
	[SpellName(15487)] = true,	-- Silence
	[SpellName(589)] = true,	-- Shadow Word: Pain
	[SpellName(34914)] = true,	-- Vampiric Touch
	-- Rogue
	[SpellName(6770)] = true,	-- Sap
	[SpellName(2094)] = true,	-- Blind
	[SpellName(1776)] = true,	-- Gouge
	-- Shaman
	[SpellName(51514)] = true,	-- Hex
	[SpellName(3600)] = true,	-- Earthbind
	[SpellName(196840)] = true,	-- Frost Shock
	[SpellName(188389)] = true,	-- Flame Shock
	[SpellName(197209)] = true,	-- Lightning Rod
	-- Warlock
	[SpellName(710)] = true,	-- Banish
	[SpellName(6789)] = true,	-- Mortal Coil
	[SpellName(5782)] = true,	-- Fear
	[SpellName(5484)] = true,	-- Howl of Terror
	[SpellName(6358)] = true,	-- Seduction
	[SpellName(30283)] = true,	-- Shadowfury
	[SpellName(603)] = true,	-- Doom
	[SpellName(980)] = true,	-- Agony
	[SpellName(146739)] = true,	-- Corruption
	[SpellName(48181)] = true,	-- Haunt
	[SpellName(348)] = true,	-- Immolate
	[SpellName(30108)] = true,	-- Unstable Affliction
	-- Warrior
	[SpellName(5246)] = true,	-- Intimidating Shout
	[SpellName(132168)] = true,	-- Shockwave
	[SpellName(115767)] = true,	-- Deep Wounds
	-- Racial
	[SpellName(20549)] = true,	-- War Stomp (Tauren)
	[SpellName(107079)] = true,	-- Quaking Palm (Pandaren)
}

for _, spell in pairs(C.nameplate.debuffs_list) do
	T.DebuffWhiteList[SpellName(spell)] = true
end

T.DebuffBlackList = {
	-- [SpellName(spellID)] = true,	-- Spell Name
}

T.BuffWhiteList = {
	[SpellName(226510)] = true,	-- Sanguine Ichor
}

for _, spell in pairs(C.nameplate.buffs_list) do
	T.BuffWhiteList[SpellName(spell)] = true
end

T.BuffBlackList = {
	-- [SpellName(spellID)] = true,	-- Spell Name
}

T.PlateBlacklist = {
	["24207"] = true,	-- Army of the Dead
	["29630"] = true,	-- Fanged Pit Viper (Gundrak)
	["55659"] = true,	-- Wild Imp
	["167966"] = true,	-- Experimental Sludge (De Other Side)
}

T.InterruptCast = {
	-- De Other Side
	[332612] = true,	-- Healing Wave
	[332706] = true,	-- Heal
	[332084] = true,	-- Self-Cleaning Cycle
	-- Halls of Atonement
	[325700] = true,	-- Collect Sins
	[323552] = true,	-- Volley of Power
	-- Mists of Tirna Scithe
	[324914] = true,	-- Nourish the Forest
	[321828] = true,	-- Patty Cake
	[326046] = true,	-- Stimulate Resistance
	-- Spires of Ascension
	[327413] = true,	-- Rebellious Fist
	[317936] = true,	-- Forsworn Doctrine
	[327648] = true,	-- Internal Strife
	[328295] = true,	-- Greater Mending
	-- The Necrotic Wake
	[324293] = true,	-- Rasping Scream
	[334748] = true,	-- Drain Fluids
	[323190] = true,	-- Meat Shield
	[320822] = true,	-- Final Bargain
	[338353] = true,	-- Goresplatter
	[327130] = true,	-- Repair Flesh
	-- Theater of Pain
	[342139] = true,	-- Battle Trance
	[330562] = true,	-- Demoralizing Shout
	[342675] = true,	-- Bone Spear
	[341969] = true,	-- Withering Discharge
	[341977] = true,	-- Meat Shield
	[330868] = true,	-- Necrotic Bolt Volley
	-- Plaguefall
	[329239] = true,	-- Creepy Crawlers
	-- Sanguine Depths
	[322433] = true,	-- Stoneskin
}

T.ImportantCast = {
	-- Halls of Atonement
	[326450] = true,	-- Loyal Beasts
	-- Theater of Pain
	[330586] = true,	-- Devour Flesh
	-- Plaguefall
	[328177] = true,	-- Fungistorm
}

local color = C.nameplate.mob_color
local color2 = {0, 0.7, 0.6}
T.ColorPlate = {
	-- Mists of Tirna Scithe
	["164921"] = color,		-- Drust Harvester
	["166299"] = color,		-- Mistveil Tender
	["166275"] = color2,	-- Mistveil Shaper
	["165251"] = color,		-- Illusionary Vulpin
	["167111"] = color,		-- Spinemaw Staghorn
	-- Plaguefall
	["169861"] = color,		-- Ickor Bileflesh
	-- Theater of Pain
	["174210"] = color,		-- Blighted Sludge-Spewer
	-- Halls of Atonement
	["165529"] = color,		-- Depraved Collector
	-- PvP
	["5925"] = color,		-- Grounding Totem
}