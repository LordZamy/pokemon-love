InputController = {}

local controllers = {}

local keys = {
    up      = "moveUp",
    down    = "moveDown",
    left    = "moveLeft",
    right   = "moveRight",
}

local bindings = {
    moveUp      = function() controllers.player.changeAnimation("walk_up") end,
    moveDown    = function() controllers.player.changeAnimation("walk_down") end,
    moveLeft    = function() controllers.player.changeAnimation("walk_left") end,
    moveRight   = function() controllers.player.changeAnimation("walk_right") end,
}

function InputController:init(ctrls)
    controllers.player = ctrls.PlayerController
end

function InputController.handler(key)
    local binding = keys[key]
    local action = bindings[binding]

    if action then return action() end
end

return InputController
