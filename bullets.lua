
local CONST = require('constants')

local bullets = {}
local bulletPool = {}

local BULLET_IMAGE = nil

function bullets.add(x, y)
    local newBullet = {
        x = x,
        y = y,
        img = BULLET_IMAGE
    }
    table.insert(bulletPool, newBullet)
end

function bullets:load(arg)
    BULLET_IMAGE = love.graphics.newImage(CONST.IMAGE.BULLET)
end

function bullets:update(dt)
    for i, bullet in ipairs(bulletPool) do
        bullet.y = bullet.y - (750 * dt)
        
        if bullet.y < 0 then
            table.remove(bulletPool, i)
        end
    end
end

function bullets:draw(dt)
    for i, bullet in ipairs(bulletPool) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y)
    end
end

return bullets