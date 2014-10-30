local movingG = false

function renderWindow(d)
	dxDrawRectangle (d.x, d.y, d.w, d.h, tocolor(d.color[1], d.color[2], d.color[3], d.color[4]))
	dxDrawRectangle (d.x, d.y, d.w, 30, tocolor(0, 0, 0, 255))
	dxDrawText ( d.text, d.x , d.y , d.w + d.x, d.y+30, tocolor ( 255, 255, 255, 255 ), getSize(1, "pricedown"), "pricedown", "center", "center" )
	if d.canmove and not movingG or movingG == d.element then
		if isCursorHover(d.x, d.y, d.w, d.h) and getKeyState("mouse1") then
			d.moving = true
			movingG = d.element
		end
		if d.moving then
			if getKeyState("mouse1") then
				local x, y = getCursorPosition()
				d.x = x*sX
				d.y = y*sY
			else
				d.moving = false
				movingG = false
			end
		end
	end
	windows[d.element] = d
end