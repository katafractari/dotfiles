--- Emulate Spectacle (window position, resizing, etc.)

hs.loadSpoon("Lunette")
customBindings = {
    undo = false,
    redo = false,
    topHalf = false,
    bottomHalf = false
  }
spoon.Lunette:bindHotkeys(customBindings)