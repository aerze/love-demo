debug = true

system = require('system')
player = require('player')
bullets = require('bullets')
controls = require('controls')


function love.load(arg)
    player:load(arg)
    bullets:load(arg)
    controls:load(arg)
end

function love.update(dt)
    system:update(dt)
    controls:update(dt)
    bullets:update(dt)
    player:update(dt)
end

function love.draw(dt)
    bullets:draw(dt)
    player:draw(dt)
end