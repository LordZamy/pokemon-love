-- Include Simple-Tiled-Implementation
local sti = require "ext/sti"
-- Include anim8
local anim8 = require "ext/anim8/anim8"
-- Include the Player class
local Player = require "src/player/player"
-- Add PlayerController
local PlayerController = require "src/player/controller"
-- Add InputController
local InputController = require "src/input/controller"

function love.load()
    -- Load Maps
    map = sti.new("assets/maps/build/town1.lua")

    -- add custom sprite layer
    spriteLayer = map:addCustomLayer("Sprites", 3)

    -- create and init player
    player = Player:new()
    PlayerController:init(player)

    -- init InputController by passing other controllers
    InputController:init({PlayerController = PlayerController})
end

function love.update(dt)
    map:update(dt)

    player.currentAnimation:update(dt)
end

function love.draw()
    map:draw()

    player.currentAnimation:draw(player:sheet(), 100, 200)
end

function love.keypressed(key)
    InputController.handler(key)
end
