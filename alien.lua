Alien = Object:extend()

function Alien:new()
    self.image = love.graphics.newImage("sprites/alien.png")
    self.x = 300
    self.y = 25
    self.speed = 100
end

function Alien:update(dt)
    self.x = self.x + self.speed * dt
end


function Alien:draw()
    love.graphics.draw(self.image)
end