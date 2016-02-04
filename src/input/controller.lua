InputController = {}

local bindings = {

}

local keys = {
    up      = function() end,
    down    = function() end,
    left    = function() end,
    right   = function() end,
}

function InputController.handler(key)
    local binding = keys[key]
    local action = bindings[binding]

    if action then return action() end
end

return InputController
