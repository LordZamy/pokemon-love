local anim8 = require "ext/anim8/anim8"

local defaults = {
    spriteSheet = nil,
    animGrid = nil
}

Sprite = {}

function Sprite:new(obj)
    obj = obj or defaults
    setmetatable(obj, self)
    self.__index = self

    return obj
end

-- sets or gets the sprite sheet
function Sprite:sheet(sheet)
    if not sheet then return self.spriteSheet end
    if type(sheet) == "string" then
        self.spriteSheet = love.graphics.newImage(sheet)
    elseif type(sheet) == "table" then
        self.spriteSheet = sheet
    else
        error("Not a valid sprite sheet.")
    end
end

-- creates a anim8 grid
function Sprite:grid(frameWidth, frameHeight, imageWidth, imageHeight, left, top, border)
    frameWidth = frameWidth or 32
    frameHeight = frameHeight or 32
    imageWidth = imageWidth or self.spriteSheet:getWidth()
    imageHeight = imageHeight or self.spriteSheet:getHeight()
    left = left or 0
    top = top or 0
    border = border or 0

    self.animGrid = anim8.newGrid(frameWidth, frameHeight, imageWidth, imageHeight, left, top, border)
end

-- creates a anim8 frameset
function Sprite:frames(...)
    if not self.animGrid then
        error("Animation grid not specified.")
    end

    return self.animGrid(...)
end

-- sprite animations defined here
Sprite.animations = {}

-- current sprite animation
Sprite.currentAnimation = nil

-- creates an anim8 animation and adds to the animations table
-- if only name is given then sets current sprite animation
function Sprite:animation(name, frames, durations, onLoop)
    if not frames then
        self.currentAnimation = self.animations[name]
        return
    end
    local anim = anim8.newAnimation(frames, durations, onLoop)
    self.animations[name] = anim
end

return Sprite
