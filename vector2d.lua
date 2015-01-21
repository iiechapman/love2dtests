--Vector 2D Class
--Evan Chapman

Vector2D = {}
Vector2D.x = 0
Vector2D.y = 0

--Vector2D.__index = Vector2D

function Vector2D:new(x, y)
	newVector = {}
	setmetatable(newVector, self)
	self.__index = self
	newVector.x = x 
	newVector.y = y
	return newVector
end

function Vector2D:add(rhs)
	newVector = Vector2D:new()
	newVector.x = self.x + rhs.x
	newVector.y = self.y + rhs.y
	return newVector
end

function Vector2D:subtract(rhs)
	newVector = Vector2D:new()
	newVector.x = self.x - rhs.x
	newVector.y = self.y - rhs.y
	return newVector
end

function Vector2D:multiply(rhs)
	newVector = Vector2D:new()
	newVector.x = self.x * rhs.x
	newVector.y = self.y * rhs.y
	return newVector
end

function Vector2D:Divide(rhs)
	newVector = Vector2D:new()
	newVector.x = self.x / rhs.x
	newVector.y = self.y / rhs.y
	return newVector
end

function Vector2D:DotProduct(rhs)
	newVector = Vector2D:new()
	newVector.x = self.x * rhs.x 
	return newVector
end

function Vector2D:CrossProduct(rhs)
	product = (self.x * rhs.x) + (self.y + rhs.y)
	return product
end

function Vector2D:Approach(current,goal,dt)
	difference = goal - current
	if difference > dt then
		return current + dt
	elseif difference < -dt then
		return current - dt
	else
		return goal 
	end
end








