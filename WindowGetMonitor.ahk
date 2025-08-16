#Requires AutoHotkey v2.0

WindowGetMonitor(WindowTitle) {
    WinGetPos(&x, &y, &w, &h, WindowTitle)

    Monitors := MonitorGetCount()

    loop Monitors {
        MonitorGetWorkArea(A_Index, &left, &top, &right, &bottom)

        centerX := x + (w // 2)
        centerY := y + (h // 2)

        if (centerX >= left && centerX <= right && centerY >= top && centerY <= bottom) {
            return A_Index
        }
    }

    return 1
}
