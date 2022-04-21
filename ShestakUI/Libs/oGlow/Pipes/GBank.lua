if oGlow:IsVanilla() then return end

local _E

local update = function(self)
	if not IsAddOnLoaded("Blizzard_GuildBankUI") then return end

	hooksecurefunc(GuildBankFrame, "Update", function()
		local tab = GetCurrentGuildBankTab()
		for i = 1, 98 do
			local index = math.fmod(i, 14)
			if index == 0 then
				index = 14
			end
			local column = math.ceil((i - 0.5) / 14)

			local slotLink = GetGuildBankItemLink(tab, i)
			local slotFrame = GuildBankFrame.Columns[column].Buttons[index]

			self:CallFilters("gbank", slotFrame, _E and slotLink)
		end
	end)
end

local enable = function(self)
	_E = true

	self:RegisterEvent("GUILDBANKFRAME_OPENED", update)
end

local disable = function(self)
	_E = nil

	self:UnregisterEvent("GUILDBANKFRAME_OPENED", update)
end

oGlow:RegisterPipe("gbank", enable, disable, update, "Guild bank frame")
