--- Quick opening of applications

hyperShortcuts = {
    e = "Finder",
    r = "Postman",
    t = "kitty",
    i = "IntelliJ IDEA",
    s = "Spotify",
    m = "Signal",
    w = "Slack",
    l = "Obsidian",
--     k = "Google Meet",
    z = "zoom.us",
    a = "Audials Play",
    c = "WhatsApp",
    a = "Firefox",
    o = "Miro",
    g = "ChatGPT",
    d = "1Password"
--     h = "scrcpy"
}

function openApp(name)
    return function()
        hs.application.launchOrFocus(name)

        if name == 'Finder' or name == 'scrcpy' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

for shortcutKey, appName in pairs(hyperShortcuts) do
    hs.hotkey.bind({"alt"}, shortcutKey, openApp(appName))
end
