debug = true

const = require('constants')
system = require('system')
player = require('player')


function love.load(arg)
    player:load(arg)
end

function love.update(dt)
    system:update(dt)
    player:update(dt)
end

function love.draw(dt)
    love.graphics.print('Hello World', 400, 300)
    player:draw(dt)
end