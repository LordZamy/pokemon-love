local Sprite = require 'src/sprite/sprite'

local defaults = {
    pos = {
        x = 0,
        y = -8
    },
    targetPos = {
        x = 0,
        y = -8
    },
    speed = 10,
    money = 1000,
}

Player = Sprite:new()

function Player:new(obj)
    obj = obj or defaults
    setmetatable(obj, self)
    self.__index = self

    return obj
end

return Player
