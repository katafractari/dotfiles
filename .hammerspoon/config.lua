-- Load secrets from local file
hs.settings.set("config", hs.json.read("config.json"))

-- Reload on config change
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
