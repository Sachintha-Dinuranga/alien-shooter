Ship = Object:extend()

function Ship:new()
    -- load the image
    self.image = love.graphics.newImage("sprites/newShip.png")
    self.x = 350
    self.y = 490
    self.speed = 400
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
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
        self.x = window_width - self.width 
    end
end


function Ship:draw()
    -- draw the image to the screen
    love.graphics.draw(self.image, self.x, self.y)
    -- love.graphics.draw(self.image, self.x, self.y)
end

function Ship:keyPressed(key)
    if key == "space" then
        -- Create bullet first to get its width
        local bullet = Bullet(0, 0)  -- Temporary position
        
        -- Fire bullet from center of ship, accounting for bullet width
        local bulletX = self.x + self.width / 2 - bullet.width / 2
        local bulletY = self.y
        
        -- Update bullet position and add to list
        bullet.x = bulletX
        bullet.y = bulletY
        table.insert(listOfBullets, bullet)
    end
end