ESX 						   = nil

local Group

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('adminchatti:GetGroup', function(source, cb)
    local pelaaja = ESX.GetPlayerFromId(source)

    if pelaaja ~= nil then
        Group = pelaaja.getGroup()
        if Group ~= nil then
            cb(Group)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterCommand('a', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("lahetaviesti", -1, source,  xPlayer.getName(), table.concat(args, " "))
	end
end, false)