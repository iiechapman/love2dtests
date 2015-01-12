--Testing Object Oriented Programming in Lua


--Class Definition
Account = {
	balance = 0
}

--Create a new account
function Account:new(object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	return object
end


function Account:deposit(value)
	self.balance = self.balance + value
end

function Account:withdraw(value)
	self.balance = self.balance - value
end

function Account:printBalance()
	print("Balance " .. self.balance)
end


SpecialAccount = Account:new()
SpecialAccount.limit = 10000

function SpecialAccount:printLimit()
	print("Limit is " .. self.limit)
end


--Using classes as objects
newAccount = Account:new()
secondAccount = Account:new()
newSpecialAccount = SpecialAccount:new()

secondAccount:deposit(12)
secondAccount:withdraw(2)

newAccount:deposit(20)
newAccount:withdraw(4)

newAccount:printBalance()
secondAccount:printBalance()
newSpecialAccount:printLimit()




