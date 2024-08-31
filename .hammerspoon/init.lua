-- Load secrets from local file
hs.settings.set("config", hs.json.read("config.json"))

-- Reload on config change
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Require modules
require "apps"
require "browser"
require "windows"
require "spectacle"
require "bluetooth"
require "screens"
require "idasen"
require "travel"
