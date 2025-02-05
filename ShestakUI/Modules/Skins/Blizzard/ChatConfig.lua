local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ChatConfig skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	ChatConfigFrame:StripTextures()
	ChatConfigFrame:SetTemplate("Transparent")

	local ChatConfigFrameHeader = T.Classic and ChatConfigFrameHeader or ChatConfigFrame.Header
	ChatConfigFrameHeader:StripTextures()
	ChatConfigFrameHeader:ClearAllPoints()
	ChatConfigFrameHeader:SetPoint("TOP", ChatConfigFrame, 0, 7)

	local frames = {
		"ChatConfigCategoryFrame",
		"ChatConfigBackgroundFrame",
		"ChatConfigChatSettingsClassColorLegend",
		"ChatConfigChatSettingsLeft",
		"ChatConfigChannelSettingsAvailable",
		"ChatConfigChannelSettingsLeft",
		"ChatConfigChannelSettingsClassColorLegend",
		"ChatConfigOtherSettingsCombat",
		"ChatConfigOtherSettingsSystem",
		"ChatConfigOtherSettingsCreature",
		"ChatConfigOtherSettingsPVP",
		"ChatConfigCombatSettingsFilters",
		"CombatConfigMessageSourcesDoneBy",
		"CombatConfigMessageSourcesDoneTo",
		"CombatConfigColorsUnitColors",
		"CombatConfigColorsHighlighting",
		"ChatConfigTextToSpeechChannelSettingsLeft"
	}

	for i = 1, getn(frames) do
		local frame = _G[frames[i]]
		if frame then
			frame:SetTemplate("Overlay")
		end
	end

	local colorize = {
		"CombatConfigColorsColorizeUnitName",
		"CombatConfigColorsColorizeSpellNames",
		"CombatConfigColorsColorizeDamageNumber",
		"CombatConfigColorsColorizeDamageSchool",
		"CombatConfigColorsColorizeEntireLine"
	}

	for i = 1, getn(colorize) do
		local frame = _G[colorize[i]]
		if frame then
			local bg = CreateFrame("Frame", nil, frame)
			bg:SetPoint("TOPLEFT", 0, 0)
			bg:SetPoint("BOTTOMRIGHT", 0, 2)
			bg:SetTemplate("Overlay")
		end
	end

	local buttons = {
		"ChatConfigFrameDefaultButton",
		"ChatConfigFrameOkayButton",
		"ChatConfigFrameCancelButton",
		"ChatConfigFrameRedockButton",
		"ChatConfigCombatSettingsFiltersCopyFilterButton",
		"ChatConfigCombatSettingsFiltersAddFilterButton",
		"ChatConfigCombatSettingsFiltersDeleteButton",
		"CombatConfigSettingsSaveButton",
		"CombatLogDefaultButton"
	}

	for i = 1, getn(buttons) do
		local button = _G[buttons[i]]
		if button then
			button:SkinButton()
			button:ClearAllPoints()
		end
	end

	local checkboxes = {
		"CombatConfigColorsHighlightingLine",
		"CombatConfigColorsHighlightingAbility",
		"CombatConfigColorsHighlightingDamage",
		"CombatConfigColorsHighlightingSchool",
		"CombatConfigColorsColorizeUnitNameCheck",
		"CombatConfigColorsColorizeSpellNamesCheck",
		"CombatConfigColorsColorizeSpellNamesSchoolColoring",
		"CombatConfigColorsColorizeDamageNumberCheck",
		"CombatConfigColorsColorizeDamageNumberSchoolColoring",
		"CombatConfigColorsColorizeDamageSchoolCheck",
		"CombatConfigColorsColorizeEntireLineCheck",
		"CombatConfigFormattingShowTimeStamp",
		"CombatConfigFormattingShowBraces",
		"CombatConfigFormattingUnitNames",
		"CombatConfigFormattingSpellNames",
		"CombatConfigFormattingItemNames",
		"CombatConfigFormattingFullText",
		"CombatConfigSettingsShowQuickButton",
		"CombatConfigSettingsSolo",
		"CombatConfigSettingsParty",
		"CombatConfigSettingsRaid",
		"CombatConfigColorsColorizeEntireLineBySource",
		"CombatConfigColorsColorizeEntireLineByTarget"
	}

	for i = 1, getn(checkboxes) do
		local checkbox = _G[checkboxes[i]]
		if checkbox then
			T.SkinCheckBox(checkbox)
		end
	end

	local ReskinColourSwatch = function(f)
		if f.InnerBorder then
			f.InnerBorder:SetAlpha(0)
			f.SwatchBg:SetAlpha(0)
		end
		f:CreateBackdrop("Overlay")
		f:SetFrameLevel(f:GetFrameLevel() + 2)
		if T.Classic then
			f.backdrop:SetOutside(f.Color, 0, 0)
		else
			f.backdrop:SetOutside(f.Color, 2, 2)
		end
	end

	if T.Classic then
		hooksecurefunc("ChatConfig_CreateBoxes", function(frame, boxTable, boxTemplate)
			if frame.styled then return end

			local boxNameString = frame:GetName().."Box"

			if boxTemplate == "ChatConfigTextBoxTemplateWithButton" then
				for index in ipairs(boxTable) do
					local boxName = boxNameString..index
					local box = _G[boxName]

					box:StripTextures()
					local bg = CreateFrame("Frame", nil, box)
					bg:SetPoint("TOPLEFT", 2, -1)
					bg:SetPoint("BOTTOMRIGHT", -2, 1)
					bg:SetTemplate("Overlay")

					bg:SetFrameLevel(bg:GetFrameLevel() - 1)

					_G[boxName.."Button"]:SkinButton()
				end
			end

			frame.styled = true
		end)
	end

	hooksecurefunc("ChatConfig_CreateCheckboxes", function(frame, checkBoxTable, checkBoxTemplate)
		if frame.styled then return end

		local checkBoxNameString = frame:GetName().."CheckBox"

		if checkBoxTemplate == "ChatConfigCheckBoxTemplate" or checkBoxTemplate == "ChatConfigCheckBoxSmallTemplate" then
			for index in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index
				local checkbox = _G[checkBoxName]

				local bg = CreateFrame("Frame", nil, checkbox)
				bg:SetPoint("TOPLEFT", 2, -1)
				bg:SetPoint("BOTTOMRIGHT", -2, 1)
				bg:SetTemplate("Overlay")

				T.SkinCheckBox(_G[checkBoxName.."Check"])
			end
		elseif checkBoxTemplate == "ChatConfigCheckBoxWithSwatchTemplate" or checkBoxTemplate == "ChatConfigWideCheckBoxWithSwatchTemplate" or checkBoxTemplate == "MovableChatConfigWideCheckBoxWithSwatchTemplate" then
			for index in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index
				local checkbox = _G[checkBoxName]

				checkbox:StripTextures()
				local bg = CreateFrame("Frame", nil, checkbox)
				bg:SetPoint("TOPLEFT", 2, -1)
				bg:SetPoint("BOTTOMRIGHT", -2, 1)
				bg:CreateBackdrop("Overlay")
				bg.backdrop:SetAllPoints(bg)

				ReskinColourSwatch(_G[checkBoxName.."ColorSwatch"])

				T.SkinCheckBox(_G[checkBoxName.."Check"])
			end
		end

		frame.styled = true
	end)

	hooksecurefunc("ChatConfig_CreateColorSwatches", function(frame, swatchTable)
		if frame.styled then return end

		local nameString = frame:GetName().."Swatch"

		for index in ipairs(swatchTable) do
			local swatchName = nameString..index
			local swatch = _G[swatchName]

			if swatch.SetBackdrop then
				swatch:SetBackdrop(nil)
			else
				swatch.NineSlice:SetAlpha(0)
			end

			local bg = CreateFrame("Frame", nil, swatch)
			bg:SetPoint("TOPLEFT", 0, 0)
			bg:SetPoint("BOTTOMRIGHT", 0, 0)
			bg:SetFrameLevel(swatch:GetFrameLevel() - 1)
			bg:CreateBorder(true)
			bg.iborder:SetBackdropBorderColor(unpack(C.media.border_color))

			local bg2 = CreateFrame("Frame", nil, bg)
			bg2:SetPoint("TOPLEFT", 1, -1)
			bg2:SetPoint("BOTTOMRIGHT", -1, 1)
			bg2:CreateBorder(true, true)

			ReskinColourSwatch(_G[swatchName.."ColorSwatch"])
		end

		frame.styled = true
	end)

	ChatConfigBackgroundFrame:SetScript("OnShow", function()
		ReskinColourSwatch(CombatConfigColorsColorizeSpellNamesColorSwatch)
		ReskinColourSwatch(CombatConfigColorsColorizeDamageNumberColorSwatch)

		for i = 1, (T.Vanilla or T.TBC) and 5 or 4 do
			for j = 1, MAX_WOW_CHAT_CHANNELS or 20 do
				if _G["CombatConfigMessageTypesLeftCheckBox"..i] and _G["CombatConfigMessageTypesLeftCheckBox"..i.."_"..j] then
					T.SkinCheckBox(_G["CombatConfigMessageTypesLeftCheckBox"..i])
					T.SkinCheckBox(_G["CombatConfigMessageTypesLeftCheckBox"..i.."_"..j])
				end
				if _G["CombatConfigMessageTypesRightCheckBox"..i] and _G["CombatConfigMessageTypesRightCheckBox"..i.."_"..j] then
					T.SkinCheckBox(_G["CombatConfigMessageTypesRightCheckBox"..i])
					T.SkinCheckBox(_G["CombatConfigMessageTypesRightCheckBox"..i.."_"..j])
				end
			end
			T.SkinCheckBox(_G["CombatConfigMessageTypesMiscCheckBox"..i])
		end
	end)

	for i = 1, #COMBAT_CONFIG_TABS do
		local tab = _G["CombatConfigTab"..i]
		if tab then
			T.SkinTab(tab, true)
			tab:SetHeight(tab:GetHeight() - 2)
			tab:ClearAllPoints()
			if i == 1 then
				tab:SetPoint("BOTTOMLEFT", _G["ChatConfigBackgroundFrame"], "TOPLEFT", 0, 1)
			else
				tab:SetPoint("LEFT", _G["CombatConfigTab"..i-1], "RIGHT", 1, 0)
			end
			_G["CombatConfigTab"..i.."Text"]:SetPoint("BOTTOM", 0, 7)
		end
	end

	T.SkinEditBox(_G["CombatConfigSettingsNameEditBox"], nil, _G["CombatConfigSettingsNameEditBox"]:GetHeight() - 2)
	T.SkinNextPrevButton(_G["ChatConfigMoveFilterUpButton"], nil, "Up")
	T.SkinNextPrevButton(_G["ChatConfigMoveFilterDownButton"], nil, "Down")
	_G["ChatConfigFrameDefaultButton"]:SetWidth(125)
	_G["CombatLogDefaultButton"]:SetWidth(125)

	_G["ChatConfigMoveFilterUpButton"]:SetPoint("TOPLEFT", _G["ChatConfigCombatSettingsFilters"], "BOTTOMLEFT", 0, -1)
	_G["ChatConfigMoveFilterDownButton"]:SetPoint("TOPLEFT", _G["ChatConfigMoveFilterUpButton"], "TOPRIGHT", 1, 0)
	_G["ChatConfigFrameDefaultButton"]:SetPoint("TOP", _G["ChatConfigCategoryFrame"], "BOTTOM", 0, -4)
	ChatConfigFrameRedockButton:SetPoint("LEFT", ChatConfigFrameDefaultButton, "RIGHT", 3, 0)
	_G["ChatConfigFrameOkayButton"]:SetPoint("TOPRIGHT", _G["ChatConfigBackgroundFrame"], "BOTTOMRIGHT", 0, -4)
	_G["CombatLogDefaultButton"]:SetPoint("TOPLEFT", _G["ChatConfigCategoryFrame"], "BOTTOMLEFT", 0, -4)
	_G["CombatConfigSettingsSaveButton"]:SetPoint("TOPLEFT", _G["CombatConfigSettingsNameEditBox"], "TOPRIGHT", 5, 2)
	_G["ChatConfigCombatSettingsFiltersDeleteButton"]:SetPoint("TOPRIGHT", _G["ChatConfigCombatSettingsFilters"], "BOTTOMRIGHT", 0, -1)
	_G["ChatConfigCombatSettingsFiltersCopyFilterButton"]:SetPoint("RIGHT", _G["ChatConfigCombatSettingsFiltersDeleteButton"], "LEFT", -3, 0)
	_G["ChatConfigCombatSettingsFiltersAddFilterButton"]:SetPoint("RIGHT", _G["ChatConfigCombatSettingsFiltersCopyFilterButton"], "LEFT", -3, 0)

	if ChatConfigFrame.ToggleChatButton then
		ChatConfigFrame.ToggleChatButton:SkinButton()
		ChatConfigFrame.ToggleChatButton:ClearAllPoints()
		ChatConfigFrame.ToggleChatButton:SetPoint("LEFT", _G["ChatConfigFrameRedockButton"], "RIGHT", 3, 0)

		if TextToSpeechCharacterSpecificButton then
			T.SkinCheckBox(TextToSpeechCharacterSpecificButton, 25)
		end
	end

	hooksecurefunc(ChatConfigFrameChatTabManager, "UpdateWidth", function(self)
		for tab in self.tabPool:EnumerateActive() do
			if not tab.IsSkinned then
				tab:StripTextures()

				tab.IsSkinned = true
			end
		end
	end)

	-- TextToSpeech
	if T.Mainline then
		local checkBoxes = {
			TextToSpeechFramePanelContainer.PlaySoundSeparatingChatLinesCheckButton,
			TextToSpeechFramePanelContainer.AddCharacterNameToSpeechCheckButton,
			TextToSpeechFramePanelContainer.PlayActivitySoundWhenNotFocusedCheckButton,
			TextToSpeechFramePanelContainer.NarrateMyMessagesCheckButton,
			TextToSpeechFramePanelContainer.UseAlternateVoiceForSystemMessagesCheckButton
		}

		for i = 1, #checkBoxes do
			T.SkinCheckBox(checkBoxes[i])
		end

		TextToSpeechDefaultButton:SkinButton()
		TextToSpeechFramePlaySampleButton:SkinButton()
		TextToSpeechFramePlaySampleAlternateButton:SkinButton()

		T.SkinDropDownBox(TextToSpeechFrameTtsVoiceDropdown)
		T.SkinDropDownBox(TextToSpeechFrameTtsVoiceAlternateDropdown)

		T.SkinSlider(TextToSpeechFrameAdjustRateSlider)
		T.SkinSlider(TextToSpeechFrameAdjustVolumeSlider)

		hooksecurefunc("TextToSpeechFrame_UpdateMessageCheckboxes", function(frame)
			local checkBoxTable = frame.checkBoxTable
			if checkBoxTable then
				local checkBoxNameString = frame:GetName().."CheckBox"
				local checkBoxName, checkBox
				for index in ipairs(checkBoxTable) do
					checkBoxName = checkBoxNameString..index
					checkBox = _G[checkBoxName]
					if checkBox and not checkBox.styled then
						T.SkinCheckBox(checkBox)
						checkBox.styled = true
					end
				end
			end
		end)
	end
end

tinsert(T.SkinFuncs["ShestakUI"], LoadSkin)
