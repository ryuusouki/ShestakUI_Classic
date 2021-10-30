local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Interface skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	InterfaceOptionsFrame:StripTextures()
	InterfaceOptionsFrame:SetTemplate("Transparent")

	local InterfaceOptionsFrameHeader = T.classic and InterfaceOptionsFrameHeader or InterfaceOptionsFrame.Header
	InterfaceOptionsFrameHeader:StripTextures()
	InterfaceOptionsFrameHeader:ClearAllPoints()
	InterfaceOptionsFrameHeader:SetPoint("TOP", InterfaceOptionsFrame, 0, 0)

	InterfaceOptionsFrameTab1:StripTextures()
	InterfaceOptionsFrameTab2:StripTextures()

	local frames = {
		"InterfaceOptionsFramePanelContainer",
		"InterfaceOptionsFrameAddOns",
		"InterfaceOptionsFrameCategories",
		"InterfaceOptionsFrameTab1",
		"InterfaceOptionsFrameTab2"
	}

	for i = 1, getn(frames) do
		local frame = _G[frames[i]]
		if frame then
			frame:SetTemplate("Overlay")
		end
	end

	local buttons = {
		"InterfaceOptionsFrameDefaults",
		"InterfaceOptionsFrameOkay",
		"InterfaceOptionsFrameCancel",
		"InterfaceOptionsFrameTab1",
		"InterfaceOptionsFrameTab2",
		"InterfaceOptionsSocialPanelTwitterLoginButton",
		"InterfaceOptionsDisplayPanelResetTutorials",
		"InterfaceOptionsSocialPanelRedockChat",
		"InterfaceOptionsAccessibilityPanelConfigureTextToSpeech",
		"InterfaceOptionsAccessibilityPanelRemoteTextToSpeechVoicePlaySample"
	}

	for i = 1, getn(buttons) do
		local button = _G[buttons[i]]
		if button then
			button:SkinButton()
		end
	end

	local checkboxes = {
		-- Controls
		"ControlsPanelStickyTargeting",
		"ControlsPanelAutoDismount",
		"ControlsPanelAutoClearAFK",
		"ControlsPanelLootAtMouse",
		"ControlsPanelAutoLootCorpse",
		"ControlsPanelInteractOnLeftClick",
		-- Combat
		"CombatPanelAutoSelfCast",
		"CombatPanelTargetOfTarget",
		"CombatPanelLossOfControl",
		"CombatPanelFlashLowHealthWarning",
		"CombatPanelAutoRange",
		"CombatPanelEnableFloatingCombatText",
		"CombatPanelCombatTextLowManaHealth",
		"CombatPanelCombatTextAuras",
		"CombatPanelCombatTextAuraFade",
		"CombatPanelCombatTextState",
		"CombatPanelCombatTextParryDodgeMiss",
		"CombatPanelCombatTextResistances",
		"CombatPanelCombatTextReputation",
		"CombatPanelCombatTextReactives",
		"CombatPanelCombatTextFriendlyNames",
		"CombatPanelCombatTextComboPoints",
		"CombatPanelCombatTextEnergyGains",
		"CombatPanelCombatTextHonorGains",
		"CombatPanelEnableCombatDamageText",
		"CombatPanelEnableCombatHealingText",
		"CombatPanelEnablePeriodicDamage",
		"CombatPanelEnablePetDamage",
		-- Display
		"DisplayPanelRotateMinimap",
		"DisplayPanelAJAlerts",
		"DisplayPanelShowInGameNavigation",
		"DisplayPanelShowTutorials",
		"DisplayPanelShowHelm",
		"DisplayPanelShowCloak",
		"DisplayPanelInstantQuestText",
		"DisplayPanelAutoQuestWatch",
		"DisplayPanelHideOutdoorWorldState",
		"DisplayPanelShowMinimapClock",
		"DisplayPanelShowDetailedTooltips",
		"DisplayPanelShowLoadingScreenTip",
		-- Social
		"SocialPanelProfanityFilter",
		"SocialPanelSpamFilter",
		"SocialPanelBlockTrades",
		"SocialPanelBlockGuildInvites",
		"SocialPanelBlockChatChannelInvites",
		"SocialPanelGuildMemberAlert",
		"SocialPanelShowAccountAchievments",
		"SocialPanelOnlineFriends",
		"SocialPanelOfflineFriends",
		"SocialPanelBroadcasts",
		"SocialPanelAutoAcceptQuickJoinRequests",
		"SocialPanelFriendRequests",
		"SocialPanelShowToastWindow",
		"SocialPanelEnableTwitter",
		"SocialPanelShowLootSpam",
		-- ActionBars
		"ActionBarsPanelBottomLeft",
		"ActionBarsPanelBottomRight",
		"ActionBarsPanelRight",
		"ActionBarsPanelRightTwo",
		"ActionBarsPanelAlwaysShowActionBars",
		"ActionBarsPanelStackRightBars",
		"ActionBarsPanelLockActionBars",
		"ActionBarsPanelCountdownCooldowns",
		-- Names
		"NamesPanelMyName",
		"NamesPanelGuildNames",
		"NamesPanelFriendlyPlayerNames",
		"NamesPanelNonCombatCreature",
		"NamesPanelEnemyPlayerNames",
		"NamesPanelUnitNameplatesEnemies",
		"NamesPanelEnemyMinions",
		"NamesPanelUnitNameplatesFriends",
		"NamesPanelFriendlyMinions",
		"NamesPanelUnitNameplatesPersonalResource",
		"NamesPanelUnitNameplatesPersonalResourceOnEnemy",
		"NamesPanelUnitNameplatesFriendlyMinions",
		"NamesPanelUnitNameplatesMakeLarger",
		"NamesPanelUnitNameplatesShowAll",
		"NamesPanelUnitNameplatesAggroFlash",
		"NamesPanelUnitNameplatesEnemyMinions",
		"NamesPanelUnitNameplatesEnemyMinus",
		"NamesPanelTitles",
		"NamesPanelNPCNames",
		-- Camera
		"CameraPanelWaterCollision",
		"CameraPanelFollowTerrain",
		"CameraPanelHeadBob",
		"CameraPanelSmartPivot",
		-- Mouse
		"MousePanelInvertMouse",
		"MousePanelClickToMove",
		"MousePanelEnableMouseSpeed",
		"MousePanelLockCursorToScreen",
		-- Assessability
		"AccessibilityPanelMovePad",
		"AccessibilityPanelCinematicSubtitles",
		"AccessibilityPanelColorblindMode",
		"AccessibilityPanelOverrideFadeOut",
		"AccessibilityPanelQuestTextContrast",
		"AccessibilityPanelSpeechToText",
		"AccessibilityPanelTextToSpeech",
		"AccessibilityPanelRemoteTextToSpeech"
	}

	for i = 1, getn(checkboxes) do
		local checkbox = _G["InterfaceOptions"..checkboxes[i]]
		if checkbox and checkbox.SetNormalTexture then
			T.SkinCheckBox(checkbox)
		end
	end

	local checkboxes2 = {
		"AutoActivate2Players",
		"AutoActivate3Players",
		"AutoActivate5Players",
		"AutoActivate10Players",
		"AutoActivate15Players",
		"AutoActivate20Players",
		"AutoActivate25Players",
		"AutoActivate40Players",
		"AutoActivateSpec1",
		"AutoActivateSpec2",
		"AutoActivateSpec3",
		"AutoActivateSpec4",
		"AutoActivatePvE",
		"AutoActivatePvP",
		"KeepGroupsTogether",
		"HorizontalGroups",
		"DisplayIncomingHeals",
		"DisplayPowerBar",
		"DisplayAggroHighlight",
		"UseClassColors",
		"DisplayPets",
		"DisplayMainTankAndAssist",
		"DisplayBorder",
		"ShowDebuffs",
		"DisplayOnlyDispellableDebuffs"
	}

	for i = 1, getn(checkboxes2) do
		local checkbox = _G["CompactUnitFrameProfilesGeneralOptionsFrame"..checkboxes2[i]]
		if checkbox then
			T.SkinCheckBox(checkbox)
		end
	end

	T.SkinCheckBox(CompactUnitFrameProfilesRaidStylePartyFrames)

	local dropdown = {
		"AccessibilityPanelColorFilterDropDown",
		"AccessibilityPanelMotionSicknessDropdown",
		"AccessibilityPanelRemoteTextToSpeechVoiceDropdown",
		"AccessibilityPanelShakeIntensityDropdown",
		"ActionBarsPanelPickupActionKeyDropDown",
		"CameraPanelStyleDropDown",
		"CombatPanelCombatTextFloatModeDropDown",
		"CombatPanelFocusCastKeyDropDown",
		"CombatPanelSelfCastKeyDropDown",
		"ControlsPanelAutoLootKeyDropDown",
		"DisplayPanelChatBubblesDropDown",
		"DisplayPanelDisplayDropDown",
		"DisplayPanelOutlineDropDown",
		"DisplayPanelSelfHighlightDropDown",
		"MousePanelClickMoveStyleDropDown",
		"NamesPanelNPCNamesDropDown",
		"NamesPanelUnitNameplatesMotionDropDown",
		"SocialPanelChatStyle",
		"SocialPanelTimestamps",
		"SocialPanelWhisperMode"
	}

	for i = 1, getn(dropdown) do
		local frame = _G["InterfaceOptions"..dropdown[i]]
		if frame then
			T.SkinDropDownBox(frame)
		end
	end

	T.SkinDropDownBox(CompactUnitFrameProfilesGeneralOptionsFrameHealthTextDropdown)
	T.SkinDropDownBox(CompactUnitFrameProfilesGeneralOptionsFrameSortByDropdown)
	T.SkinDropDownBox(CompactUnitFrameProfilesProfileSelector)

	if T.newPatch then
		T.SkinDropDownBox(InterfaceOptionsAccessibilityPanelCursorSizeDropdown)
	end

	local buttons = {
		"CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButton",
		"CompactUnitFrameProfilesDeleteButton",
		"CompactUnitFrameProfilesSaveButton"
	}

	for i = 1, getn(buttons) do
		local button = _G[buttons[i]]
		if button then
			button:SkinButton()
		end
	end

	local sliders = {
		"InterfaceOptionsCombatPanelSpellAlertOpacitySlider",
		"CompactUnitFrameProfilesGeneralOptionsFrameHeightSlider",
		"CompactUnitFrameProfilesGeneralOptionsFrameWidthSlider",
		"InterfaceOptionsCameraPanelMaxDistanceSlider",
		"InterfaceOptionsCameraPanelFollowSpeedSlider",
		"InterfaceOptionsMousePanelMouseSensitivitySlider",
		"InterfaceOptionsMousePanelMouseLookSpeedSlider",
		"InterfaceOptionsAccessibilityPanelColorblindStrengthSlider",
		"OpacityFrameSlider"
	}

	for i = 1, #sliders do
		local slider = _G[sliders[i]]
		if slider then
			T.SkinSlider(slider)
			slider:SetFrameLevel(slider:GetFrameLevel() + 2)
		end
	end

	_G["InterfaceOptionsFrameDefaults"]:ClearAllPoints()
	_G["InterfaceOptionsFrameDefaults"]:SetPoint("TOPLEFT", _G["InterfaceOptionsFrameCategories"], "BOTTOMLEFT", 0, -14)
	_G["InterfaceOptionsFrameCancel"]:ClearAllPoints()
	_G["InterfaceOptionsFrameCancel"]:SetPoint("TOPRIGHT", _G["InterfaceOptionsFramePanelContainer"], "BOTTOMRIGHT", 0, -14)
	_G["InterfaceOptionsFrameOkay"]:ClearAllPoints()
	_G["InterfaceOptionsFrameOkay"]:SetPoint("RIGHT", _G["InterfaceOptionsFrameCancel"], "LEFT", -4, 0)
	_G["ColorPickerOkayButton"]:ClearAllPoints()
	_G["InterfaceOptionsFrameTab1"]:ClearAllPoints()
	_G["InterfaceOptionsFrameTab1"]:SetPoint("TOPLEFT", _G["InterfaceOptionsFrameCategories"], "TOPLEFT", 0, 27)
	_G["InterfaceOptionsFrameTab1"]:SetWidth(60)
	_G["InterfaceOptionsFrameTab1"].SetWidth = T.dummy
	_G["InterfaceOptionsFrameTab2"]:ClearAllPoints()
	_G["InterfaceOptionsFrameTab2"]:SetPoint("TOPLEFT", _G["InterfaceOptionsFrameTab1"], "TOPRIGHT", 3, 0)
	_G["InterfaceOptionsFrameTab2"]:SetWidth(112)
	_G["InterfaceOptionsFrameTab2"].SetWidth = T.dummy
end

tinsert(T.SkinFuncs["ShestakUI"], LoadSkin)
