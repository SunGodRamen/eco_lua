-- Toggle the visibility of the application associated with the current desktop ID
function toggleDesktopApp()
  local desktopID = getCurrentDesktop()
  local appName = desktopApps[desktopID]
  if appName then
      local app = hs.application.find(appName)
      if app then
          if app:isFrontmost() then
              -- App is frontmost, hide it
              app:hide()
          elseif app:isHidden() then
              -- App is hidden, show it
              app:unhide()
              app:activate()
          else
              -- App is not frontmost or hidden, activate it
              app:activate()
          end
      else
          -- App is not running, launch it
          hs.application.launchOrFocus(appName)
      end
  end
end
hs.hotkey.bind({"ctrl", "alt"}, "v", toggleDesktopApp)
