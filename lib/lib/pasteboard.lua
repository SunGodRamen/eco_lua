-- Define a function that opens the pasteboard widget and highlights the selected item
function openPasteboardWidget(items, selectedItemIndex)
  -- Create a canvas for the pasteboard widget
  local canvas = hs.canvas.new({x=0, y=0, w=300, h=200})
      :level(hs.canvas.windowLevels.tornOffMenu)
      :behavior(hs.canvas.windowBehaviors.canJoinAllSpaces)
      :opaque(false)
      :closeOnEscape(true)
      :allowTextEntry(false)
      :clickActivating(false)
      :canvasMouseEvents(true, true, false, true)
      :clickCallback(function(canvas, event)
          if event["clickCount"] == 2 then
              hs.pasteboard.setContents(items[selectedItemIndex])
              canvas:delete()
          end
      end)

  -- Create a list of items for the pasteboard widget
  local list = hs._asm.guitk.element.new("hs._asm.guitk.list")
      :frame(canvas:frame())
      :items(items)
      :select(selectedItemIndex)

  -- Add the list to the canvas
  canvas:insertElement(list)

  -- Show the canvas
  canvas:show()
end

-- Define a function that switches to a specific desktop on the Twiddler 3
function switchToDesktop(index)
  -- Get the current desktop and number of available desktops
  local currentDesktop = hs.spaces.activeSpace()
  local numberOfDesktops = hs.spaces.count()

  -- Calculate the index of the target desktop
  local targetDesktop = currentDesktop + index

  -- Wrap around to the first desktop if necessary
  if targetDesktop > numberOfDesktops then
      targetDesktop = 1
  end

  -- Switch to the target desktop
  hs.spaces.changeToSpace(targetDesktop)
end

-- Define a hotkey for the Ferris Compact
if hs.host.localizedName() == "Ferris Compact" then
  hs.hotkey.bind({"ctrl"}, "1", function()
      local items = {hs.pasteboard.getContents(), "Item 0", "Item 1"}
      openPasteboardWidget(items, 1)
  end)

  hs.hotkey.bind({"ctrl"}, "2", function()
      local items = {hs.pasteboard.getContents(), "Item 2", "Item 3"}
      openPasteboardWidget(items, 1)
  end)

  hs.hotkey.bind({"ctrl"}, "3", function()
      local items = {hs.pasteboard.getContents(), "Item 4", "Item 5"}
      openPasteboardWidget(items, 1)
  end)

  -- Add additional hotkeys as needed for other digits
end

-- Define a hotkey for the Twiddler 3
if hs.host.localizedName() == "Twiddler 3" then
  hs.hotkey.bind({"ctrl"}, "1", function() switchToDesktop(1) end)
  hs.hotkey.bind({"ctrl"}, "2", function() switchToDesktop(2) end)
  hs.hotkey.bind({"ctrl"}, "3", function() switchToDesktop(3) end)

  -- Add additional hotkeys as needed for other digits
end
