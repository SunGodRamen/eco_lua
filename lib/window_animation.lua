-- Define the duration of the animation (in seconds)
local animationDuration = 0.5

-- Define the amount to move and scale the inactive windows
local moveAmount = 50
local scaleAmount = 0.8

-- Define a list of windows that are currently active
local activeWindows = {}

-- Create a timer that checks for inactive windows and applies the animation
local inactiveWindowTimer = hs.timer.doEvery(1, function()
  -- Get a list of all visible windows
  local allWindows = hs.window.visibleWindows()

  -- Find any windows that are not in the activeWindows list
  local inactiveWindows = {}
  for _, window in ipairs(allWindows) do
    if not hs.fnutils.contains(activeWindows, window:id()) then
      table.insert(inactiveWindows, window)
    end
  end

  -- Move and scale the inactive windows
  for _, window in ipairs(inactiveWindows) do
    local frame = window:frame()
    local newX = frame.x - moveAmount
    local newWidth = frame.w * scaleAmount
    local newHeight = frame.h * scaleAmount
    window:setFrame({x = newX, y = frame.y, w = newWidth, h = newHeight}, animationDuration)
  end

  -- Update the activeWindows list
  activeWindows = hs.fnutils.imap(allWindows, function(window) return window:id() end)
end)
