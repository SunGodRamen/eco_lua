--  -- Create a DotfilesWidget instance
--local dotfilesWidget = DotfilesWidget.new()

-- Define a DotfilesWidget class
DotfilesWidget = {}
DotfilesWidget.__index = DotfilesWidget

function DotfilesWidget.new()
    local self = setmetatable({}, DotfilesWidget)

    -- Create a canvas for the widget
    self.canvas = hs.canvas.new({x=0, y=0, w=300, h=500})
        :level(hs.canvas.windowLevels.tornOffMenu)
        :behavior(hs.canvas.windowBehaviors.canJoinAllSpaces)
        :canvasMouseEvents(true, true, false, true)
        :clickActivating(false)
        :opaque(false)
        :closeOnEscape(true)
        :allowTextEntry(true)
        :alpha(0.8)
        :show()

    -- Create a scroll view for the list of scripts
    local scrollView = hs._asm.guitk.scrollBar.new({x=0, y=0, w=300, h=500})
    self.canvas:insertElement(scrollView)

    -- Add a list of scripts to the scroll view
    local scriptPath = os.getenv("HOME") .. "/dotfiles/bin"
    local scriptFiles = hs.fnutils.sortByKeys(hs.fs.dir(scriptPath))
    for _, file in ipairs(scriptFiles) do
        if file ~= "." and file ~= ".." and file ~= ".DS_Store" then
            local fullPath = scriptPath .. "/" .. file
            local listItem = hs._asm.guitk.element.new("hs._asm.guitk.listitem")
                :title(file)
                :callback(function()
                    self.canvas:hide()
                    hs.execute(fullPath)
                end)
            scrollView:addElement(listItem)
        end
    end

    -- Hide the widget by default
    self.canvas:hide()

    -- Watch the mouse position and show the widget when the cursor is pushed against the left side of the screen
    local mouseWatcher = hs.mouse.watcher.new(function(event)
        if event.type == hs.eventtap.event.types["mouseMoved"] then
            local frame = hs.screen.mainScreen():frame()
            local x = event:getLocation().x
            if x < 10 then
                self.canvas:topLeft({x=frame.w-300, y=frame.h-500})
                self.canvas:show()
            else
                self.canvas:hide()
            end
        end
    end)
    mouseWatcher:start()

    return self
end
