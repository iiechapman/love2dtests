--Configuration file
--require "sprite"
--require "platformersprite"

io.stdout:setvbuf("no")


--Global Values
debugMode = false

function love.conf(t)
	t.console = true
end


--Test loading files outside of main
function loadFiles()
	startupSound = love.audio.newSource("rsc/sound/startup.wav")
	beepSound = love.audio.newSource("rsc/sound/beep.wav")
	debugSound = love.audio.newSource("rsc/sound/debug.wav")
end
