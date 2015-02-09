--SpaceshipObject

SpaceshipObject = Sprite:new()
SpaceshipObject.accelerating = false
SpaceshipObject.headingVector = Vector2D:new(0,0)

SpaceshipObject.turningRight = false
SpaceshipObject.turningLeft = false

function SpaceshipObject:new(filename,x,y,scaleX,scaleY)
	Sprite:AddObjectCount()
	
	newObject = {}

	for key,value in pairs(SpaceshipObject) do
		if type(key) == "table" then 
			newObject.key = {}
			for tkey,tvalue in pairs(key) do
				newObject.key.tkey = value
			end
			break
		end
		newObject.key = value
	end

	newObject.headingVector = Vector2D:new(0,0)

	setmetatable(newObject, self)
	self.__index = self
	newObject.image = love.graphics.newImage(filename)
	newObject.filename = filename
	newObject.pos = Vector2D:new(x,y)
	newObject.scale = Vector2D:new(scaleX,scaleY)
	return newObject
end



--[[
function SpaceshipObject:HandlePhysics(dt)

end
---]]

function SpaceshipObject:update(dt)
			--print("Updating\n")
			--self.__index:update(dt)
			if self.turningRight then self.angle = self.angle + .1 end

			if self.turningLeft then self.angle = self.angle - .1 end

			if self.accelerating then
				self.pos.x = self.pos.x + math.cos(self.angle) * 2
				self.pos.y = self.pos.y - math.sin(self.angle) * 2
			end


			--print("Angle: " .. self.angle .. "\n")
			Sprite.update(self,dt)
end

function SpaceshipObject:HandleInput(key,command)
	if command == "pressed" then

		if key == "right"  then
			print("Pressed right\n")
			self.turningRight = true
		end

		if key == "left"  then
			print("Pressed left\n")
			self.turningLeft = true
		end

		if key == "up"  then
			print("Pressed up\n")
		end

		if key == "down"  then
			print("Pressed down\n")
		end


		--accelerator
		if key == "z" then
			print("Pressed accel\n")
			self.accelerating = true
		end
	end

	if command == "released" then

		if key == "z" then
			self.accelerating = false
		end

		if key == "right"  then
			self.turningRight = false
		end

		if key == "left"  then
			self.turningLeft = false
		end

	end

end --:handleinput

function SpaceshipObject:CheckBounds()
	if self.pos.y > 300 then
		self.pos.y = 300
		self.canJump = true
		self.falling = false
		self.velocity.y = 0
		print("Changed " .. self.objectNumber)
	else 
		self.falling = true
		--self.velocity.y = self.velocity.y + self.acceleration.y
		--self.moving = true
	end
end