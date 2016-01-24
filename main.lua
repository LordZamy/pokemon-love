-- Include Simple-Tiled-Implementation
local sti = require "ext/sti"
-- Include anim8
local anim8 = require "ext/anim8/anim8"
-- Include the Player class
local Player = require 'src/player/player'

function love.load ()
    -- Load Maps
    map = sti.new("assets/maps/build/town1.lua")

    -- add custom sprite layer
    spriteLayer = map:addCustomLayer("Sprites", 3)

    -- Just trying stuff here
    playerSheet = love.graphics.newImage("assets/spritesheets/players.png")

    local g = anim8.newGrid(31, 31, playerSheet:getWidth(), playerSheet:getHeight())

    animation = anim8.newAnimation(g(1, 1, 2, 1, 3, 1, 4, 1), 0.2)
end

function love.update (dt)
    map:update(dt)

    animation:update(dt)
end

function love.draw ()
    map:draw()

    animation:draw(playerSheet, 100, 200)
end

