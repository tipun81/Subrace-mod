--subrStrings = {
--10. NONE_STRINGS = "",
--1.  AASIMAR = "Аасимар",
--2.  TIEFLING = "Тифлинг",
--3.  DROW = "Дроу",
--4.  WILD_ELF = "Дикий эльф",
--5.  DWARF_GOLD = "Золотой дварф",
--6.  DWARF_GRAY = "Серый дварф",
--7.  HALFLING_STRONGHEART = "Крепкий полурослик",
--8.  HALFLING_GHOSTWISE = "Скрытный полурослик",
--9.  GNOME_DEEP = "Глубинный гном",
--11. MOON_ELF = "Лунный эльф",
--}

--function subt(char)
--	local var = Infinity_GetScriptVarInt("SUBRACE","LOCALS", char)
--	if (var == 0) then return subrStrings.NONE_STRINGS
--	elseif (var == 1) then return " / " .. subrStrings.AASIMAR
--	elseif (var == 2) then return " / " .. subrStrings.TIEFLING
--	elseif (var == 3) then return " / " .. subrStrings.DROW
--	elseif (var == 4) then return " / " .. subrStrings.WILD_ELF
--	elseif (var == 5) then return " / " .. subrStrings.DWARF_GOLD
--	elseif (var == 6) then return " / " .. subrStrings.DWARF_GRAY
--	elseif (var == 7) then return " / " .. subrStrings.HALFLING_STRONGHEART
--	elseif (var == 8) then return " / " .. subrStrings.HALFLING_GHOSTWISE
--	elseif (var == 9) then return " / " .. subrStrings.GNOME_DEEP
--	elseif (var == 9) then return " / " .. subrStrings.MOON_ELF
--	end
--end

function subt(chr)
	--local var = Infinity_GetScriptVarInt("SUBRACE","LOCALS", char)
	--if (chr == 0) then return subrStrings.NONE_STRINGS
	--elseif (chr == 1) then return " / " .. --subrStrings.AASIMAR
	if     (chr == 1) then return Infinity_FetchString(%aasimar_title%) --subrStrings.AASIMAR
	elseif (chr == 2) then return Infinity_FetchString(%tiefling_title%) --subrStrings.TIEFLING
	elseif (chr == 3) then return Infinity_FetchString(%drow_title%) --subrStrings.DROW
	elseif (chr == 4) then return Infinity_FetchString(%wild_elf_title%) --subrStrings.WILD_ELF
	elseif (chr == 5) then return Infinity_FetchString(%dwfgold_title%) --subrStrings.DWARF_GOLD
	elseif (chr == 6) then return Infinity_FetchString(%dwfduerg_title%) --subrStrings.DWARF_GRAY
	elseif (chr == 7) then return Infinity_FetchString(%hflstrong_title%) --subrStrings.HALFLING_STRONGHEART
	elseif (chr == 8) then return Infinity_FetchString(%hflhide_title%) --subrStrings.HALFLING_GHOSTWISE
	elseif (chr == 9) then return Infinity_FetchString(%svirfn_title%) --subrStrings.GNOME_DEEP
	elseif (chr == 11) then return Infinity_FetchString(%moon_elf_title%) --subrStrings.MOON_ELF
	else return ""
	end
end

function zzApplyRaseSpell(chr)
	if     (chr == 1) then C:ApplySpellRES("SR_AASIM",chargen) --subrStrings.AASIMAR
	elseif (chr == 2) then C:ApplySpellRES("SR_TIEFL",chargen) --subrStrings.TIEFLING
	elseif (chr == 3) then C:ApplySpellRES("SR_DROW",chargen) --subrStrings.DROW
	elseif (chr == 4) then C:ApplySpellRES("SR_EWILD",chargen) --subrStrings.WILD_ELF
	elseif (chr == 5) then C:ApplySpellRES("SR_DWGLD",chargen) --subrStrings.DWARF_GOLD
	elseif (chr == 6) then C:ApplySpellRES("SR_DUERG",chargen) --subrStrings.DWARF_GRAY
	elseif (chr == 7) then C:ApplySpellRES("SR_HLSTR",chargen) --subrStrings.HALFLING_STRONGHEART
	elseif (chr == 8) then C:ApplySpellRES("SR_HLGHO",chargen) --subrStrings.HALFLING_GHOSTWISE
	elseif (chr == 9) then C:ApplySpellRES("SR_SVIRF",chargen) --subrStrings.GNOME_DEEP
	end
	C:SetGlobal("Pl_SUBRACE","GLOBAL",10)
end --currSubrace

function getSubraceTitleButton(currS)
	if subt(currS) ~= "" then
		return subt(currS)
	else
		return Infinity_FetchString(%select_subrase%)
	end
end

currSubrace = 10
currRace = 0
getSubrace = 0
sbSubraceData = {}
srText = ""

function zzSubraceString()
	if srText == "" then
		return ""
	else
		return " ( " .. srText .. " )"
	end
end

