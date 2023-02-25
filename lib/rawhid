-- Define a function that handles raw HID events
function handleRawHIDEvent(event)
  -- Print the raw HID event data to the console
  print("Raw HID event:")
  print(event:getRawEventData())
end

-- Create a tap object for raw HID events
local tap = hs.eventtap.new({hs.eventtap.event.types.NSEventTypeSystemDefined}, function(event)
  if event:getType() == hs.eventtap.event.types.NSEventTypeSystemDefined then
      local data = event:getRawEventData()

      -- Check if the raw HID event is a device-specific event
      if data:byte(9) == 1 and data:byte(10) == 2 and data:byte(13) == 0 then
          -- Handle the raw HID event
          handleRawHIDEvent(event)
      end
  end
end)

-- Start the tap object to observe raw HID events
tap:start()
