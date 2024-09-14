hs.loadSpoon("Caffeine")
spoon.Caffeine:start()

hs.hotkey.bind({"alt", "cmd", "shift"}, "c", function()
  spoon.Caffeine:clicked()
end)
