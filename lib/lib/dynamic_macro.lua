-- Define a global variable to store the recorded keystrokes
local keystrokes = {}

-- Define a flag to indicate whether recording is active
local isRecording = false

-- Define a function to start or stop recording keystrokes
function toggleRecording()
    isRecording = not isRecording
    if isRecording then
        keystrokes = {}
        hs.alert.show("Recording started")
    else
        hs.alert.show("Recording stopped")
    end
end

-- Define a function to simulate key presses asynchronously
function simulateKeystrokes()
    local eventTypes = { hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp }
    for i, event in ipairs(keystrokes) do
        local eventToSend = hs.eventtap.event.new(eventTypes[event["type"]], event["keycode"])
        eventToSend:setFlags(event["flags"])
        hs.timer.doAfter(event["delay"] / 1000, function()
            eventToSend:post()
        end)
    end
end

-- Define a function to handle keyboard events
function handleKeyboardEvent(event)
    if isRecording then
        local eventRecord = {
            type = event:getType(),
            keycode = event:getKeyCode(),
            flags = event:getFlags(),
            delay = event:getProperty(hs.eventtap.event.properties.keyboardEventKeyRepeating) == 0 and 0 or 5
        }
        table.insert(keystrokes, eventRecord)
    end
    return false
end

-- Bind the recording function to a hotkey
hs.hotkey.bind({"ctrl"}, "r", toggleRecording)

-- Bind the playback function to a hotkey
hs.hotkey.bind({"ctrl"}, "p", simulateKeystrokes)

-- Install the keyboard event tap
keyboardTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp }, handleKeyboardEvent)
keyboardTap:start()
