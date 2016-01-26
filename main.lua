-- Include Simple-Tiled-Implementation
local sti = require "ext/sti"
-- Include anim8
local anim8 = require "ext/anim8/anim8"
-- Include the Player class
local Player = require 'src/player/player'

function love.load()
    -- Load Maps
    map = sti.new("assets/maps/build/town1.lua")

    -- add custom sprite layer
    spriteLayer = map:addCustomLayer("Sprites", 3)

    -- Just trying stuff here
    player = Player:new()
    player:sheet("assets/spritesheets/players.png")
    player:grid(31, 31)
    player:animation("turn", player:frames(1, 1, 2, 1, 3, 1, 4, 1), 0.2)
end

function love.update(dt)
    map:update(dt)

    player:animation("turn"):update(dt)
end

function love.draw()
    map:draw()

    player:animation("turn"):draw(player:sheet(), 100, 200)
end

