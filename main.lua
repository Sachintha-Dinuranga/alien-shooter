-- load
function love.load()
    -- load the ship
    Object = require "classic"
    require "ship"
    require "alien"
    require "bullet"

    ship = Ship()
    alien = Alien()
    listOfBullets = {} 

    -- background image
    background = love.graphics.newImage("sprites/space_copy.png")

end


-- update
function love.update(dt)
    ship:update(dt)
    alien:update(dt)
    
    -- iterate through list of the bullets
    for i, v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollison(alien)

        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end


-- draw
function love.draw()
    -- background image
    love.graphics.draw(background, 0, 0)

    -- draw the ship
    ship:draw()

    -- draw the alien
    alien:draw()

    -- draw the bullet
    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end

-- call the keypressed function
function love.keypressed(key)
    ship:keyPressed(key)
end