InputController = {}

local bindings = {
    moveUp = function() print("up") end,
    moveDown = function() print("down") end,
    moveLeft = function() print("left") end,
    moveRight = function() print("right") end,
}

local keys = {
    up      = "moveUp",
    down    = "moveDown",
    left    = "moveLeft",
    right   = "moveRight",
}

function InputController.handler(key)
    local binding = keys[key]
    local action = bindings[binding]

    if action then return action() end
end

return InputController
