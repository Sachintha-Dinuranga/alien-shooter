Alien = Object:extend()

function Alien:new()
    self.image = love.graphics.newImage("sprites/alien.png")
    self.x = 300
    self.y = 15
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Alien:update(dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end
end


function Alien:draw()
    love.graphics.draw(self.image, self.x, self.y)
end