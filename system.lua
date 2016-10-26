
local CONST = require('constants')
local controls = require('controls')

local system = {}

function system:update(dt) 
    if (controls.close()) then
        love.event.push('quit')
    end
end

return system