local T, C, L, _ = unpack(select(2, ...))
if C.actionbar.enable ~= true or C.actionbar.toggle_mode ~= true then return end

----------------------------------------------------------------------------------------
--	Toggle ActionBars
----------------------------------------------------------------------------------------
local ToggleBar = CreateFrame("Frame", "ToggleActionbar", UIParent)

local ToggleBarText = function(i, text, plus, neg)
	if plus then
		ToggleBar[i].Text:SetText(text)
		ToggleBar[i].Text:SetTextColor(0.3, 0.3, 0.9)
	elseif neg then
		ToggleBar[i].Text:SetText(text)
		ToggleBar[i].Text:SetTextColor(0.9, 0.3, 0.3)
	end
end

local MainBars = function()
	if C.actionbar.rightbars > 2 then
		if ShestakUISettingsPerChar.BottomBars == 1 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size)
			ToggleBarText(1, "+ + +", true)
			Bar2Holder:Hide()
		elseif ShestakUISettingsPerChar.BottomBars == 2 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBarText(1, "- - -", false, true)
			Bar2Holder:Show()
		end
	elseif C.actionbar.rightbars < 3 and C.actionbar.split_bars ~= true then
		if ShestakUISettingsPerChar.BottomBars == 1 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size)
			ToggleBarText(1, "+ + +", true)
			Bar2Holder:Hide()
			Bar5Holder:Hide()
		elseif ShestakUISettingsPerChar.BottomBars == 2 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBarText(1, "+ + +", true)
			Bar2Holder:Show()
			Bar5Holder:Hide()
		elseif ShestakUISettingsPerChar.BottomBars == 3 then
			ActionBarAnchor:SetHeight((C.actionbar.button_size * 3) + (C.actionbar.button_space * 2))
			ToggleBarText(1, "- - -", false, true)
			Bar2Holder:Show()
			Bar5Holder:Show()
		end
	elseif C.actionbar.rightbars < 3 and C.actionbar.split_bars == true then
		if ShestakUISettingsPerChar.BottomBars == 1 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size)
			ToggleBarText(1, "+ + +", true)
			Bar2Holder:Hide()
			ToggleBar[3]:SetHeight(C.actionbar.button_size)
			ToggleBar[4]:SetHeight(C.actionbar.button_size)
			for i = 1, 3 do
				local b = _G["MultiBarBottomRightButton"..i]
				b:SetAlpha(0)
				b:SetScale(0.000001)
			end
			for i = 7, 9 do
				local b = _G["MultiBarBottomRightButton"..i]
				b:SetAlpha(0)
				b:SetScale(0.000001)
			end
		elseif ShestakUISettingsPerChar.BottomBars == 2 then
			ActionBarAnchor:SetHeight(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBarText(1, "- - -", false, true)
			Bar2Holder:Show()
			ToggleBar[3]:SetHeight(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBar[4]:SetHeight(C.actionbar.button_size * 2 + C.actionbar.button_space)
			for i = 1, 3 do
				local b = _G["MultiBarBottomRightButton"..i]
				if not C.actionbar.bottombars_mouseover then
					b:SetAlpha(1)
				end
				b:SetScale(1)
			end
			for i = 7, 9 do
				local b = _G["MultiBarBottomRightButton"..i]
				if not C.actionbar.bottombars_mouseover then
					b:SetAlpha(1)
				end
				b:SetScale(1)
			end
		end
	end
end

local RightBars = function()
	if C.actionbar.rightbars > 2 then
		if ShestakUISettingsPerChar.RightBars == 1 then
			RightActionBarAnchor:SetWidth(C.actionbar.button_size)
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("RIGHT", RightActionBarAnchor, "LEFT", 0, 0)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size)
			ToggleBarText(2, "> > >", false, true)
			Bar3Holder:Hide()
			Bar4Holder:Hide()
		elseif ShestakUISettingsPerChar.RightBars == 2 then
			RightActionBarAnchor:SetWidth(C.actionbar.button_size * 2 + C.actionbar.button_space)
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("RIGHT", RightActionBarAnchor, "LEFT", 0, 0)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBarText(2, "> > >", false, true)
			Bar3Holder:Hide()
			Bar4Holder:Show()
		elseif ShestakUISettingsPerChar.RightBars == 3 then
			RightActionBarAnchor:SetWidth((C.actionbar.button_size * 3) + (C.actionbar.button_space * 2))
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("RIGHT", RightActionBarAnchor, "LEFT", 0, 0)
			end
			ToggleBar[2]:SetWidth((C.actionbar.button_size * 3) + (C.actionbar.button_space * 2))
			ToggleBarText(2, "> > >", false, true)
			RightActionBarAnchor:Show()
			Bar3Holder:Show()
			Bar4Holder:Show()
			if C.actionbar.rightbars > 2 then
				Bar5Holder:Show()
			end
		elseif ShestakUISettingsPerChar.RightBars == 0 then
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("BOTTOMRIGHT", ToggleBar[2], "TOPRIGHT", 3, 3)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size)
			ToggleBarText(2, "< < <", true)
			RightActionBarAnchor:Hide()
			Bar3Holder:Hide()
			Bar4Holder:Hide()
			if C.actionbar.rightbars > 2 then
				Bar5Holder:Hide()
			end
		end
	elseif C.actionbar.rightbars < 3 then
		if ShestakUISettingsPerChar.RightBars == 1 then
			RightActionBarAnchor:SetWidth(C.actionbar.button_size)
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("RIGHT", RightActionBarAnchor, "LEFT", 0, 0)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size)
			ToggleBarText(2, "> > >", false, true)
			Bar3Holder:Show()
			Bar4Holder:Hide()
		elseif ShestakUISettingsPerChar.RightBars == 2 then
			RightActionBarAnchor:SetWidth(C.actionbar.button_size * 2 + C.actionbar.button_space)
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("RIGHT", RightActionBarAnchor, "LEFT", 0, 0)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size * 2 + C.actionbar.button_space)
			ToggleBarText(2, "> > >", false, true)
			RightActionBarAnchor:Show()
			Bar3Holder:Show()
			Bar4Holder:Show()
		elseif ShestakUISettingsPerChar.RightBars == 0 then
			if not C.actionbar.petbar_horizontal == true then
				PetActionBarAnchor:ClearAllPoints()
				PetActionBarAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -18, 320)
			end
			ToggleBar[2]:SetWidth(C.actionbar.button_size)
			ToggleBarText(2, "< < <", true)
			RightActionBarAnchor:Hide()
			Bar3Holder:Hide()
			Bar4Holder:Hide()
			if C.actionbar.rightbars > 2 then
				Bar5Holder:Hide()
			end
		end
	end
