function dxDrawWindow(x, y, w, h, text, color)
	if x and y and w and h then
		local element = createElement("dxWindow")
		if element then
			local data = {}
			data.x = x
			data.y = y
			data.w = w
			data.h = h
			data.text = text or ""
			data.relative = relative or false
			data.color = color or {255, 255, 255, 255}
			data.element = element
			data.canmove = true
			data.moving = false
			windows[element] = data
			checkForRender()
			return element
		else
			outputDebugString("[ERROR]dxWindow: no se ha podido crear el elemento dxWindow!")
		end
	else
		outputDebugString("[ERROR]dxWindow: argumentos mal definidos!")
	end
end

function dxWindowSetMovable(element, state)
	if element and windows[element] then
		windows[element].canmove = state
		return true
	end
	return false
end