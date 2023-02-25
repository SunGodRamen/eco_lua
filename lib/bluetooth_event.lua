-- Define a function to handle Bluetooth events
local function bluetoothEvent(event, device)
  print("Bluetooth event: " .. event .. " for device " .. device:name() .. " (" .. device:address() .. ")")
end

-- Register a callback function for Bluetooth events
--     hs.bluetooth.watcher.new(bluetoothEvent):start()
--     hs.bluetooth.watcher.serviceDiscovered: A service was discovered on a Bluetooth device.
--     hs.bluetooth.watcher.deviceConnected: A Bluetooth device was connected.
--     hs.bluetooth.watcher.deviceDisconnected: A Bluetooth device was disconnected.
--     hs.bluetooth.watcher.deviceDiscovered: A new Bluetooth device was discovered.