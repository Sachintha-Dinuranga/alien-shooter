Bullet = Object:extend()

function Bullet:new(x, y)
    self.image = love.graphics.newImage("sprites/bullet.png")
    self.x = x
    self.y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    
    self.speed= 400

end

function Bullet:update(dt)
    self.y = self.y - self.speed * dt
end


function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

-- detect collision
function Bullet:checkCollison(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height

    if self_right > obj_left and self_left < obj_right and self_bottom > obj_top and self_top < obj_bottom then
        self.dead = true

        -- increase enemy speed
        if obj.speed > 0 then
            obj.speed = obj.speed + 30
        else
            obj.speed = obj.speed - 30
        end
    end

end



-- pass the x and y of the ship to the bullet