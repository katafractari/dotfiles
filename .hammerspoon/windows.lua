--- Multiple monitor setup

logger = hs.logger.new('apps')

secondaryScreenApplications = {
    ["Finder"] = {},
    ["Brave Browser"] = {},
    ["Google Chrome"] = {},
    ["Postman"] = { position = "rightHalf" },
    ["kitty"] = {},
    ["IntelliJ IDEA"] = {},
    ["Signal"] = { position = "rightHalf" },
    ["Slack"] = { position = "leftHalf" },
    ["Spotify"] = { position = "rightHalf" },
    ["Notes"] = { position = "rightHalf" },
    ["Obsidian"] = { position = "leftHalf" },
    ["Notion"] = { position = "rightHalf" },
    ["1Password 7"] = { position = "rightHalf" },
    ["HA"] = {},
    ["zoom.us"] = {},
    ["Firefox"] = {},
    ["WhatsApp"] = { position = "leftHalf" },
    ["ChatGPT"] = { position = "leftHalf" },
    ["Miro"] = {}
}

function moveApplicationToSecondaryScreen(name)
    local app = hs.application.find(name)

    if app == nil then
        return
    end

    local windows = app:allWindows()

    for _, window in pairs(windows) do
        window:moveOneScreenEast()
    end
end

function positionApplication(name, position)
    local app = hs.application.find(name)

    if app == nil then
        return
    end

    local windows = app:allWindows()

    for _, window in pairs(windows) do
        local screen = window:screen()

        local newFrame
        if position == 'leftHalf' then
            newFrame = Resize:leftHalf(window:frame(), screen:frame())
        elseif position == 'rightHalf' then
            newFrame = Resize:rightHalf(window:frame(), screen:frame())
        else
            newFrame = Resize:fullScreen(window:frame(), screen:frame())
        end

        window:setFrame(newFrame)
    end
end

function moveAndResizeWindows()
    if #(hs.screen.allScreens()) > 1 then
        for name, options in pairs(secondaryScreenApplications) do
            moveApplicationToSecondaryScreen(name)
            positionApplication(name, options.position)
        end
    end
end

hs.hotkey.bind({ "alt" }, "j", function() moveAndResizeWindows() end)
