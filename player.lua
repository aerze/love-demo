
local CONST = require('constants')
local KEYS = CONST.KEYS

local controls = require('controls')
local bullets = require('bullets')

local player = {
    x = 150,
    y = 150,
    speed = 250,
    img = nil
}

-- Timers
local canShoot = true
local canShootTimerMax = 0.1
local canShootTimer = canShootTimerMax

-- Bullet
local bulletOffset = false

function player:load(arg)
    self.img = love.graphics.newImage(CONST.IMAGE.PLAYER)
end


function player:update(dt) 
    canShootTimer = canShootTimer - (1 * dt)
    if canShootTimer < 0 then
        canShoot = true
    end

    if controls.shoot() and canShoot then
        local x = self.x + (self.img:getWidth()/2) + 4
        if bulletOffset then
            x = x - 20
        end
        bulletOffset = not bulletOffset
        bullets.add(x, self.y)
        canShoot = false
        canShootTimer = canShootTimerMax
    end

    if controls.up() then
        if self.y > 0 then
            self.y = self.y - (self.speed * dt)
        end
    end
    if controls.down() then 
        if self.y < (love.graphics.getHeight() - self.img:getHeight()) then
            self.y = self.y + (self.speed * dt)
        end
    end

    if controls.left() then
        if self.x > 0 then
            self.x = self.x - (self.speed * dt)
        end
    end
    if controls.right() then 
        if self.x < (love.graphics.getWidth() - self.img:getWidth()) then
            self.x = self.x + (self.speed * dt)
        end
    end
end


function player:draw(dt)
    love.graphics.draw(self.img, self.x, self.y)
end

return player