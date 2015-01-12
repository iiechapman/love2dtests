--Sprite configuration

Sprite = {
	size = {x = .1, y = .1},
	speed = {x = 0, y = 0},
	maxSpeed = {x = 12, y = 3},
	acceleration = {x = 1, y = 1},
	jumpSpeed = -20,
	x = 100,
	y = 100,
	direction = "right",
	moving = false,
	falling = false,
	jumping = false,
	canJump = true,
	image = "null"
}
Sprite.__index = Sprite


function Sprite:create(filename, x, y, sizeX, sizeY)
	newSprite = {}
	setmetatable(newSprite, self)
	newSprite.image = love.graphics.newImage(filename)
	newSprite.x = x 
	newSprite.y = y
	newSprite.size = {}
	newSprite.size.x = sizeX
	newSprite.size.y = sizeY
	return newSprite
end --sprite create


function Sprite:draw()
	 	love.graphics.draw(self.image,self.x, self.y,0,self.size.x,self.size.y,0,0,0,0)
end -- sprite:draw


function Sprite:HandleInput(key,command)
	if command == "pressed" then
		if key == "right" or key == "left" then
			self.direction = key
			self.moving = true
		end

		if key == "z" and self.canJump then
			self.jumping = true
			self.moving = true
		end

	end


	if command == "released" then

		if key == "right" or key == "left" then
			self.moving = false
		end

		if key == "z" then
			self.jumping = true
			self.moving = true
		end
	end

end --Sprite:handleinput

function Sprite:CheckBounds()
	--print("Y: " .. self.y)
	if self.y >= 300 then
		--self.moving = false
		self.canJump = true
		self.falling = false
		self.speed.y = 0
	else 
		self.falling = true
		self.speed.y = self.speed.y + self.acceleration.y
		--self.moving = true
	end
end

function Sprite:update(dt)

	if self.jumping == true then
		self.speed.y = self.jumpSpeed
		self.jumping = false
	end


	if self.moving == true then 

		if self.direction == "right" then
			--print("moving right")
			self.speed.x = self.speed.x + self.acceleration.x
			if self.speed.x >= self.maxSpeed.x then
				self.speed.x = self.maxSpeed.x
			end --maxspeed
		end --right

		if self.direction == "left" then
			self.speed.x = self.speed.x - self.acceleration.x
			if self.speed.x <= -self.maxSpeed.x then
				self.speed.x = -self.maxSpeed.x
			end -- if maxspeed
		end -- if left
	end -- if moving

	if self.moving == false then
		--print("sprite stopped moving..")
		if self.speed.x < 0 then 
			self.speed.x = self.speed.x + self.acceleration.x
		end -- speed

		if self.speed.x > 0 then
			self.speed.x = self.speed.x - self.acceleration.x
		end --speed
	end -- moving false

--Move image based on movement
self.x = self.x + self.speed.x
self.y = self.y + self.speed.y

self:CheckBounds()

end -- Sprite:update




--end