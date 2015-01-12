--Testing out LOVE 2D
--Evan Chapman
--December 28th 2014
require "conf"
io.stdout:setvbuf("no")


--Window Settings
love.window.setTitle("Testing Love")


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
	love.graphics.setBackgroundColor(4,200,255) --?Not responding

	sprites = {}
	--[[
	for i = 3, 100 do
		sprites[i] = Sprite:create(
			"/img/mario.png",
			love.math.random(500), love.math.random(500), .1, .1)
	end	
	--]]

	sprites[1] = Sprite:create("rsc/img/mario.png", 10, 10, .1, .1)
	--sprites[2] = Sprite:create("/img/mario.png", 5, 5, .1, .1)
	print("Created sprites")

end

--Called every cycle
function love.update(dt)
	globalDelta = dt

	--Update every sprite
	for i = 0 , 10 do
		if sprites[i] ~= nil then
			sprites[i]:update(dt)
		end
	end

	--mario:update(dt)
end

--Called right after update
function love.draw()

	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(4,200,255)

	--Draw every sprite
	for i = 0, 10 do
		if sprites[i] ~= nil then
			sprites[i]:draw()
		end
	end

	--love.graphics.draw(
		--mario.image,mario.x,mario.y,0,mario.size.x,mario.size.y,0,0,0,0)

	if debugMode == true then
		love.graphics.print("Hello There!",400,300)
		love.graphics.print("Global time " .. globalDelta)	
	end
	love.graphics.print("Hello There!",textX,100 + math.cos(textX))
 	love.graphics.print("Hello World Two",400,200)
 	--newSprite:draw()

end

 --Input callbacks
function love.mousepressed(x,y,button)
	print("Button pressed " .. button)
	if button == "l" then
		love.audio.play(beepSound)
	end
end


function love.mousereleased(x,y,button)
 --nothing
end

function love.keypressed(key)
	--Pass input to every sprite
	for i = 0, 10 do
		if sprites[i] ~= nil then
			sprites[i]:HandleInput(key,"pressed")
		end
	end


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
	--Pass input to every sprite
	for i = 0, 10 do
		if sprites[i] ~= nil then
			sprites[i]:HandleInput(key,"released")
		end
	end

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
