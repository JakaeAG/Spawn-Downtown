--[[
     Editado por:JakeAG
	 Discord: JakeAG#9900
	 Servidor de Discord:https://discord.gg/FMZ4yBpd3f
       __       ___       __  ___  _______      ___        _______ 
      |  |     /   \     |  |/  / |   ____|    /   \      /  _____|
      |  |    /  ^  \    |  '  /  |  |__      /  ^  \    |  |  __  
.--.  |  |   /  /_\  \   |    <   |   __|    /  /_\  \   |  | |_ | 
|  `--'  |  /  _____  \  |  .  \  |  |____  /  _____  \  |  |__| | 
 \______/  /__/     \__\ |__|\__\ |_______|/__/     \__\  \______| ]]--

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1920), (screenH/1080)


local garage = {
    state = false,
	number = 1,
	Fonte01 = dxCreateFont("font/gotham_light.ttf", x*14),
	Fonte02 = dxCreateFont("font/fontNick.ttf", x*12),
	Car = nil,
	selected = nil,
	Numbers = {},
}



function DxPainel ()

	exports["Blur"]:dxDrawBluredRectangle(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, tocolor(255, 255, 255, 255))
	drawBorde(x*459, y*201, x*1002, y*627, tocolor(11, 11, 11, 100), false)
	drawBorde(x*459, y*201, x*1002, y*67, tocolor(11, 11, 11, 200), false)
	dxDrawText("Garage de la #ffffff- "..config[1][1], x*459, y*201, x*1461, y*268, tocolor(250, 128, 114, 255), 1.00, garage.Fonte01, "center", "center", false, false, false, true, false)
	dxDrawText("Para utilizar los vehiculos usa el boton 'SACAR'!", x*459, y*282, x*1461, y*324, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "center", "center", false, false, false, false, false)

	if config["Viaturas"][1] then
		if garage.selected == 1 then
			drawBorde(x*469-2, y*339-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*469, y*339, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*479, y*344, x*539, y*371, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*372, x*709, y*372, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText(config["Viaturas"][1][1], x*644, y*344, x*704, y*371, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawText("  Modelo :", x*479, y*381, x*539, y*408, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*408, x*709, y*408, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText(config["Viaturas"][1][2], x*644, y*381, x*704, y*408, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawText("  Cantidad en el Garage :", x*479, y*418, x*539, y*445, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*445, x*709, y*445, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText((config["Viaturas"][1][3]-vehiclesSpawned[1]), x*644, y*418, x*704, y*445, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawText("  Cantidad en uso :", x*479, y*451, x*539, y*478, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[1], x*644, y*451, x*704, y*478, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if config["Viaturas"][2] then
		if garage.selected == 2 then
			drawBorde(x*831-2, y*339-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*831, y*339, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*841, y*344, x*901, y*371, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][2][1], x*1005, y*344, x*1065, y*371, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*841, y*371, x*1071, y*371, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Modelo :", x*841, y*381, x*901, y*408, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][2][2], x*1005, y*381, x*1065, y*408, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*841, y*408, x*1071, y*408, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en el Garage :", x*841, y*418, x*901, y*445, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText((config["Viaturas"][2][3]-vehiclesSpawned[2]), x*1005, y*418, x*1065, y*445, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*841, y*445, x*1071, y*445, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en uso :", x*841, y*451, x*901, y*478, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[2], x*1005, y*451, x*1065, y*478, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if config["Viaturas"][3] then
		if garage.selected == 3 then
			drawBorde(x*1192-2, y*339-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*1192, y*339, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*1208, y*344, x*1268, y*371, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][3][1], x*1368, y*344, x*1428, y*371, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1208, y*371, x*1438, y*371, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Modelo :", x*1208, y*381, x*1268, y*408, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][3][2], x*1368, y*381, x*1428, y*408, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1208, y*408, x*1438, y*408, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en el Garage :", x*1208, y*418, x*1268, y*445, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText((config["Viaturas"][3][3]-vehiclesSpawned[3]), x*1368, y*418, x*1428, y*445, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1208, y*445, x*1438, y*445, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en uso :", x*1208, y*451, x*1268, y*478, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[3], x*1368, y*451, x*1428, y*478, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if config["Viaturas"][4] then
		if garage.selected == 4 then
			drawBorde(x*469-2, y*540-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*469, y*540, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*479, y*550, x*539, y*577, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][4][1], x*644, y*550, x*704, y*577, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*577, x*709, y*577, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Modelo :", x*479, y*587, x*539, y*614, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][4][2], x*644, y*587, x*704, y*614, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*614, x*709, y*614, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en el Garage :", x*479, y*624, x*539, y*651, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText((config["Viaturas"][4][3]-vehiclesSpawned[4]), x*644, y*624, x*704, y*651, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*479, y*651, x*709, y*651, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en uso :", x*479, y*655, x*539, y*682, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[4], x*644, y*655, x*704, y*682, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if config["Viaturas"][5] then
		if garage.selected == 5 then
			drawBorde(x*831-2, y*540-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*831, y*540, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*841, y*550, x*901, y*577, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][5][1], x*1005, y*550, x*1065, y*577, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*845, y*577, x*1075, y*577, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Modelo :", x*841, y*587, x*901, y*614, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][5][2], x*1005, y*587, x*1065, y*614, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*845, y*614, x*1075, y*614, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en el Garage :", x*841, y*624, x*901, y*651, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText((config["Viaturas"][5][3]-vehiclesSpawned[5]), x*1005, y*624, x*1065, y*651, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*845, y*651, x*1075, y*651, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en uso :", x*841, y*655, x*901, y*682, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[5], x*1005, y*655, x*1065, y*682, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if config["Viaturas"][6] then
		if garage.selected == 6 then
			drawBorde(x*1192-2, y*540-2, x*259+4, y*156+4, tocolor(250, 128, 114, 255), false)
		end
		drawBorde(x*1192, y*540, x*259, y*156, tocolor(11, 11, 11, 255), false)
		dxDrawText("  Nombre :", x*1208, y*550, x*1268, y*577, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][6][1], x*1368, y*550, x*1428, y*577, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1211, y*577, x*1441, y*577, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Modelo :", x*1208, y*587, x*1268, y*614, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(config["Viaturas"][6][2], x*1368, y*587, x*1428, y*614, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1211, y*614, x*1441, y*614, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en el Garage :", x*1208, y*624, x*1268, y*651, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText((config["Viaturas"][6][3]-vehiclesSpawned[6]), x*1368, y*624, x*1428, y*651, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
		dxDrawLine(x*1211, y*651, x*1441, y*651, tocolor(255, 255, 255, 100), 1, false)
		dxDrawText("  Cantidad en uso :", x*1208, y*655, x*1268, y*682, tocolor(255, 255, 255, 255), 1.00, garage.Fonte02, "left", "center", false, false, false, true, false)
		dxDrawText(vehiclesSpawned[6], x*1368, y*655, x*1428, y*682, tocolor(255, 255, 255, 100), 1.00, garage.Fonte02, "right", "center", false, false, false, true, false)
	end
	if isCursorOnElement(x*564, y*725, x*217, y*48) then
		drawBorde(x*564-2, y*725-2, x*217+4, y*48+4, tocolor(250, 128, 114, 255), false)
	end
	drawBorde(x*564, y*725, x*217, y*48, tocolor(11, 11, 11, 255), false)
	if isCursorOnElement(x*851, y*725, x*217, y*48) then
		drawBorde(x*851-2, y*725-2, x*217+4, y*48+4, tocolor(250, 128, 114, 255), false)
	end
	drawBorde(x*851, y*725, x*217, y*48, tocolor(11, 11, 11, 255), false)
	if isCursorOnElement(x*1146, y*725, x*217, y*48) then
		drawBorde(x*1146-2, y*725-2, x*217+4, y*48+4, tocolor(250, 128, 114, 255), false)
	end
	drawBorde(x*1146, y*725, x*217, y*48, tocolor(11, 11, 11, 255), false)
	dxDrawText("Sacar", x*564, y*725, x*781, y*773, tocolor(255, 255, 255, 255), 1.00, garage.Fonte01, "center", "center", false, false, false, true, false)
	dxDrawText("Cerrar", x*851, y*725, x*1068, y*773, tocolor(255, 255, 255, 255), 1.00, garage.Fonte01, "center", "center", false, false, false, true, false)
	dxDrawText("Guardar", x*1146, y*725, x*1363, y*773, tocolor(255, 255, 255, 255), 1.00, garage.Fonte01, "center", "center", false, false, false, true, false)

end


--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><      Configurações N Altere        ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

function AbrirPainel (v)
	if garage.state == false then
		vehiclesSpawned = v
		addEventHandler ( "onClientRender", root, DxPainel )
		garage.state = true
		showCursor ( true )
		playSoundFrontEnd ( 43 )
	end
end
addEvent("TS:openVTR"..config[1][1], true)
addEventHandler("TS:openVTR"..config[1][1], root, AbrirPainel)


function close()
	removeEventHandler ( "onClientRender", root, DxPainel )
	garage.state = false
	showCursor ( false )
	playSoundFrontEnd ( 43 )
end

function Funcoes (_,state)
	if garage.state == true then
		if state == "down" then
			if isCursorOnElement(x*469, y*339, x*259, y*156) then
				if config["Viaturas"][1] then
					garage.selected = 1
				end
			elseif isCursorOnElement(x*831, y*339, x*259, y*156) then
				if config["Viaturas"][2] then
					garage.selected = 2
				end
			elseif isCursorOnElement(x*1192, y*339, x*259, y*156) then
				if config["Viaturas"][3] then
					garage.selected = 3
				end
			elseif isCursorOnElement(x*469, y*540, x*259, y*156) then
				if config["Viaturas"][4] then
					garage.selected = 4
				end
			elseif isCursorOnElement(x*831, y*540, x*259, y*156) then
				if config["Viaturas"][5] then
					garage.selected = 5
				end
			elseif isCursorOnElement(x*1192, y*540, x*259, y*156) then
				if config["Viaturas"][6] then
					garage.selected = 6
				end
			elseif isCursorOnElement(x*564, y*725, x*217, y*48) then
				if garage.selected >= 1 and garage.selected <= 6 then
					triggerServerEvent("TS:functionVTR"..config[1][1], localPlayer, localPlayer, {"spawnVtr", garage.selected})
					close()
				end
			elseif isCursorOnElement(x*851, y*725, x*217, y*48) then
				close()
			elseif isCursorOnElement(x*1146, y*725, x*217, y*48) then
				if garage.selected >= 1 and garage.selected <= 6 then
					triggerServerEvent("TS:functionVTR"..config[1][1], localPlayer, localPlayer, {"deleteVtr", garage.selected})
					close()
				end
			end
		end
	end
end
addEventHandler ("onClientClick", root, Funcoes )

function isCursorOnElement ( x, y, w, h )
	local mx, my = getCursorPosition ()
	local fullx, fully = guiGetScreenSize ()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

function drawBorde(x, y, w, h, borderColor, bgColor, postGUI)
  if (x and y and w and h) then
      if (not borderColor) then
          borderColor = tocolor(0, 0, 0, 200)
      end
      
      if (not bgColor) then
          bgColor = borderColor
      end        
      postGUI = false

      dxDrawRectangle(x, y, w, h, bgColor, postGUI)

      dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
      dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
      dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
      dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
  end
end
