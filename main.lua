--Variables.
sX, sY = guiGetScreenSize()
sSX = 1366
local event = false

--Array donde se guardaran todos los dxGUI que esten en pantalla del jugador.
windows = {}

--Funciones utiles.

function isCursorHover(posX,posY,sizeX,sizeY)
	if posX and posY and sizeX and sizeY then
		if isCursorShowing() then
			local x,y = getCursorPosition()
			local x,y = x*sX,y*sY
			if x>=posX and x<=posX+sizeX and y>=posY and y<=posY+sizeY then
				return true
			end
		else
			return false
		end
	else
		return false
	end
end

function checkForRender()
	if not event then
		addEventHandler("onClientRender", root, renderWindows)
		event = true
		outputDebugString("Start renders")
	end
end


function renderWindows()
	if table.size( windows ) == 0 then
		removeEventHandler("onClientRender", root, renderWindows)
		event = false
		outputDebugString("Stop renders")
	end
	for i, d in pairs(windows) do
		if getElementType(i) == "dxWindow" then
			renderWindow(d)
		end
	end
end

function table.size( t )
    if type( t ) ~= 'table' then
        return false
    end
    local n = 0
    for _ in pairs( t ) do
        n = n + 1
    end
    return n
end

function dxGetPosition(element)
	if element and windows[element] then
		local d = windows[element]
		return d.x, d.y
	end
	return false
end

function dxSetPosition(element, x, y)
	if element and windows[element] and x and y then
		local d = windows[element]
		d.x = x
		d.y = y
		windows[element] = d
		return true
	end
	return false
end

function dxGetSize(element)
	if element and windows[element] then
		local d = windows[element]
		return d.w, d.h
	end
	return false
end

function dxSetSize(element, w, h)
	if element and windows[element] and w and h then
		local d = windows[element]
		d.w = w
		d.h = h
		windows[element] = d
		return true
	end
	return false
end

function dxGetText(element)
	if element and windows[element] and windows[element].text then
		local d = windows[element]
		return d.text
	end
	return false
end

function dxSetText(element, text)
	if element and windows[element] and windows[element].text and text then
		local d = windows[element]
		d.text = text
		windows[element] = d
		return true
	end
	return false
end