-- Define the vendor ID and product ID of the headset
local vendorId = "0x05D6"
local productId = "0x000A"

-- Define the key combination to send to Webex
local webexKeyCombo = {"cmd", "alt", "m"}

-- Create a function to send the key combination to Webex
local function sendWebexKeyCombo()
  hs.eventtap.event.newKeyEvent(webexKeyCombo, true):post()
  hs.eventtap.event.newKeyEvent(webexKeyCombo, false):post()
end

-- Create a callback function to be triggered when the volume up button is pressed
local function volumeUpPressed(event)
  if event:getProperty(hs.cocoa.event.property.keyboardEventKeycode) == 72 then
    -- The volume up button was pressed
    sendWebexKeyCombo()
  end
end

-- Create an `hs.usb` object to listen for USB device events
local usbWatcher = hs.usb.watcher.new(function(event)
  if event.productID == productId and event.vendorID == vendorId then
    if event.eventType == "added" then
      -- The headset was plugged in
      hs.eventtap.new({hs.eventtap.event.types.NSSystemDefined}, volumeUpPressed):start()
    elseif event.eventType == "removed" then
      -- The headset was unplugged
      hs.eventtap.new({hs.eventtap.event.types.NSSystemDefined}):stop()
    end
  end
end)

-- Start the USB device event watcher
usbWatcher:start()
