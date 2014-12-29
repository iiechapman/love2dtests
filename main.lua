--Testing Love engine
--Evan Chapman
--December 29 2014


io.stdout:setvbuf("no")
--Main Callbacks

--Called before all functions
function love.load()
	textX = 1
	love.graphics.setNewFont(12)
	love.graphics.setColor(0,0,0)
	love.graphics.setBackgroundColor(255,255,255)
end


--Called every cycle
function love.update(dt)
	globalDelta = dt
	textX = textX+1
end

--Called right after update
function love.draw()
	love.graphics.print("Global time " .. globalDelta)
	love.graphics.print("Hello There!",textX,100 + math.cos(textX))
 	love.graphics.print("Hello World Two",400,200)
end

 --Input callbacks
function love.mousepressed(x,y,button)

end


function love.mousereleased(x,y,button)

end

function love.keypressed(key)
	if key == "d" then
		print("Debug mode:\n")
		debug.debug()
	end
end

function love.keyreleased(key)

end

function love.focus(f)
	if not f then 
		print("Lost focus")
	else
		print("Gained focus")
	end
end


function love.quit()
	print("Goodbye!")
end





