Class = require("modules.classic")
Behavior = require("modules.behavior")
local crop, level

function love.load()
    
    love.graphics.setDefaultFilter("nearest")
    
    level = require("level")()
    
end

function love.keyreleased(key)

end

function love.update(dt)
    level:update(dt)
end

function love.draw()
    love.graphics.scale(2,2)
    level:draw()

end
