-- Move the focus to the window in the corresponding direction
function moveFocus(direction)
  local win = hs.window.focusedWindow()
  if win then
      local newWin = win:windowsTo(direction, nil, true)
      if newWin and #newWin > 0 then
          newWin[1]:focus()
      end
  end
end

-- Bind the function to keyboard shortcuts
hs.hotkey.bind({"ctrl"}, "up", function() moveFocus("north") end)
hs.hotkey.bind({"ctrl"}, "down", function() moveFocus("south") end)
hs.hotkey.bind({"ctrl"}, "left", function() moveFocus("west") end)
hs.hotkey.bind({"ctrl"}, "right", function() moveFocus("east") end)
