--Sprite configuration

sprite = {}

sprite.__index = sprite
sprite.size = {}
sprite.speed = 0
sprite.maxSpeed = 3
sprite.acceleration = .1
sprite.x = 100
sprite.y = 100
sprite.size.x = .1
sprite.size.y = .1
sprite.direction = "right"
sprite.moving = false
sprite.image = "null"


function sprite:create(filename, x, y, sizeX, sizeY)
	newSprite = {}
	setmetatable(newSprite, sprite)
	newSprite.__index = sprite
	newSprite.size = {}
	newSprite.speed = 0
	newSprite.maxSpeed = 3
	newSprite.acceleration = .1
	newSprite.x = x
	newSprite.y = y
	newSprite.size.x = sizeX
	newSprite.size.y = sizeY
	newSprite.direction = "right"
	newSprite.moving = false
	newSprite.image = filename
	print("Made sprite")
	return newSprite
end --sprite create


function sprite:update(dt)

	if self.moving == true then 
		if self.direction == "right" then
			--print("moving right")
			self.speed = self.speed + self.acceleration
			if self.speed >= self.maxSpeed then
				self.speed = self.maxSpeed
			end --maxspeed
		end --right



		if self.direction == "left" then
			self.speed = self.speed - self.acceleration
			if self.speed <= -self.maxSpeed then
				self.speed = -self.maxSpeed
			end -- if maxspeed
		end -- if left
	end -- if moving

	if self.moving == false then
		--print("sprite stopped moving..")
		if self.speed < 0 then 
			self.speed = self.speed + self.acceleration
		end -- speed

		if self.speed > 0 then
			self.speed = self.speed - self.acceleration
		end --speed
	end -- moving false

self.x = self.x + self.speed

end -- sprite:update

function sprite:load(filename , x, y, sizeX, sizeY)
	--load sprite content
end --sprite:load


function sprite:draw()
	 	love.graphics.draw(self.image,
 		self.x, self.y,0,self.size.x,self.size.y,0,0,0,0)
end






--end