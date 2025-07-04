-- load
function love.load()
    -- load the ship
    Object = require "classic"
    require "ship"
    require "alien"

    ship = Ship()
    alien = Alien()

    -- background image
    background = love.graphics.newImage("sprites/space_copy.png")

end


-- update
function love.update(dt)
    ship:update(dt)
    alien:update(dt)
end


-- draw
function love.draw()
    -- background image
    love.graphics.draw(background, 0, 0)

    -- draw the ship
    ship:draw()

    -- draw the alien
    alien:draw()
end