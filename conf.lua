--Configuration file
require "mario"
require "sprite"

io.stdout:setvbuf("no")

--Global Value
debugMode = false
textX = 1

--just test external functions
function createBoxes()
	for i = 0 , 10 , 1 do
		print("Making a box")
	end
end


--Test loading files outside of main
function loadFiles()
	startupSound = love.audio.newSource("/sound/startup.wav")
	beepSound = love.audio.newSource("/sound/beep.wav")
	debugSound = love.audio.newSource("/sound/debug.wav")
	mario.image = love.graphics.newImage("/img/mario.png")
end

