local Crop = require("crops.base")
local level = Class:extend()
function level:new()
    self.terrain = love.graphics.newImage("assets/maps/Level_0/_composite.png")
    self.coltivabile = {}
    self.crops = {}
    local cMap = love.image.newImageData("assets/maps/Level_0/Coltivabile-int.png")
    for x = 0, cMap:getWidth()-1, 1 do
        self.coltivabile[x] = {}
        for y = 0, cMap:getHeight()-1, 1 do
            local r,g,b,a = cMap:getPixel(x, y)
            if a > 0 then
                self.coltivabile[x][y] = true
                table.insert(self.crops,Crop(x*16,(y-1)*16))
            else
                self.coltivabile[x][y] = false
            end
        end
    end

end

function level:draw()
    love.graphics.draw(self.terrain,0,0)
    for k, v in ipairs(self.crops) do
        v:draw()
    end
end
function level:update(dt)
    
    for k, v in ipairs(self.crops) do
        v:update(dt)
    end
end

return level