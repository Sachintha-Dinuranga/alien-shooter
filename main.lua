-- load
function love.load()
    -- load the ship
    Object = require "classic"
    require "ship"

    ship = Ship()

end


-- update
function love.update(dt)
    ship:update(dt)
end


-- draw
function love.draw()
    ship:draw()
end