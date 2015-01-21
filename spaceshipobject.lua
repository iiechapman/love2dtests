--SpaceshipObject

SpaceshipObject = {}
SpaceshipObject.accelerating = false

function SpaceshipObject:new(filename,x,y,scaleX,scaleY)
	newObject = Sprite:new()
end


function SpaceshipObject:HandlePhysics(dt)

end


function SpaceshipObject:HandleInput(key,command)
	if command == "pressed" then

		if key == "right"  then
		end

		if key == "left"  then
		end

		--accelerator
		if key == "z" then
		end
	end

	if command == "released" then

		if key == "z" then

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