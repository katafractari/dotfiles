-- Raise Ikea Idasen desk to standing height
hs.hotkey.bind({"alt", "cmd", "shift"}, "-", function()
  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = "Raising the desk to standing height"}):send()

  result = table.pack(hs.execute("~/Workspace/personal/dotfiles/.idasen/linak-controller/bin/linak-controller --config ~/Workspace/personal/dotfiles/.idasen/linak-controller.yaml --move-to stand"))
  print(result[1])

  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = "Done"}):send()
end)

-- Lower Ikea Idasen desk to sitting height
hs.hotkey.bind({"alt", "cmd", "shift"}, ".", function()
  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = "Lowering the desk to sitting height"}):send()

  result = table.pack(hs.execute("~/Workspace/personal/dotfiles/.idasen/linak-controller/bin/linak-controller --config ~/Workspace/personal/dotfiles/.idasen/linak-controller.yaml --move-to sit"))
  print(result[1])

  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = "Done"}):send()
end)

-- Show Ikea Idasen desk current height
hs.hotkey.bind({"alt", "cmd", "shift"}, ",", function()
  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = "Getting desk height"}):send()

  result = table.pack(hs.execute("~/Workspace/personal/dotfiles/.idasen/linak-controller/bin/linak-controller --config ~/Workspace/personal/dotfiles/.idasen/linak-controller.yaml | grep Height"))

  hs.notify.new({
    title = "Ikea Idasen",
    informativeText = result[1]}):send()
end)
