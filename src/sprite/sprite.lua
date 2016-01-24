local defaults = {
    spriteSheet = nil
}

Sprite = {}

function Sprite:new(obj)
    obj = obj or defaults
    setmetatable(obj, self)
    self.__index = self

    return obj
end


function Sprite:spriteSheet(loc)
    if loc == nil then return self.spriteSheet end
    self.spriteSheet = love.graphics.newImage(loc)
end

return Sprite
