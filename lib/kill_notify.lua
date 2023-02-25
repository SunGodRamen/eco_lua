local lastTime = 0
local timeout = 0.5

function close_notifications()
    local now = hs.timer.secondsSinceEpoch()
    if now - lastTime <= timeout then
        -- Double Ctrl-F6 pressed within timeout, close notifications
        hs.execute("killall NotificationCenter")
        hs.alert.show("Notifications closed")
    end
    lastTime = now
end

hs.hotkey.bind({"ctrl"}, "F6", close_notifications)

