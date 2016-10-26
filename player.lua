
local const = require('constants')

local player = {
    x = 150,
    y = 150,
    speed = 250,
    img = nil
}

function player:load(arg)
    self.img = love.graphics.newImage(const.image.player)
end

function player:update(dt) 
    if love.keyboard.isDown('left', 'a') then
        if self.x > 0 then
            self.x = self.x - (self.speed * dt)
        end
    elseif love.keyboard.isDown('right', 'd') then 
        if self.x < (love.graphics.getWidth() - self.img:getWidth()) then
            self.x = self.x + (self.speed * dt)
        end
    end
end

function player:draw(dt)
    love.graphics.draw(self.img, self.x, self.y)
end

return player