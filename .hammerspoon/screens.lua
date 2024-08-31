screenWatcher = hs.screen.watcher.new(function()
    hs.timer.doAfter(3, function()
        moveAndResizeWindows()
    end)
end)

screenWatcher:start()
