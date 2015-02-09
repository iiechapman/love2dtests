--Testing out LOVE 2D
--Evan Chapman
--December 28th 2014

require "conf"
require "requirements"

--Window Settings
love.window.setTitle("Testing Love")


--Main Callbacks

--Called before all functions
function love.load()

	if debugMode == true then
		major,minor,revision,codename = love.getVersion()
		print(codename)
		love.audio.play(startupSound)	
	end

	loadFiles()
	CreateSprites()
end

--Called every cycle
function love.update(dt)
	globalDelta = dt
	UpdateSprites(dt)
end

--Called right after update
function love.draw()
	ClearDrawColor()
	DrawSprites()

	if debugMode == true then DebugText() end

end

function ClearDrawColor()
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(4,200,255)
end

function DebugText()
	love.graphics.print("Hello There!",400,300)
	love.graphics.print("Global time " .. globalDelta)	
	love.graphics.print("Hello There!",textX,100 + math.cos(textX))
 	love.graphics.print("Hello World Two",400,200)
end

function DrawSprites()
	--Draw every sprite
	Draw(sprites)
end

function Draw(group)
		for i = 0, #group do
		if group[i] ~= nil then
			group[i]:draw()
		end
	end
end

function Update(group,dt)
		for i = 0 , #group do
		if group[i] ~= nil then
			--print("Name: " .. group[i].name)
			group[i]:update(dt)
		end
	end

end

function UpdateSprites(dt)
	--Update every sprite
	Update(sprites,dt)
end


function CreateSprites()
	--Creates all sprites for scene

	sprites = {}
	numSprites = 3

	for i = 1, numSprites do
		sprites[i] = PlatformerObject:new("rsc/img/mario.png",
		math.random(400), math.random(200) + math.random(200), .1, .1)
	end	


	for i = 3, 10 do
		sprites[i] = SpaceshipObject:new("rsc/img/spaceship.png", 200 +
		math.random(100), 200 + math.random(100), .1, .1)
	end	

	print("Total Objects: " .. Sprite:numberOfObjects())

end


 --Love Input callbacks
function love.mousepressed(x,y,button)
	--print("Button pressed " .. button)
	if button == "l" then
		love.audio.play(beepSound)
	end
end

function love.mousereleased(x,y,button)
 --nothing
end

function love.keypressed(key)
	--Pass input to every sprite
	HandleInput(sprites,key,"pressed")

	if key == "d" then
		print("Debug mode:\n")
		love.audio.play(debugSound)
		debug.debug()
	end
end
	
function love.keyreleased(key)
	--Pass input to every sprite
	HandleInput(sprites,key,"released")
end


function HandleInput(group,key,state)
	for i = 0, #group do
		if group[i] ~= nil then
			group[i]:HandleInput(key,state)
		end
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
