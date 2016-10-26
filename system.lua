
local CONST = require('constants')

local system = {}

function system:update(dt) 
    if (love.keyboard.isDown(CONST.KEYS.CLOSE)) then
        love.event.push('quit')
    end
end

return system