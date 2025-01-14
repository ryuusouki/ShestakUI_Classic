local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	TradeSkillUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	TradeSkillFrame:StripTextures(true)
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.DetailsInset:StripTextures()
	TradeSkillFrame.DetailsFrame.Background:Hide()

	TradeSkillFramePortrait:SetAlpha(0)

	TradeSkillFrame.RecipeList.LearnedTab:StripTextures()
	TradeSkillFrame.RecipeList.UnlearnedTab:StripTextures()

	TradeSkillFrame:SetTemplate("Transparent")
	TradeSkillFrame.RankFrame:StripTextures()
	TradeSkillFrame.RankFrame:CreateBackdrop("Overlay")
	TradeSkillFrame.RankFrame:SetStatusBarTexture(C.media.texture)

	TradeSkillFrame.FilterButton:StripTextures(true)
	TradeSkillFrame.FilterButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.CreateButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.CreateAllButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.ExitButton:SkinButton(true)

	TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
	TradeSkillFrame.LinkToButton:CreateBackdrop("Overlay")
	TradeSkillFrame.LinkToButton:SetSize(17, 14)
	TradeSkillFrame.LinkToButton:SetPoint("BOTTOMRIGHT", TradeSkillFrame.FilterButton, "TOPRIGHT", -2, 4)

	T.SkinEditBox(TradeSkillFrame.SearchBox, TradeSkillFrame.SearchBox:GetWidth() + 5, TradeSkillFrame.SearchBox:GetHeight() - 2)
	TradeSkillFrame.SearchBox:ClearAllPoints()
	TradeSkillFrame.SearchBox:SetPoint("RIGHT", TradeSkillFrame.FilterButton, "LEFT", -5, 0)

	T.SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, nil, TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:GetHeight() - 2)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

	T.SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, true)
	T.SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 5, 0)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetSize(22, 22)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton:SetSize(22, 22)

	TradeSkillFrame.DetailsFrame.ExitButton:SetPoint("TOPRIGHT", TradeSkillFrame.DetailsFrame, "BOTTOMRIGHT", 28, -3)

	T.SkinCloseButton(TradeSkillFrameCloseButton)

	T.SkinScrollBar(TradeSkillFrame.RecipeList.scrollBar)
	T.SkinScrollBar(TradeSkillFrame.DetailsFrame.ScrollBar)

	hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function()
		local ResultIcon = TradeSkillFrame.DetailsFrame.Contents.ResultIcon
		ResultIcon:SetTemplate("Default")
		if ResultIcon:GetNormalTexture() then
			ResultIcon:GetNormalTexture():CropIcon()
		end
		ResultIcon.ResultBorder:SetTexture(nil)
		ResultIcon.IconBorder:SetTexture(nil)

		for i = 1, #TradeSkillFrame.DetailsFrame.Contents.Reagents do
			local button = TradeSkillFrame.DetailsFrame.Contents.Reagents[i]
			local icon = button.Icon
			local count = button.Count

			icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			icon:SetDrawLayer("OVERLAY")

			if not icon.backdrop then
				icon.backdrop = CreateFrame("Frame", nil, button)
				icon.backdrop:SetFrameStrata("BACKGROUND")
				icon.backdrop:SetTemplate("Default")
				icon.backdrop:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
				icon.backdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMLEFT", 42, 1)
			end

			icon:SetParent(icon.backdrop)
			icon:SetPoint("TOPLEFT", icon.backdrop, "TOPLEFT", 2, -2)
			icon:SetPoint("BOTTOMRIGHT", icon.backdrop, "BOTTOMRIGHT", -2, 2)

			count:SetFont(C.media.normal_font, 12, "OUTLINE")
			count:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 2, -2)
			count:SetDrawLayer("OVERLAY")

			button.NameFrame:Kill()
		end

		for i = 1, #TradeSkillFrame.DetailsFrame.Contents.OptionalReagents do
			local button = TradeSkillFrame.DetailsFrame.Contents.OptionalReagents[i]
			local icon = button.Icon

			icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			icon:SetDrawLayer("OVERLAY")

			if not icon.backdrop then
				icon.backdrop = CreateFrame("Frame", nil, button)
				icon.backdrop:SetFrameStrata("BACKGROUND")
				icon.backdrop:SetTemplate("Default")
				icon.backdrop:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
				icon.backdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMLEFT", 42, 1)
			end

			icon:SetParent(icon.backdrop)
			icon:SetPoint("TOPLEFT", icon.backdrop, "TOPLEFT", 2, -2)
			icon:SetPoint("BOTTOMRIGHT", icon.backdrop, "BOTTOMRIGHT", -2, 2)

			button.SocketGlow:SetAtlas(nil)
			button.SocketGlow:SetColorTexture(0, 1, 0)
			button.SocketGlow:SetInside(icon.backdrop)

			button.SelectedTexture:SetAtlas(nil)
			button.SelectedTexture:SetColorTexture(1, 0.82, 0, 0.3)
			button.SelectedTexture:SetInside(icon.backdrop)

			button.NameFrame:Kill()
		end
	end)

	local function SkinSkillRankBar(self, _, tradeSkillInfo)
		if tradeSkillInfo.hasProgressBar then
			local bar = self.SubSkillRankBar
			if not bar.backdrop then
				bar:StripTextures()
				bar:CreateBackdrop("Overlay")
				bar:SetStatusBarTexture(C.media.texture)
				bar:SetHeight(10)
			end
		end
	end

	hooksecurefunc(TradeSkillFrame.RecipeList, "Refresh", function()
		for _, button in ipairs(TradeSkillFrame.RecipeList.buttons) do
			if not button.skin then
				hooksecurefunc(button, "SetUpHeader", SkinSkillRankBar)
				button.skin = true
			end
		end
	end)

	hooksecurefunc(TradeSkillFrame.RecipeList, "RefreshDisplay", function(self)
		for i = 1, #self.buttons do
			local tradeSkillButton = self.buttons[i]
			if not tradeSkillButton._auroraSkinned then
				T.SkinExpandOrCollapse(tradeSkillButton)
				tradeSkillButton._auroraSkinned = true
			end
			tradeSkillButton:SetHighlightTexture("")
		end
	end)

	-- Guild Crafters
	TradeSkillFrame.DetailsFrame.GuildFrame:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame:SetTemplate("Transparent")
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:SetTemplate("Transparent")
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton:SkinButton(true)
	T.SkinCloseButton(TradeSkillFrame.DetailsFrame.GuildFrame.CloseButton)
	T.SkinScrollBar(TradeSkillFrameScrollFrame.scrollBar)

	-- Optional Reagent list
	local OptionalReagents = TradeSkillFrame.OptionalReagentList
	OptionalReagents:StripTextures()
	OptionalReagents:CreateBackdrop("Transparent")
	OptionalReagents.backdrop:SetPoint("TOPLEFT", 2, 2)
	OptionalReagents:SetFrameLevel(520)

	OptionalReagents:ClearAllPoints()
	OptionalReagents:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 35, -2)
	OptionalReagents:SetHeight(492)

	OptionalReagents.ScrollList:StripTextures()

	T.SkinCheckBox(OptionalReagents.HideUnownedButton, 22)
	OptionalReagents.HideUnownedButton:SetPoint("TOPLEFT", 8, -4)
	T.SkinScrollBar(OptionalReagents.ScrollList.ScrollFrame.scrollBar)
	OptionalReagents.CloseButton:SkinButton()
	OptionalReagents.CloseButton:SetPoint("BOTTOM", 0, 1)

	hooksecurefunc(OptionalReagents, "Show", function()
		for _, button in pairs(TradeSkillFrame.OptionalReagentList.ScrollList.ScrollFrame.buttons) do
			if button.backdrop then return end
			button:DisableDrawLayer("ARTWORK")
			button.NameFrame:Kill()

			button:CreateBackdrop("Default")
			button.backdrop:SetPoint("TOPLEFT", button.Icon, -2, 2)
			button.backdrop:SetPoint("BOTTOMRIGHT", button.Icon, 2, -2)

			button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.Icon:SetSize(32, 32)
			button.Icon:ClearAllPoints()
			button.Icon:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)

			button.IconBorder:SetAlpha(0)
		end
	end)
end

T.SkinFuncs["Blizzard_TradeSkillUI"] = LoadSkin