end

local SplitBars = function()
	if C.actionbar.split_bars == true and C.actionbar.rightbars ~= 3 then
		if ShestakUISettingsPerChar.SplitBars == true then
			ToggleBar[3]:ClearAllPoints()
			ToggleBar[3]:SetPoint("BOTTOMLEFT", SplitBarRight, "BOTTOMRIGHT", C.actionbar.button_space, 0)
			ToggleBar[4]:ClearAllPoints()
			ToggleBar[4]:SetPoint("BOTTOMRIGHT", SplitBarLeft, "BOTTOMLEFT", -C.actionbar.button_space, 0)
			if T.Mainline or T.Wrath then
				VehicleButtonAnchor:ClearAllPoints()
				VehicleButtonAnchor:SetPoint("BOTTOMRIGHT", SplitBarLeft, "BOTTOMLEFT", -C.actionbar.button_space, 0)
			end
			if ShestakUISettingsPerChar.BottomBars == 2 then
				ToggleBarText(3, "<\n<\n<", false, true)
				ToggleBarText(4, ">\n>\n>", false, true)
			else
				ToggleBarText(3, "<\n<", false, true)
				ToggleBarText(4, ">\n>", false, true)
			end
			Bar5Holder:Show()
			SplitBarLeft:Show()
			SplitBarRight:Show()
		elseif ShestakUISettingsPerChar.SplitBars == false then
			ToggleBar[3]:ClearAllPoints()
			ToggleBar[3]:SetPoint("BOTTOMLEFT", ActionBarAnchor, "BOTTOMRIGHT", C.actionbar.button_space, 0)
			ToggleBar[4]:ClearAllPoints()
			ToggleBar[4]:SetPoint("BOTTOMRIGHT", ActionBarAnchor, "BOTTOMLEFT", -C.actionbar.button_space, 0)
			if T.Mainline or T.Wrath then
				VehicleButtonAnchor:ClearAllPoints()
				VehicleButtonAnchor:SetPoint("BOTTOMRIGHT", ActionBarAnchor, "BOTTOMLEFT", -C.actionbar.button_space, 0)
			end
			if ShestakUISettingsPerChar.BottomBars == 2 then
				ToggleBarText(3, ">\n>\n>", true)
				ToggleBarText(4, "<\n<\n<", true)
			else
				ToggleBarText(3, ">\n>", true)
				ToggleBarText(4, "<\n<", true)
			end
			Bar5Holder:Hide()
			SplitBarLeft:Hide()
			SplitBarRight:Hide()
		end
	end
end

local LockCheck = function(i)
	if ShestakUISettingsPerChar.BarsLocked == true then
		ToggleBar[i].Text:SetText("U")
		ToggleBar[i].Text:SetTextColor(0.3, 0.3, 0.9)
	elseif ShestakUISettingsPerChar.BarsLocked == false then
		ToggleBar[i].Text:SetText("L")
		ToggleBar[i].Text:SetTextColor(0.9, 0.3, 0.3)
	else
		ToggleBar[i].Text:SetText("L")
		ToggleBar[i].Text:SetTextColor(0.9, 0.3, 0.3)
	end
