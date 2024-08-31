-- Toggle sony headphones connection
hs.hotkey.bind({"alt", "cmd", "shift"}, "h", function()
  local _, output = hs.osascript.applescriptFromFile("connect_sony.applescript")

  hs.notify.new({
    title = "Headphones",
    informativeText = output}):send()
end)
