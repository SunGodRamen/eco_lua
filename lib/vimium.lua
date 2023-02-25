-- Load the hs.http module
local http = require("hs.http")

-- Load the hs.json module
local json = require("hs.json")

-- Load the hs.canvas module
local canvas = require("hs.canvas")

-- Define the hotkey to trigger the script
hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
    -- Get the URL of the frontmost tab in Chrome
    local frontmostTabURL = hs.execute("osascript -e 'tell application \"Google Chrome\" to get URL of active tab of front window'")

    -- Get the HTML of the frontmost tab in Chrome
    local frontmostTabHTML = hs.http.get(frontmostTabURL)

    -- Extract the links from the HTML
    local links = {}
    for link in frontmostTabHTML:gmatch('href="(.-)"') do
        table.insert(links, link)
    end

    -- Create a canvas to display the links
    local linkCanvas = canvas.new{
        x = 100,
        y = 100,
        h = 500,
        w = 500,
    }:show()

    -- Create a button for each link
    for i, link in ipairs(links) do
        linkCanvas[tostring(i)] = {
            type = "rectangle",
            action = "fill",
            fillColor = {alpha = 1, red = 1, green = 1, blue = 1},
            roundedRectRadii = {xRadius = 5, yRadius = 5},
            frame = {x = 50, y = (i-1) * 50 + 50, h = 40, w = 400},
            withShadow = true,
            text = {
                type = "text",
                text = link,
                textSize = 20,
                frame = {x = 60, y = (i-1) * 50 + 60, h = 20, w = 380},
            },
        }
    end
end)