function createSubraceTable(race)
	sbSubraceData = {}
	if race == 1 then --human
		sbSubraceData = {
			{%Zhuman_title%, %bghuman%, 10},
			{%Zaasimar_title%, %aasimar_desc%, 1},
			{%Ztiefling_title%, %tiefling_desc%, 2},
		}
	end
	if race == 2 then --elf
		sbSubraceData = {
			{%Zelf_title%, %bgelf%, 10},
			{%Zdrow_title%, %drow_desc%, 3},
			{%Zwild_elf_title%, %wild_elf_desc%, 4},
			{%Zmoon_elf_title%, %moon_elf_desc%, 11},
        }    
	end
	if race == 3 then --halfelf
		sbSubraceData = {
			{%Zhalfelf_title%, %bghalfelf%, 10},
		}
	end
	if race == 4 then --dwarf
		sbSubraceData = {
			{%Zdwarf_title%, %bgdwarf%, 10},
			{%Zdwfgold_title%, %dwfgold_desc%, 5},
			{%Zdwfduerg_title%, %dwfduerg_desc%, 6},
		}    
	end
	if race == 5 then --halfling
		sbSubraceData = {
			{%Zhalfling_title%, %bghalfling%, 10},
			{%Zhflstrong_title%, %hflstrong_desc%, 7},
			{%Zhflhide_title%, %hflhide_desc%, 8},
		}    
	end
	if race == 6 then --gnome
		sbSubraceData = {
			{%Zgnome_title%, %bggnome%, 10},
			{%Zsvirfn_title%, %svirfn_desc%, 9},
		}
	end
	if race == 7 then --halforc
		sbSubraceData = {
			{%Zhalforc_title%, %bghalforc%, 10},
		}
	end
end
sbSubraceDataEx = {}
function createSubraceTableEx()
	sbSubraceDataEx = {}
	sbSubraceDataEx = {
		{%Zaasimar_title%, %aasimar_desc%, 1},
		{%Ztiefling_title%, %tiefling_desc%, 2},
		{%Zdrow_title%, %drow_desc%, 3},
		{%Zwild_elf_title%, %wild_elf_desc%, 4},
		{%Zdwfgold_title%, %dwfgold_desc%, 5},
		{%Zdwfduerg_title%, %dwfduerg_desc%, 6},
		{%Zhflstrong_title%, %hflstrong_desc%, 7},
		{%Zhflhide_title%, %hflhide_desc%, 8},
		{%Zsvirfn_title%, %svirfn_desc%, 9},
		{0, 0, 10},
		{%Zmoon_elf_title%, %moon_elf_desc%, 11},
		}
end
createSubraceTableEx()

function getRaceSubraceTitle(sbr)
	if sbr == 1 then
		return Infinity_FetchString(%select_subraseA%)
	else
		return t("RACE_TITLE")
	end
end

function getSubraceTitle(row)
	local text = sbSubraceData[row][1]
	return Infinity_FetchString(text)
end

function getSubraceDescription(row)
	local text = sbSubraceData[row][2]
	return Infinity_FetchString(text)
end

function onSubraceButton(buttonNum)
	--local gl = sbSubraceData[buttonNum][3]
	C:SetGlobal("Pl_SUBRACE","GLOBAL",buttonNum)
end

function SubRaceOrGeneralHelp(sbr)
	if sbr == nil then
		return Infinity_FetchString(%select_sgenhlp%)
	else
		return Infinity_FetchString(sbSubraceData[sbr][2])
	end
end

function zzSubrClaickable()
	race = chargen.races[currentChargenRace]
	if race then
		return true
	else
		return false
	end
end

function SubRaceAndRaceOrGeneralHelp(sbr)
	race = chargen.races[currentChargenRace]
	if race then
		if (sbr > 0 and sbr ~= 10) then
			return Infinity_FetchString(race.desc) .. '\n\n________________________\n\n' .. Infinity_FetchString(sbSubraceDataEx[sbr][2])
		else
			return Infinity_FetchString(race.desc)
		end
	else
		return Infinity_FetchString(17237)
	end
end

zZraceStrings = {
	{nil, %bghuman_r%, 1},
	{nil, %bgelf_r%, 2},
	{nil, %bghalfelf_r%, 3},
	{nil, %bgdwarf_r%, 4},
	{nil, %bghalfling_r%, 5},
	{nil, %bggnome_r%, 6},
	{nil, %bghalforc_r%, 7},
}
--nil race subrace idx
zZsubraceStrings = {
	{nil, 1, %text_aasimar%, 1},
	{nil, 1, %text_tiefling%, 2},
	{nil, 2, %text_drow%, 3},
	{nil, 2, %text_wild_elf%, 4},
	{nil, 4, %text_dwfgold%, 5},
	{nil, 4, %text_dwfduerg%, 6},
	{nil, 5, %text_hflstrong%, 7},
	{nil, 5, %text_hflhide%, 8},
	{nil, 6, %text_svirfn%, 9},
	{nil, 0, -1, 10},
	{nil, 2, %text_moon_elf%, 11},
}
function zzCreateCharInfo(info)
	local rc = 0
	local str, stra, strb = ''
	local x, y = 0, 0
	if currentChargenRace ~= nil and currSubrace > 0 and currSubrace ~= 10 then
		for k, v in pairs(zZraceStrings) do
			if currentChargenRace == v[3] then
				rc = v[3]
				str = Infinity_FetchString(v[2])
				break
			end
		end
		if rc > 0 then
			x, y = string.find(info, str, 1, true)
			if x ~= nil then
				stra = string.sub(info, 1, y)
				strb = string.sub(info, y + 1)
				for k, v in pairs(zZsubraceStrings) do
					if rc == v[2] and currSubrace == v[4] then
						info = stra .. ' ( ' .. Infinity_FetchString(v[3]) .. ' )' .. strb
					end
				end
			end
		end
	end
	return info
end

%higlihtseq%

%duifuc%



















