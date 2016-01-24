local Sprite = require 'src/sprite/sprite'

local defaults = {
    x = 32,
    y = 32,
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
