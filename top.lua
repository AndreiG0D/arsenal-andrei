-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
andrei = Tunnel.getInterface("arsenal01_andrei")

-- RESOURCE TUNNEL/PROXY
aRT = {}
Tunnel.bindInterface("arsenal01_andrei",aRT)
Proxy.addInterface("arsenal01_andrei",aRT)
LVserver = Tunnel.getInterface("arsenal01_andrei")

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 4, ['x'] = 1853.48, ['y'] = 3687.81, ['z'] = 34.27 }, --  
	{ ['id'] = 5, ['x'] = -1516.326171875, ['y'] = 1505.1828613281, ['z'] = 111.65287017822 }, --   
	{ ['id'] = 6, ['x'] = -1512.7567138672, ['y'] = 1517.0572509766, ['z'] = 115.28855133057 }, --  

	{ ['id'] = 7, ['x'] = 851.50, ['y'] = 2169.20, ['z'] = 52.280 }, -- dp
	{ ['id'] = 8, ['x'] = 840.08, ['y'] = 2161.44, ['z'] = 52.314 }, -- dp 
	{ ['id'] = 9, ['x'] = 865.79, ['y'] = 2168.91, ['z'] = 52.28 }, -- dp

}

Citizen.CreateThread(function()
	while true do
		local andreiSleep = 1000
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
            if distance <= 2 then
                andreiSleep = 5                
				drawTxt("PRESSIONE  ~b~E~w~  PARA USAR O ARSENAL ",4,0.5,0.93,0.50,255,255,255,180)
				DrawMarker(3, 1853.48,3687.81,34.27-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
				DrawMarker(3, 851.53741455078,2167.9020996094,52.280456542969-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
				DrawMarker(3, 840.32495117188,2161.5939941406,52.306324005127-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)

				DrawMarker(3, 1073.5093994141,-1988.2614746094,30.90592956543-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
				DrawMarker(3, 1088.0223388672,-2001.6083984375,30.879922866821-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
				DrawMarker(3, 1109.5931396484,-2008.220703125,31.050106048584-0.9701,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
				
				if IsControlJustPressed(0,38) and andrei.checkPermissao then
                    LVserver.abrir()
				end
			end
        end
        Citizen.Wait(andreiSleep)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end