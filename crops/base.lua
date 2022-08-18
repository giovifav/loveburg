local crop = Class:extend()

function crop:new(x,y)
    self.name = "generic crop"
    self.growTime = 1 -- in seconds
    self.paused = false

    self.sprite = love.graphics.newImage("assets/crops/ground/eggplant/eggplant_all_frames.png")
    local w,h = self.sprite:getDimensions()
    self.quads = {}
    self.quads.semi = love.graphics.newQuad(0,0,16,32,w,h)
    self.quads.germoglio = love.graphics.newQuad(16,0,16,32,w,h)
    self.quads.acerbo = love.graphics.newQuad(32,0,16,32,w,h)
    self.quads.inMaturazione = love.graphics.newQuad(48,0,16,32,w,h)
    self.quads.pronto  = love.graphics.newQuad(64,0,16,32,w,h)
    self.quads.troppoMaturo = love.graphics.newQuad(80,0,16,32,w,h)
    self.x, self.y = x, y

    local states = {
        default = {
            { quad = self.quads.semi, duration = self.growTime },
            { quad = self.quads.germoglio, duration = self.growTime },
            { quad = self.quads.acerbo, duration = self.growTime },
            { quad = self.quads.inMaturazione, duration = self.growTime },
            { quad = self.quads.pronto, duration = self.growTime },
            { quad = self.quads.troppoMaturo, duration = self.growTime  }
        }
    }
    self.behavior = Behavior(states)



end
function crop:pause()
    self.paused = not self.paused
end

function crop:update(dt)
    if not self.paused then
    self.behavior:update(dt)
    end
end

function crop:draw()
    
    love.graphics.draw(self.sprite, self.behavior.frame.quad, self.x,self.y)
end

return crop