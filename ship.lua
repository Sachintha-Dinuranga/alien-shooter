Ship = Object:extend()

function Ship:new()
    -- load the image
    self.image = love.graphics.newImage("sprites/newShip.png")
    self.x = 350
    self.y = 490
    self.speed = 400
    self.width = self.image:getWidth()
    -- print(self.width)

end

function Ship:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    -- remove player move out of the window
    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width -- issue here
    end
end


function Ship:draw()
    -- draw the image to the screen
    love.graphics.draw(self.image, self.x, self.y)
    -- love.graphics.draw(self.image, self.x, self.y)
end

function Ship:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x, self.y))
    end
end