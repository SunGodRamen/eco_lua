-- Define a function to open the directory as tabs in nvim
function openDirectoryInNvim(directory)
  local command = "nvim --cmd 'silent NvimTreeToggle' --cmd 'silent NvimTreeFind " .. directory .. "'"
  hs.execute(command)
end

-- Define a callback function for the context menu
function openDirectoryInNvimCallback()
  local files = hs.pasteboard.readFiles()
  if files and #files > 0 then
      local directory = hs.fs.pathToAbsolute(files[1])
      if directory then
          openDirectoryInNvim(directory)
      end
  end
end

-- Define a function to show the context menu
function showContextMenu()
  hs.eventtap.rightClick(hs.mouse.getAbsolutePosition())
  hs.timer.doAfter(0.1, function() hs.eventtap.keyStroke(nil, "down") end)
end

-- Bind the function to the right mouse button
hs.hotkey.bind({"ctrl"}, "m", showContextMenu)

-- Add the "Open directory as tabs in nvim" option to the context menu
hs.contextmenu.new():addItem({
  title = "Open directory as tabs in nvim",
  fn = openDirectoryInNvimCallback
}):addToProvider("com.apple.finder")
