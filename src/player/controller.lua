PlayerController = {}

function PlayerController.init(player)
    -- load sprite sheet
    player:sheet("assets/spritesheets/player_animations.png")

    -- set up grid
    -- basic player animations are 16x22 per sprite
    player:grid(16, 22, player:sheet():getWidth(), player:sheet():getHeight(), 0, 0, 0)

    -- create animations
    defineAnimations(player)
end

function defineAnimations(player)
    local duration = 0.2
    -- walk down
    player:animation("walk_down", player:frames(1, 1, 1, 2, 1, 1, 1, 3), duration)
    -- walk left
    player:animation("walk_left", player:frames(2, 1, 2, 2, 2, 1, 2, 3), duration)
    -- walk up
    player:animation("walk_up", player:frames(3, 1, 3, 2, 3, 1, 3, 3), duration)
    -- walk right
    player:animation("walk_right", player:frames(4, 1, 4, 2, 4, 1, 4, 3), duration)
end

return PlayerController
