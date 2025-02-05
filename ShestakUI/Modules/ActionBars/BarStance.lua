local T, C, L, _ = unpack(select(2, ...))
if C.actionbar.enable ~= true then return end

----------------------------------------------------------------------------------------
--	StanceBar(by Tukz)
----------------------------------------------------------------------------------------
-- Hide bar
if C.actionbar.stancebar_hide then StanceBarFrame:SetParent(StanceBarAnchor) StanceBarAnchor:Hide() return end

-- Create bar
local bar = CreateFrame("Frame", "StanceHolder", UIParent, "SecureHandlerStateTemplate")
bar:SetAllPoints(StanceBarAnchor)

bar:RegisterEvent("PLAYER_LOGIN")
bar:RegisterEvent("PLAYER_ENTERING_WORLD")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
bar:RegisterEvent("UPDATE_SHAPESHIFT_USABLE")
bar:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN")
bar:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
bar:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_LOGIN" then
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G["StanceButton"..i]
			button:ClearAllPoints()
			button:SetParent(self)
			if i == 1 then
				if C.actionbar.stancebar_horizontal == true then
					button:SetPoint("BOTTOMLEFT", StanceBarAnchor, "BOTTOMLEFT", 0, 0)
				else
					button:SetPoint("TOPLEFT", StanceBarAnchor, "TOPLEFT", 0, 0)
				end
			else
				local previous = _G["StanceButton"..i-1]
				if C.actionbar.stancebar_horizontal == true then
					button:SetPoint("LEFT", previous, "RIGHT", C.actionbar.button_space, 0)
				else
					button:SetPoint("TOP", previous, "BOTTOM", 0, -C.actionbar.button_space)
				end
			end
			local icon = GetShapeshiftFormInfo(i)
			if icon then
				button:Show()
			else
				button:Hide()
			end
		end
	elseif event == "UPDATE_SHAPESHIFT_FORMS" then
		if InCombatLockdown() then return end
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G["StanceButton"..i]
			local icon = GetShapeshiftFormInfo(i)
			if icon then
				button:Show()
			else
				button:Hide()
			end
		end
		T.ShiftBarUpdate()
	elseif event == "PLAYER_ENTERING_WORLD" then
		T.StyleShift()
	else
		T.ShiftBarUpdate()
	end
end)

-- Mouseover bar
if C.actionbar.rightbars_mouseover == true and C.actionbar.stancebar_horizontal == false then
	if T.class == "SHAMAN" then
		MultiCastSummonSpellButton:SetAlpha(0)
		MultiCastSummonSpellButton:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		MultiCastSummonSpellButton:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		MultiCastRecallSpellButton:SetAlpha(0)
		MultiCastRecallSpellButton:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		MultiCastRecallSpellButton:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		MultiCastFlyoutFrameOpenButton:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		MultiCastFlyoutFrameOpenButton:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		MultiCastFlyoutFrame:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		MultiCastFlyoutFrame:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		MultiCastActionBarFrame:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		MultiCastActionBarFrame:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		for i = 1, 12 do
			local b = _G["MultiCastActionButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() RightBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		end
		for i = 1, 4 do
			local b = _G["MultiCastSlotButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() RightBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		end
	else
		StanceBarAnchor:SetAlpha(0)
		StanceBarAnchor:SetScript("OnEnter", function() if StanceButton1:IsShown() then RightBarMouseOver(1) end end)
		StanceBarAnchor:SetScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		for i = 1, NUM_STANCE_SLOTS do
			local b = _G["StanceButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() RightBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
		end
	end
end
if C.actionbar.stancebar_mouseover == true and (C.actionbar.stancebar_horizontal == true or C.actionbar.editor) then
	if T.class == "SHAMAN" then
		MultiCastSummonSpellButton:SetAlpha(0)
		MultiCastSummonSpellButton:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
		MultiCastSummonSpellButton:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		MultiCastRecallSpellButton:SetAlpha(0)
		MultiCastRecallSpellButton:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
		MultiCastRecallSpellButton:HookScript("OnLeave", function()  if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		MultiCastFlyoutFrameOpenButton:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
		MultiCastFlyoutFrameOpenButton:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		MultiCastFlyoutFrame:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
		MultiCastFlyoutFrame:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		MultiCastActionBarFrame:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
		MultiCastActionBarFrame:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		for i = 1, 12 do
			local b = _G["MultiCastActionButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		end
		for i = 1, 4 do
			local b = _G["MultiCastSlotButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		end
	else
		StanceBarAnchor:SetAlpha(0)
		StanceBarAnchor:SetScript("OnEnter", function() StanceBarMouseOver(1) end)
		StanceBarAnchor:SetScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		for i = 1, NUM_STANCE_SLOTS do
			local b = _G["StanceButton"..i]
			b:SetAlpha(0)
			b:HookScript("OnEnter", function() StanceBarMouseOver(1) end)
			b:HookScript("OnLeave", function() if not HoverBind.enabled then StanceBarMouseOver(0) end end)
		end
	end
end