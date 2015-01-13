--Configuration file
require "src/sprite"

io.stdout:setvbuf("no")

--Global Values
debugMode = false
textX = 1

function love.conf(t)
	t.console = true
end


--Just to test external functions
function createBoxes()
	for i = 0 , 10 , 1 do
		print("Making a box")
	end
end


--Test loading files outside of main
function loadFiles()
	startupSound = love.audio.newSource("rsc/sound/startup.wav")
	beepSound = love.audio.newSource("rsc/sound/beep.wav")
	debugSound = love.audio.newSource("rsc/sound/debug.wav")
end
