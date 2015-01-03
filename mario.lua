--Mario Configuration

mario = {}
mario.size = {}
mario.speed = 0
mario.maxSpeed = 3
mario.acceleration = .1
mario.x = 100
mario.y = 100
mario.size.x = .1
mario.size.y = .1
mario.direction = "right"
mario.moving = false

function mario:update(dt)

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
		--print("Mario stopped moving..")
		if self.speed < 0 then 
			self.speed = self.speed + self.acceleration
		end -- speed

		if self.speed > 0 then
			self.speed = self.speed - self.acceleration
		end --speed
	end -- moving false

self.x = self.x + self.speed

end -- mario:update














--end