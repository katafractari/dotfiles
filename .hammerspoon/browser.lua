--- Browser helper

local personalProfileName = hs.settings.get('config').browser.profiles.personal
local workProfileName = hs.settings.get('config').browser.profiles.work

function clickMenuItem(target, brave)
    local menuItem = brave:findMenuItem(target)
    if (menuItem) then
        brave:selectMenuItem(target)
    end
end

function chromeSwitchTo(profile)
    hs.application.launchOrFocus("Google Chrome")
    local chrome = hs.appfinder.appFromName("Google Chrome")

    clickMenuItem({"Profiles", profile}, chrome)
end

function chromeIncognito()
    chromeSwitchTo(personalProfileName)

    local chrome = hs.appfinder.appFromName("Google Chrome")

    clickMenuItem({ "File", "New Incognito Window" }, chrome)
end

hs.hotkey.bind({"alt"}, "k", function() chromeSwitchTo(workProfileName) end)
hs.hotkey.bind({"alt"}, "p", function() chromeSwitchTo(personalProfileName) end)
hs.hotkey.bind({"alt"}, "u", function() chromeIncognito() end)
