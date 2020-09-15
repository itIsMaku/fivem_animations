Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		handsup = false
		RequestAnimDict("random@mugging3")
		if not IsPedInAnyVehicle(lPed, false) and not IsPedSwimming(lPed) and not IsPedShooting(lPed) and not IsPedClimbing(lPed) and not IsPedCuffed(lPed) and not IsPedDiving(lPed) and not IsPedFalling(lPed) and not IsPedJumping(lPed) and not IsPedJumpingOutOfVehicle(lPed) and IsPedOnFoot(lPed) and not IsPedRunning(lPed) and not IsPedUsingAnyScenario(lPed) and not IsPedInParachuteFreeFall(lPed) then
			if IsControlPressed(1, 323) then
				if DoesEntityExist(lPed) then
					SetCurrentPedWeapon(lPed, 0xA2719263, true)
					Citizen.CreateThread(function()
						RequestAnimDict("random@mugging3")
						while not HasAnimDictLoaded("random@mugging3") do
							Citizen.Wait(100)
						end

						if not handsup then
							handsup = true
							TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
						end   
					end)
				end
			end
		end
		if IsControlReleased(1, 323) then
			if DoesEntityExist(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("random@mugging3")
					while not HasAnimDictLoaded("random@mugging3") do
						Citizen.Wait(100)
					end

					if handsup then
						handsup = false
						ClearPedSecondaryTask(lPed)
					end
				end)
			end
		end
	end
end)
Citizen.CreateThread(function()    
	RequestAnimDict("anim@amb@nightclub@peds@")
	while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 47) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), "anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)
Citizen.CreateThread(function()
	local dict = "anim@mp_player_intincarthumbs_upbodhi@ps@"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local thumbsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 182) then 
            if not thumbsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "enter", 8.0, 8.0, -1, 50, 0, false, false, false)
                thumbsup = true
            else
                thumbsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
	end 
end)