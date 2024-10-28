local RIGHT_HALF = 'rightHalf'
local LEFT_HALF = 'leftHalf'

function positionApplication(app, screen, options)
    local windows = app:allWindows()

    for _, window in pairs(windows) do
        window:moveToScreen(options.screen)

        if options.position == nil then
            local newFrame = Resize:fullScreen(window:frame(), screen:frame())
            window:setFrame(newFrame)
        else
            local newFrame = Resize[options.position](self, window:frame(), screen:frame())
            window:setFrame(newFrame)
        end
    end
end

function arrangeApplicationsWindows(applications)
    for applicationName, screensConfig in pairs(applications) do
        local app = hs.application.find(applicationName)
        if app == nil then
            break
        end

        for _, screenOptions in ipairs(screensConfig) do
            local screen = getScreen(screenOptions.screen)
            if screen ~= nil then
                positionApplication(app, screen, screenOptions)
                break
            end
        end
    end
end

function getScreen(name)
    for _, screen in ipairs(hs.screen.allScreens()) do
        if screen:name() == name then
            return screen
        end
    end

    return nil
end

HOME_CENTER_SCREEN = 'DELL P2720DC (2)'
HOME_LEFT_SCREEN = 'DELL P2720DC (1)'
OFFICE_RIGHT_SCREEN = 'TBD'
MACBOOK_SCREEN = 'Built-in Retina Display'

local applications = {
    ["Finder"] = { { screen = HOME_CENTER_SCREEN }, { screen = OFFICE_RIGHT_SCREEN }, { screen = MACBOOK_SCREEN } },
    ["Google Chrome"] = { { screen = HOME_CENTER_SCREEN }, { screen = OFFICE_RIGHT_SCREEN }, { screen = MACBOOK_SCREEN } },
    ["Postman"] = { { screen = HOME_LEFT_SCREEN, position = RIGHT_HALF }, { screen = OFFICE_RIGHT_SCREEN, position = RIGHT_HALF }, { screen = MACBOOK_SCREEN } },
    ["kitty"] = { { screen = HOME_LEFT_SCREEN }, { screen = MACBOOK_SCREEN } },
    ["IntelliJ IDEA"] = { { screen = HOME_CENTER_SCREEN }, { screen = OFFICE_RIGHT_SCREEN }, { screen = MACBOOK_SCREEN } },
    ["Signal"] = { { screen = MACBOOK_SCREEN, position = RIGHT_HALF } },
    ["Slack"] = { { screen = HOME_LEFT_SCREEN, position = RIGHT_HALF }, { screen = MACBOOK_SCREEN } },
    ["Spotify"] = { { screen = MACBOOK_SCREEN } },
    ["Obsidian"] = { { screen = HOME_LEFT_SCREEN, position = RIGHT_HALF }, { screen = MACBOOK_SCREEN } },
    ["1Password"] = { { screen = HOME_CENTER_SCREEN, position = LEFT_HALF }, { screen = MACBOOK_SCREEN } },
    ["zoom.us"] = { { screen = MACBOOK_SCREEN } },
    ["Firefox"] = { { screen = HOME_LEFT_SCREEN }, { screen = OFFICE_RIGHT_SCREEN }, { screen = MACBOOK_SCREEN } },
    ["WhatsApp"] = { { screen = MACBOOK_SCREEN, position = LEFT_HALF } },
    ["ChatGPT"] = { { screen = HOME_LEFT_SCREEN, position = RIGHT_HALF }, { screen = MACBOOK_SCREEN } },
    ["Miro"] = { { screen = HOME_CENTER_SCREEN }, { screen = OFFICE_RIGHT_SCREEN }, { screen = MACBOOK_SCREEN } }
}

hs.hotkey.bind({ "alt" }, "j", function() arrangeApplicationsWindows(applications) end)
