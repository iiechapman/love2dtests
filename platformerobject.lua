--Platformer Object
--[[
Note:
This class will handle platformer object movement, however right now it is a "fish"	type movement
--]]

PlatformerObject = Sprite:new()

function PlatformerObject:HandlePhysics(dt)
	--Apply Rotation
	self.angle = Vector2D:Approach(self.angle,
		math.atan2(self.velocity.x,-self.velocity.y),dt * 10)

	--Apply Gravity
	if self.falling then
		self.velocity.y = self.velocity.y + self.gravity.y
	end

	if self.moving == true then 
		--Move Right
		if self.direction == "right" then
			--print("moving right")
			self.velocity.x = 
			Vector2D:Approach(self.velocity.x,
				self.velocity.x + self.acceleration.x,dt * self.lerpSpeed)

			if self.velocity.x >= self.maxSpeed.x then
				self.velocity.x = self.maxSpeed.x
				--print("Max speed x ")
			end --maxspeed
		end --right

		--Move Left
		if self.direction == "left" then
			self.velocity.x = 
			Vector2D:Approach(self.velocity.x,
				self.velocity.x - self.acceleration.x,dt * self.lerpSpeed)

			if self.velocity.x <= -self.maxSpeed.x then
				self.velocity.x = -self.maxSpeed.x
				--print("Max speed x")
			end -- if maxspeed
		end -- if left
	end -- if moving

	--Stop Moving
	if self.moving == false then
		--print("sprite stopped moving..")
		if self.velocity.x < 0 then 
			self.velocity.x = 
			Vector2D:Approach(self.velocity.x,
				self.velocity.x + self.acceleration.x,dt * self.lerpSpeed)

			if self.velocity.x >= 0 then
				self.velocity.x = 0
			end
		end -- speed

		if self.velocity.x > 0 then
			self.velocity.x = 
			Vector2D:Approach(self.velocity.x,
				self.velocity.x - self.acceleration.x,dt * self.lerpSpeed)

			if self.velocity.x <= 0 then
				self.velocity.x = 0
			end
		end --speed
	end -- moving false

	--Move image based on movement
	self.pos.x = self.pos.x + self.velocity.x * dt
	self.pos.y = self.pos.y + self.velocity.y * dt
end


function PlatformerObject:HandleInput(key,command)
	if command == "pressed" then
		if key == "right" or key == "left" then
			self.direction = key
			self.moving = true
		end

		if key == "z" and self.canJump then
			love.audio.play(self.jumpSound)
			--self.jumping = true
			self.canJump = false
			self.velocity.y = self.jumpSpeed
			--self.moving = true
		end
	end

	if command == "released" then

		if key == "right" or key == "left" then
			self.moving = false
		end

	end

end --Sprite:handleinput


--[[
function PlatformerObject:update(dt)
	print("Updating PO\n")
end
--]]

function PlatformerObject:CheckBounds()
	--print("Y: " .. self.y)
	if self.pos.y > 300 then
		self.pos.y = 300
		self.canJump = true
		self.falling = false
		self.velocity.y = 0
		--print("Changed " .. self.objectNumber)
	else 
		self.falling = true
		--self.velocity.y = self.velocity.y + self.acceleration.y
		--self.moving = true
	end
end



