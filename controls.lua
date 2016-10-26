
local const = require('constants')

local controls = {}
local controller = nil
local rightStick = { x = 0, y = 0 }
local rightTrigger = -1
local leftStick = { x = 0, y = 0 }
local leftTrigger = -1

function controls:load(arg)
    local joysticks = love.joystick.getJoysticks()
    if #joysticks > 0 then
        controller = joysticks[1]
    end
end

function controls:update(dt)
    if not controller then return end

    rightStick.x = controller:getAxis(1)
    rightStick.y = controller:getAxis(2)
    rightTrigger = controller:getAxis(3)

    leftStick.x = controller:getAxis(4)
    leftStick.y = controller:getAxis(5)
    leftTrigger = controller:getAxis(6)
end



function controls:up()
    if controller then
        return rightStick.y < -0.1
    end
    return love.keyboard.isDown('up', 'w')
end

function controls:down()
    if controller then
        return rightStick.y > 0.1
    end
    return love.keyboard.isDown('down', 's')
end

function controls:left()
    if controller then
        return rightStick.x < -0.1
    end
    return love.keyboard.isDown('left', 'a')
end

function controls:right()
    if controller then
        return rightStick.x > 0.1
    end
    return love.keyboard.isDown('right', 'd')
end

function controls:shoot()
    if controller then
        return controller:isGamepadDown('a', 'b')
    end
    return love.keyboard.isDown('space')
end

function controls:close()
    local back = false
    local escape = false

    if controller then
        back = controller:isGamepadDown('back')
    end
    escape = love.keyboard.isDown('escape')

    return back or escape
end

return controls