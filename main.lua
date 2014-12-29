function love.load()
	love.graphics.setNewFont(12)
	love.graphics.setColor(0,0,0)
	love.graphics.setBackgroundColor(255,255,255)
end

function love.draw()
	love.graphics.print("Hello There!",400,300)
 	love.graphics.print("Hello World!",400,200)
end

