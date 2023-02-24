--  In this example, pressing the F1 key sends a signal to Hammerspoon using the SEND_STRING macro.
--  The signal requests the current desktop and app,
--  and is defined as a Hammerspoon command called qmk_get_desktop_app.
--  You can define this command in your Hammerspoon configuration file
--  to handle the request and send the current desktop and app as raw HID data to the keyboard.
--  
--     When the keyboard receives the raw HID data from Hammerspoon, 
--     the raw_hid_receive function is called automatically by the QMK firmware. 
--     The received data is passed to the function as an array of bytes (data) 
--     and the length of the array (length). In this example, 
--     we check the length of the data to make sure it is one byte, 
--     and then handle the received data by extracting the keyboard state from the first byte.
--     You can modify the raw_hid_receive function to handle the received data in any way you want.
--     The data can be up to 64 bytes long, so you can send and receive a variety of information 
--     between Hammerspoon and the keyboard.


-- Define the QMK keyboard vendor and product IDs
local vendorId = 0x1234
local productId = 0x5678

-- Define the RawHID report size
local reportSize = 64

-- Define a function to send data to the QMK keyboard
local function sendToKeyboard(data)
  local device = hs.usb.interface(vendorId, productId)
  if device then
    device:open()
    device:write(data)
    device:close()
  end
end

-- Define a function to read data from the QMK keyboard
local function readFromKeyboard()
  local device = hs.usb.interface(vendorId, productId)
  if device then
    device:open()
    local data = device:read(reportSize, 1000)
    device:close()
    if data then
      return string.char(unpack(data))
    end
  end
end

-- Define a function to send the current desktop and app information to the keyboard
local function sendDesktopAndAppInfo()
  local desktop = hs.fnutils.indexOf(hs.screen.allScreens(), hs.mouse.getCurrentScreen())
  local app = hs.application.frontmostApplication():title()
  local data = string.format("%x%x", desktop, string.byte(app, 1))
  sendToKeyboard(data)
end

-- Define a function to update the keyboard state
local function updateKeyboardState()
  local state = readFromKeyboard()
  if state then
    print("Keyboard state: " .. state)
  end
end

-- Register a timer to send the current desktop and app information to the keyboard every second
local desktopAndAppInfoTimer = hs.timer.new(1, sendDesktopAndAppInfo)
desktopAndAppInfoTimer:start()

-- Register a timer to update the keyboard state every second
local keyboardStateTimer = hs.timer.new(1, updateKeyboardState)
keyboardStateTimer:start()

-- void process_record_user(uint16_t keycode, keyrecord_t *record) {
--   switch (keycode) {
--     case KC_F1:
--       // Send raw HID data to the host
--       uint8_t data[] = {0x01, 0x02, 0x03};
--       raw_hid_send(data, sizeof(data));
--       break;
--   }
-- }

-- void raw_hid_receive(uint8_t *data, uint8_t length) {
--   // Handle the received raw HID data
--   // ...
-- }

