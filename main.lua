<<<<<<< HEAD
--Testing out LOVE 2D
--Evan Chapman
--December 28th 2014


function love.load()
	io.stdout:setvbuf("no")

	love.window.setTitle("Testing Love")
=======
--Testing Love engine
--Evan Chapman
--December 29 2014


io.stdout:setvbuf("no")
--Main Callbacks

--Called before all functions
function love.load()
	textX = 1
>>>>>>> d9daa3891d58bdb40df16e14f21c4a8c7766f45c
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
<<<<<<< HEAD
	love.graphics.print("Hello There!",400,300)
 	love.graphics.print("Hello World!",400,200)
=======
	love.graphics.print("Global time " .. globalDelta)
	love.graphics.print("Hello There!",textX,100 + math.cos(textX))
 	love.graphics.print("Hello World Two",400,200)
>>>>>>> d9daa3891d58bdb40df16e14f21c4a8c7766f45c
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





