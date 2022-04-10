local UserGroup

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('lahetaviesti')
AddEventHandler('lahetaviesti', function(id, name, message)
    local mid = PlayerId()
    local pid = GetPlayerFromServerId(id)
	ESX.TriggerServerCallback('adminchatti:GetGroup', function(Group)
		UserGroup = Group
		if pid == mid then
			TriggerEvent('chatMessage', "", {139, 0, 0}, " Ylläpito | " .. name .."  "..":^0  " .. message)
		elseif UserGroup ~= 'user' and pid ~= mid then
			TriggerEvent('chatMessage', "", {139, 0, 0}, " Ylläpito | " .. name .."  "..":^0  " .. message)
		end
  end)
end)


