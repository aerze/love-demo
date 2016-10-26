
local const = require('constants')

local system = {}

function system:update(dt) 
    if (love.keyboard.isDown(const.keys.close)) then
        love.event.push('quit')
    end
end

return system