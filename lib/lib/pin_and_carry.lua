-- Load the hs.window module
local window = require("hs.window")

-- Define the window dimensions and position
local windowWidth = 400
local windowHeight = 400
local windowX = 100
local windowY = 100

-- Create a new window
local myWindow = hs.window.new()
myWindow:setSize(windowWidth, windowHeight)
myWindow:setTopLeft(hs.geometry.point(windowX, windowY))
myWindow:setLevel(hs.drawing.windowLevels.desktopIcon)

-- Define the hotkey to pin the window to the screen
hs.hotkey.bind({"cmd", "ctrl"}, "P", function()
    -- Get the current screen and desktop
    local currentScreen = hs.screen.mainScreen()
    local currentDesktop = currentScreen:currentSpace()

    -- Pin the window to the current screen and desktop
    myWindow:setScreen(currentScreen)
    myWindow:setTopLeft(currentDesktop:toGlobal(hs.geometry.point(windowX, windowY)))
end)

-- Watch for changes in the desktop and update the window position
local desktopWatcher = hs.spaces.watcher.new(function()
    local currentScreen = hs.screen.mainScreen()
    local currentDesktop = currentScreen:currentSpace()
    myWindow:setTopLeft(currentDesktop:toGlobal(hs.geometry.point(windowX, windowY)))
end)
desktopWatcher:start()
