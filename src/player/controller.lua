PlayerController = {}

function PlayerController:init(player)
    -- load sprite sheet
    player:sheet("assets/spritesheets/players.png")

    -- set up grid
    player:grid(31, 31)
end

return PlayerController
