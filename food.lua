require 'vector.lua'

Food = {
   identity = "Food class",
   radius = 30
}

function Food:new(x, y)
   local instance = {}
   setmetatable(instance, self)
   self.__index = self

   instance:spawn(x, y)
   return instance
end

function Food:spawn(x, y)
   if x == nil then
      x = love.graphics.getWidth() * math.random()
   end
   if y == nil then
      y = love.graphics.getHeight() * math.random()
   end
   self.size = Food.radius * 2
   self.position = Vector:new(x, y)
   self.sprite = love.graphics.newImage("images/plant1.png")
end

function Food:isEaten(boid)
   if self.position:isNearby(Food.radius, boid.position) then
      self.size = self.size - 1
   end
   if self.size <= 0 then
      self:spawn()
   end
end

function Food:draw()
   love.graphics.draw(self.sprite, self.position.x, self.position.y)
end
