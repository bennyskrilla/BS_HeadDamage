Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()

        -- Check if the player is currently taking damage
        if HasEntityBeenDamagedByAnyPed(playerPed) then
            local foundBone, lastBone = GetPedLastDamageBone(playerPed)

            -- Check if the bone hit was the head (31086)
            if foundBone and lastBone == 31086 then
                -- Set the damage. 300 is usually enough for an instant kill
                -- since default health is 200.
                ApplyDamageToPed(playerPed, 300, false)
                
                -- Clear the damage blood/decals so it doesn't loop infinitely
                ClearEntityLastDamageEntity(playerPed)
            end
        end
    end
end)