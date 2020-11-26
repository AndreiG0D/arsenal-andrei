local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

aRT = {}
andrei = {}
vRPclient = Tunnel.getInterface("vRP")
Tunnel.bindInterface("arsenal01_andrei",aRT)
Proxy.addInterface("arsenal01_andrei",aRT)
LVclient = Tunnel.getInterface("arsenal01_andrei")

local armas = {
    "parafall",
    "sub",
    "pistola",
}



function aRT.abrir()
    local source = source
    local id = vRP.getUserId(source)
    local menu = {name = "Arsenal"}
    local submenu = {name = "Armas"}
    for k,v in pairs(armas) do
        menu[v] = {function(source,choice)
            
            submenu['Pegar'] = {function(source,choice)
            if v == "pistola" then
               vRP.giveInventoryItem(id,"wbody|WEAPON_PISTOL_MK2",1)
               vRP.giveInventoryItem(id,"wammo|WEAPON_PISTOL_MK2",100)
               TriggerClientEvent("Notify",source,"sucesso","Você equipou a Pistola do seu inventario",8000)                                 
            end
            if v == "sub" then
                    vRP.giveInventoryItem(id,"wbody|WEAPON_SMG",1)
                    vRP.giveInventoryItem(id,"wammo|WEAPON_SMG",100) 
                    TriggerClientEvent("Notify",source,"sucesso","Você equipou a Sub-Metralhadora do seu inventario",8000)                                     
            end
            if v == "parafall" then
                vRP.giveInventoryItem(id,"wbody|WEAPON_SPECIALCARBINE",1)
                vRP.giveInventoryItem(id,"wammo|WEAPON_SPECIALCARBINE",100)
                TriggerClientEvent("Notify",source,"sucesso","Você equipou a Parafall do seu inventario",8000)   
            end                                                     
            end}vRP.openMenu(source,submenu)

            submenu["Deletar"] = {function(source,choice)
            if v == "pistola" then
               vRP.tryGetInventoryItem(id,"wbody|WEAPON_PISTOL_MK2",1)
               vRP.tryGetInventoryItem(id,"wammo|WEAPON_PISTOL_MK2",100)
               TriggerClientEvent("Notify",source,"sucesso","Você deletou a pistola do seu inventario",8000)         
            end
            if v == "sub" then
                vRP.tryGetInventoryItem(id,"wbody|WEAPON_SMG",1)
                vRP.tryGetInventoryItem(id,"wammo|WEAPON_SMG",100) 
                TriggerClientEvent("Notify",source,"sucesso","Você deletou a Sub-Metralhadora do seu inventario",8000)                     
            end
            if v == "parafall" then
                vRP.tryGetInventoryItem(id,"wbody|WEAPON_SPECIALCARBINE",1)
                vRP.tryGetInventoryItem(id,"wammo|WEAPON_SPECIALCARBINE",100)
                TriggerClientEvent("Notify",source,"sucesso","Você deletou a Parafall do seu inventario",8000)                   
            end         
            end}vRP.openMenu(source,submenu)

        end}vRP.openMenu(source,menu)
    end
end


function andrei.checkPermissao()
    local source = source
    local id = vRP.getUserId(source)
    return vRP.hasPermission(id,"admin.permissao")
end
