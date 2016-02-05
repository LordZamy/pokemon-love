PlayerController = {}

local player

function PlayerController:init(playerObject)
    -- set local copy of player to reference passed in object
    player = playerObject

    -- load sprite sheet
    player:sheet("assets/spritesheets/player_animations.png")

    -- set up grid
    -- basic player animations are 16x22 per sprite
    player:grid(16, 22, player:sheet():getWidth(), player:sheet():getHeight(), 0, 0, 0)

    -- create animations
    defineAnimations()

    -- starting animation
    self.changeAnimation("walk_down")
end

function defineAnimations()
    local duration = 0.4
    -- walk down
    player:animation("walk_down", player:frames(1, 1, 1, 2, 1, 1, 1, 3), duration)
    -- walk left
    player:animation("walk_left", player:frames(2, 1, 2, 2, 2, 1, 2, 3), duration)
    -- walk up
    player:animation("walk_up", player:frames(3, 1, 3, 2, 3, 1, 3, 3), duration)
    -- walk right
    player:animation("walk_right", player:frames(4, 1, 4, 2, 4, 1, 4, 3), duration)
end

-- method to interface with player animation change
function PlayerController.changeAnimation(name)
    player:animation(name)
end

return PlayerController
