local T, C, L, _ = unpack(select(2, ...))
if C.actionbar.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Vehicle exit button(by Tukz)
----------------------------------------------------------------------------------------
local anchor = CreateFrame("Frame", "VehicleButtonAnchor", UIParent)
if C.actionbar.split_bars then
	anchor:SetPoint(C.position.vehicle_bar[1], SplitBarLeft, C.position.vehicle_bar[3], C.position.vehicle_bar[4], C.position.vehicle_bar[5])
else
	anchor:SetPoint(unpack(C.position.vehicle_bar))
end
anchor:SetSize(C.actionbar.button_size, C.actionbar.button_size)

local vehicle = CreateFrame("Button", "VehicleButton", UIParent)
vehicle:SetSize(C.actionbar.button_size, C.actionbar.button_size)
vehicle:SetPoint("BOTTOMLEFT", anchor, "BOTTOMLEFT")
vehicle:SetNormalTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up")
vehicle:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.2, 0.8)
vehicle:GetNormalTexture():ClearAllPoints()
vehicle:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
vehicle:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
vehicle:SetTemplate("Default")
vehicle:StyleButton(true)
vehicle:RegisterForClicks("AnyUp")
vehicle:SetFrameLevel(3)

hooksecurefunc("MainMenuBarVehicleLeaveButton_Update", function()
	if T.Vanilla or T.TBC then
		if UnitOnTaxi("player") then
			vehicle:Show()
			vehicle:SetScript("OnClick", function(self)
				TaxiRequestEarlyLanding()
				self:LockHighlight()
			end)
		else
			vehicle:Hide()
		end
	else
		if CanExitVehicle() then
			if UnitOnTaxi("player") then
				vehicle:SetScript("OnClick", function(self)
					TaxiRequestEarlyLanding()
					self:LockHighlight()
				end)
			else
				vehicle:SetScript("OnClick", function()
					VehicleExit()
				end)
			end
			vehicle:Show()
		else
			vehicle:UnlockHighlight()
			vehicle:Hide()
		end
	end
end)

if T.Wrath then
	vehicle:RegisterEvent("PLAYER_ENTERING_WORLD")
	vehicle:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
	vehicle:RegisterEvent("UPDATE_MULTI_CAST_ACTIONBAR")
	vehicle:RegisterEvent("UNIT_ENTERED_VEHICLE")
	vehicle:RegisterEvent("UNIT_EXITED_VEHICLE")
	vehicle:RegisterEvent("VEHICLE_UPDATE")
	vehicle:SetScript("OnEvent", function(self)
		if UnitHasVehicleUI("player") then
			self:SetScript("OnClick", function()
				VehicleExit()
			end)
			self:Show()
		else
			self:Hide()
		end
	end)
end

if T.Mainline or T.Wrath then
	hooksecurefunc("PossessBar_UpdateState", function()
		for i = 1, NUM_POSSESS_SLOTS do
			local _, _, enabled = GetPossessInfo(i)
			if enabled then
				vehicle:SetScript("OnClick", function()
					CancelPetPossess()
				end)
				vehicle:Show()
			else
				vehicle:Hide()
			end
		end
	end)
end

-- Set tooltip
vehicle:SetScript("OnEnter", function(self)
	if UnitOnTaxi("player") then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(TAXI_CANCEL, 1, 1, 1)
		GameTooltip:AddLine(TAXI_CANCEL_DESCRIPTION, 1, 0.8, 0, true)
		GameTooltip:Show()
	elseif T.Mainline or T.Wrath then
		if T.Mainline and IsPossessBarVisible() then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip_SetTitle(GameTooltip, CANCEL)
		else
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip_SetTitle(GameTooltip, LEAVE_VEHICLE)
		end
	end
end)
vehicle:SetScript("OnLeave", function() GameTooltip:Hide() end)