-- Define the table to store the windows
local windows = {}

-- Define the layout function to arrange the windows
local function layoutWindows()
    local frame = hs.screen.mainScreen():frame()
    local count = #windows
    if count == 0 then
        return
    end
    local width = frame.w / count
    for i, win in ipairs(windows) do
        win:setFrame({x = frame.x + (i - 1) * width, y = frame.y, w = width, h = frame.h})
    end
end

-- Define the function to add a new window
local function addWindow()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    table.insert(windows, win)
    layoutWindows()
end

-- Define the function to remove a window
local function removeWindow()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    for i, w in ipairs(windows) do
        if w == win then
            table.remove(windows, i)
            break
        end
    end
    layoutWindows()
end

-- Define the function to resize a window
local function resizeWindow(delta)
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    local frame = win:frame()
    frame.w = frame.w + delta
    win:setFrame(frame)
end

-- Define the function to move a window left
local function moveWindowLeft()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    for i, w in ipairs(windows) do
        if w == win and i > 1 then
            windows[i] = windows[i - 1]
            windows[i - 1] = win
            break
        end
    end
    layoutWindows()
end

-- Define the function to move a window right
local function moveWindowRight()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    for i, w in ipairs(windows) do
        if w == win and i < #windows then
            windows[i] = windows[i + 1]
            windows[i + 1] = win
            break
        end
    end
    layoutWindows()
end

-- Define the key bindings to manage the windows
hs.hotkey.bind({"cmd", "shift"}, "a", addWindow)
hs.hotkey.bind({"cmd", "shift"}, "r", removeWindow)
hs.hotkey.bind({"cmd", "shift"}, "h", function() resizeWindow(-10) end)
hs.hotkey.bind({"cmd", "shift"}, "l", function() resizeWindow(10) end)
hs.hotkey.bind({"cmd", "shift"}, "j", moveWindowLeft)
hs.hotkey.bind({"cmd", "shift"}, "k", moveWindowRight)
