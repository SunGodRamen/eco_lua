-- Define the table to store the macros
local macros = {}

-- Define the keys to use for the macro registers
local macroKeys = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

-- Define the function to add a key to a macro
local function addKeyToMacro(key, event)
    if not macros[key] then
        macros[key] = {}
    end
    table.insert(macros[key], event)
end

-- Define the function to play a macro
local function playMacro(key)
    local eventList = macros[key]
    if not eventList then
        return
    end
    for _, event in ipairs(eventList) do
        hs.eventtap.event.new(event):post()
    end
end

-- Define the eventtap to capture the keys
local macroCapture = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()
    if flags["cmd"] and flags["alt"] and keyCode == 53 then -- Escape key with cmd and alt keys
        -- Prompt the user to enter a key to associate with the macro
        hs.focus()
        local chooser = hs.chooser.new(function(selection)
            if not selection then
                return
            end
            local key = selection.text
            -- Add the captured events to the macro
            addKeyToMacro(key, event:copy())
            -- Display a notification confirming the macro has been saved
            hs.notify.show("Hammerspoon", "", "Macro saved to register " .. key, "")
        end)
        chooser:choices(macroKeys)
        chooser:show()
        return true
    elseif flags["cmd"] and macros[keyCode] then -- Cmd key with a registered macro key
        playMacro(keyCode)
        return true
    end
end)

-- Start the macro capture eventtap
macroCapture:start()
