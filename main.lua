debug = true

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
    player:draw(dt)
end