end

for i = 1, 5 do
	ToggleBar[i] = CreateFrame("Frame", "ToggleBar"..i, ToggleBar)
	ToggleBar[i]:EnableMouse(true)
	ToggleBar[i]:SetAlpha(0)

	ToggleBar[i].Text = ToggleBar[i]:CreateFontString(nil, "OVERLAY")
	ToggleBar[i].Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	ToggleBar[i].Text:SetPoint("CENTER", 2, 0)

	if i == 1 then
		ToggleBar[i]:CreatePanel("Transparent", ActionBarAnchor:GetWidth(), C.actionbar.button_size / 1.5, "BOTTOM", ActionBarAnchor, "TOP", 0, C.actionbar.button_space)
		ToggleBarText(i, "- - -", false, true)

		ToggleBar[i]:SetScript("OnMouseDown", function()
			if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
			ShestakUISettingsPerChar.BottomBars = ShestakUISettingsPerChar.BottomBars + 1

			if C.actionbar.rightbars > 2 then
				if ShestakUISettingsPerChar.BottomBars > 2 then
					ShestakUISettingsPerChar.BottomBars = 1
				end
			elseif C.actionbar.rightbars < 3 and C.actionbar.split_bars ~= true then
				if ShestakUISettingsPerChar.BottomBars > 3 then
					ShestakUISettingsPerChar.BottomBars = 1
				elseif ShestakUISettingsPerChar.BottomBars > 2 then
					ShestakUISettingsPerChar.BottomBars = 3
				elseif ShestakUISettingsPerChar.BottomBars < 1 then
					ShestakUISettingsPerChar.BottomBars = 3
				end
			elseif C.actionbar.rightbars < 3 and C.actionbar.split_bars == true then
				if ShestakUISettingsPerChar.BottomBars > 2 then
					ShestakUISettingsPerChar.BottomBars = 1
				end
			end

			MainBars()
		end)
		ToggleBar[i]:SetScript("OnEvent", MainBars)
	elseif i == 2 then
		ToggleBar[i]:CreatePanel("Transparent", RightActionBarAnchor:GetWidth(), C.actionbar.button_size / 1.5, "TOPRIGHT", RightActionBarAnchor, "BOTTOMRIGHT", 0, -C.actionbar.button_space)
		ToggleBar[i]:SetFrameStrata("LOW")
		ToggleBarText(i, "> > >", false, true)

		ToggleBar[i]:SetScript("OnMouseDown", function()
			if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
			ShestakUISettingsPerChar.RightBars = ShestakUISettingsPerChar.RightBars - 1

			if C.actionbar.rightbars > 2 then
				if ShestakUISettingsPerChar.RightBars > 3 then
					ShestakUISettingsPerChar.RightBars = 2
				elseif ShestakUISettingsPerChar.RightBars > 2 then
					ShestakUISettingsPerChar.RightBars = 1
				elseif ShestakUISettingsPerChar.RightBars < 0 then
					ShestakUISettingsPerChar.RightBars = 3
				end
			elseif C.actionbar.rightbars < 3 then
				if ShestakUISettingsPerChar.RightBars > 2 then
					ShestakUISettingsPerChar.RightBars = 1
				elseif ShestakUISettingsPerChar.RightBars < 0 then
					ShestakUISettingsPerChar.RightBars = 2
				end
			end

			RightBars()
		end)
		ToggleBar[i]:SetScript("OnEvent", RightBars)
	elseif i == 3 then
		if C.actionbar.split_bars == true and C.actionbar.rightbars ~= 3 then
			ToggleBar[i]:CreatePanel("Transparent", C.actionbar.button_size / 1.5, ActionBarAnchor:GetHeight(), "BOTTOMLEFT", SplitBarRight, "BOTTOMRIGHT", C.actionbar.button_space, 0)
			ToggleBarText(i, "<\n<", false, true)
			ToggleBar[i]:SetFrameLevel(SplitBarRight:GetFrameLevel() + 1)
		end
	elseif i == 4 then
		if C.actionbar.split_bars == true and C.actionbar.rightbars ~= 3 then
			ToggleBar[i]:CreatePanel("Transparent", C.actionbar.button_size / 1.5, ActionBarAnchor:GetHeight(), "BOTTOMRIGHT", SplitBarLeft, "BOTTOMLEFT", -C.actionbar.button_space, 0)
			ToggleBarText(i, ">\n>", false, true)
			ToggleBar[i]:SetFrameLevel(SplitBarLeft:GetFrameLevel() + 1)
		end
	elseif i == 5 then
		ToggleBar[i]:CreatePanel("Transparent", 19, 19, "TOPLEFT", Minimap, "TOPRIGHT", 3, 2)
		ToggleBar[i]:SetBackdropBorderColor(unpack(C.media.classborder_color))
		ToggleBar[i].Text:SetPoint("CENTER", 1, 0)

		ToggleBar[i]:SetScript("OnMouseDown", function()
			if InCombatLockdown() then return end

			if ShestakUISettingsPerChar.BarsLocked == true then
				ShestakUISettingsPerChar.BarsLocked = false
			elseif ShestakUISettingsPerChar.BarsLocked == false then
				ShestakUISettingsPerChar.BarsLocked = true
			end

			LockCheck(i)
		end)
		ToggleBar[i]:SetScript("OnEvent", function() LockCheck(i) end)
	end

	if i == 3 or i == 4 then
		ToggleBar[i]:SetScript("OnMouseDown", function()
			if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end

			if ShestakUISettingsPerChar.SplitBars == false then
				ShestakUISettingsPerChar.SplitBars = true
			elseif ShestakUISettingsPerChar.SplitBars == true then
				ShestakUISettingsPerChar.SplitBars = false
			end
			SplitBars()
		end)
		ToggleBar[i]:SetScript("OnEvent", SplitBars)
	end

	ToggleBar[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
	ToggleBar[i]:RegisterEvent("PLAYER_REGEN_DISABLED")
	ToggleBar[i]:RegisterEvent("PLAYER_REGEN_ENABLED")

	ToggleBar[i]:SetScript("OnEnter", function()
		if InCombatLockdown() then return end
		if i == 2 then
			if C.actionbar.rightbars_mouseover == true then
				ToggleBar[i]:SetAlpha(1)
				RightBarMouseOver(1)
			else
				ToggleBar[i]:FadeIn()
			end
		elseif i == 3 or i == 4 then
			if C.actionbar.bottombars_mouseover then
				ToggleBar[i]:SetAlpha(1)
				BottomBarMouseOver(1)
			else
				ToggleBar[3]:FadeIn()
				ToggleBar[4]:FadeIn()
			end
			if T.Mainline or T.Wrath then
				VehicleButtonAnchor:ClearAllPoints()
				VehicleButtonAnchor:SetPoint("BOTTOMRIGHT", ToggleBar[4], "BOTTOMLEFT", -C.actionbar.button_space, 0)
			end
		else
			if i == 1 and C.actionbar.bottombars_mouseover then
				BottomBarMouseOver(1)
				ToggleBar[i]:SetAlpha(1)
				return
			end
			ToggleBar[i]:FadeIn()
		end
		if i == 5 then
			GameTooltip:SetOwner(ToggleBar[i], "ANCHOR_LEFT")
			GameTooltip:AddLine(L_MINIMAP_TOGGLE)
			GameTooltip:Show()
		end
	end)

	ToggleBar[i]:SetScript("OnLeave", function()
		if i == 2 then
			if C.actionbar.rightbars_mouseover == true then
				ToggleBar[i]:SetAlpha(0)
				RightBarMouseOver(0)
			else
				ToggleBar[i]:FadeOut()
			end
		elseif i == 3 or i == 4 then
			if InCombatLockdown() then return end
			if C.actionbar.bottombars_mouseover then
				ToggleBar[i]:SetAlpha(0)
				BottomBarMouseOver(0)
			else
				ToggleBar[3]:FadeOut()
				ToggleBar[4]:FadeOut()
			end
			VehicleButtonAnchor:ClearAllPoints()
			if T.Mainline or T.Wrath then
				if ShestakUISettingsPerChar.SplitBars == true then
					VehicleButtonAnchor:SetPoint("BOTTOMRIGHT", SplitBarLeft, "BOTTOMLEFT", -C.actionbar.button_space, 0)
				else
					VehicleButtonAnchor:SetPoint("BOTTOMRIGHT", ActionBarAnchor, "BOTTOMLEFT", -C.actionbar.button_space, 0)
				end
			end
		else
			if i == 1 and C.actionbar.bottombars_mouseover then
				BottomBarMouseOver(0)
				ToggleBar[i]:SetAlpha(0)
				return
			end
			ToggleBar[i]:FadeOut()
		end
		if i == 5 then
			GameTooltip:Hide()
		end
	end)

	ToggleBar[i]:SetScript("OnUpdate", function()
		if InCombatLockdown() then return end
		if ShestakUISettingsPerChar.BarsLocked == true then
			for i = 1, 4 do
				ToggleBar[i]:EnableMouse(false)
			end
		elseif ShestakUISettingsPerChar.BarsLocked == false then
			for i = 1, 4 do
				ToggleBar[i]:EnableMouse(true)
			end
		end
	end)
end