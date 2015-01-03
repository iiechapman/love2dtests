--Testing Love engine
--Evan Chapman
--December 29 2014

require "conf"
--Main Callbacks

--Called before all functions
function love.load()
	major,minor,revision,codename = love.getVersion()
	print(codename)
	loadFiles()

	if debugMode == true then
		love.audio.play(startupSound)	
	end

	love.graphics.setNewFont(12)
	love.graphics.setColor(10,100,10)
	love.graphics.setBackgroundColor(4,200,255)

	newSprite = sprite.create("/img/mario.png", 10, 10, .5, .5)

end


--Called every cycle
function love.update(dt)
	globalDelta = dt
	if textX >= 400 then
		textX = 0
	end


	mario:update(dt)
	textX = textX+1
end

--Called right after update
function love.draw()
	love.graphics.setColor(255,255,255)

	love.graphics.draw(mario.image,mario.x,
		mario.y,0,mario.size.x,mario.size.y,0,0,0,0)

	if debugMode == true then
	love.graphics.print("Global time " .. globalDelta)
end
	love.graphics.print("Hello There!",textX,100 + math.cos(textX))
 	love.graphics.print("Hello World Two",400,200)

 	newSprite:draw()

end

 --Input callbacks
function love.mousepressed(x,y,button)
	print("Button pressed " .. button)
	if button == "l" then
		love.audio.play(beepSound)
	end
end


function love.mousereleased(x,y,button)

end

function love.keypressed(key)
	if key == "d" then
		print("Debug mode:\n")
		love.audio.play(debugSound)
		debug.debug()
	end

	if key == "right" then
		mario.direction = "right"
		mario.moving = true
	end

	if key == "left" then
		mario.direction = "left"
		mario.moving = true
	end


	print("Key Pressed " .. key)
end

function love.keyreleased(key)
 	if key == "right" then
		mario.moving = false
 	end

	if key == "left" then
		mario.moving = false
 	end


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





