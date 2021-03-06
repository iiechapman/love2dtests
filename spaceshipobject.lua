--SpaceshipObject

SpaceshipObject = Sprite:new()
SpaceshipObject.accelerating = false
SpaceshipObject.headingVector = Vector2D:new(0,0)

SpaceshipObject.turningRight = false
SpaceshipObject.turningLeft = false
SpaceshipObject.accel = 0
SpaceshipObject.decel = 0
SpaceshipObject.boost = false

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
			self.angleDegrees = self.angle * (180 / math.pi)

			if self.turningRight then self.angle = self.angle + .05 end
			if self.turningLeft then self.angle = self.angle - .05 end

			self.angleDegrees = self.angle * (180 / math.pi)

			if self.angleDegrees > 360 then 
				self.angleDegrees = self.angleDegrees - 360
			end

			if self.angleDegrees < 0 then 
				self.angleDegrees = self.angleDegrees + 360
			end


			--print("Angle: " .. self.angleDegrees)
			if self.accelerating then
				self.accel = 10

				if self.boost then 
					self.accel = 100
				end
			else 
				self.accel = self.accel - 1
				if self.accel <= 0 then self.accel	= 0 end

				if self.velocity.x > 0 then self.velocity.x = self.velocity.x - 2 end
				if self.velocity.x < 0 then self.velocity.x = self.velocity.x + 2 end
				if self.velocity.y > 0 then self.velocity.y = self.velocity.y - 2 end
				if self.velocity.y < 0 then self.velocity.y = self.velocity.y + 2 end
			end

			--Jet movement vector
			self.velocity.x = 
			Vector2D:Approach(self.velocity.x,self.velocity.x + math.cos(self.angle) * self.accel,dt * 500)
			
			self.velocity.y =
			Vector2D:Approach(self.velocity.y,self.velocity.y + math.sin(self.angle) * self.accel,dt * 500)



			self.pos.x = self.pos.x + self.velocity.x * dt
			self.pos.y = self.pos.y + self.velocity.y * dt

			--print("Angle: " .. self.angle .. "\n")
			Sprite.update(self,dt)
end

function SpaceshipObject:HandleInput(key,command)
	if command == "pressed" then

		if key == "right"  then
			--print("Pressed right\n")
			self.turningRight = true
		end

		if key == "left"  then
			--print("Pressed left\n")
			self.turningLeft = true
		end

		if key == "up"  then
			--print("Pressed up\n")
		end

		if key == "down"  then
			--print("Pressed down\n")
		end


		--accelerator
		if key == "z" then
			--print("Pressed accel\n")
			self.accelerating = true
		end

		if key == "shift" then
			--print("Pressed accel\n")
			self.boost = true
		end


	end

	if command == "released" then

		if key == "z" then
			self.accelerating = false
		end

		if key == "shift" then
			--print("Pressed accel\n")
			self.boost = false
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

end