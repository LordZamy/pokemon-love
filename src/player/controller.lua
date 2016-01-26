PlayerController = {}

function PlayerController.init(player)
    -- load sprite sheet
    player:sheet("assets/spritesheets/players.png")

    -- set up grid
    player:grid(31, 31)

    -- create animations
    defineAnimations(player)
end

function defineAnimations(player)
    -- turn animation
    player:animation("turn", player:frames(1, 1, 2, 1, 3, 1, 4, 1), 0.2)
end

return PlayerController
