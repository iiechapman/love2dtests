--Sprite configuration
require "vector2d"

Sprite = {}
	Sprite.velocity = Vector2D:new(0,0)
	Sprite.acceleration = Vector2D:new(99000,99000)
	Sprite.maxSpeed = Vector2D:new(6000,6000)
	Sprite.gravity = Vector2D:new(0,10)
	Sprite.jumpSpeed = -500
	Sprite.lerpSpeed = 700
	Sprite.size = Vector2D:new(.1,.1)
	Sprite.pos = Vector2D:new(0,0)
	Sprite.angle = 0
	Sprite.origin = Vector2D:new(0,0)
	Sprite.direction = "right"
	Sprite.moving = false
	Sprite.falling = false
	Sprite.jumping = false
	Sprite.canJump = true
	Sprite.image = "/rsc/img/mario.png"
	Sprite.name = "Sprite"
	Sprite.totalObjects = 0
	--Sprite.__index = Sprite

function Sprite:new(filename, x, y, scaleX, scaleY)
	local newSprite = {}
	setmetatable(newSprite, self)
	self.__index = self
	self.totalObjects = self.totalObjects + 1
	print("Total obj " .. self.totalObjects)
	newSprite.objectNumber = self.totalObjects
	newSprite.filename = filename or "/rsc/img/mario.png"
	newSprite.jumpSound = jumpSound or "/rsc/sound/jump.wav"
	newSprite.image = 		love.graphics.newImage(newSprite.filename)
	newSprite.jumpSound =	love.audio.newSource("/rsc/sound/jump.wav")
	newSprite.pos = Vector2D:new(x,y)
	newSprite.scale = Vector2D:new(scaleX,scaleY)
	newSprite.origin = Vector2D:new(1,1)
	newSprite.velocity = Vector2D:new(0,0)
	newSprite.canJump = true
	newSprite.moving = false
	newSprite.falling = false
	newSprite.jumping = false
	newSprite.angle = 0
	newSprite.direction = "right"
	return newSprite
end --sprite new


function Sprite:draw()
	 	love.graphics.draw(self.image,self.pos.x, self.pos.y,
	 		self.angle,self.scale.x,self.scale.y,
	 		self.origin.x,self.origin.y,0,0)
end -- sprite:draw


function Sprite:HandleInput(key,command)
end --Sprite:handleinput

function Sprite:CheckBounds()
end

function Sprite:update(dt)
	if dt > .15 then
		dt = .15
	end

	self:CheckBounds()
	self:HandlePhysics(dt)
end -- Sprite:update

function Sprite:HandlePhysics(dt)
end


--end