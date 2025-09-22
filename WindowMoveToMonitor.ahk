#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

WindowMoveToMonitor(WindowTitle, MonitorNumber) {
    MonitorCount := MonitorGetCount()
    if (MonitorNumber > MonitorCount || MonitorNumber < 1) {
        ; MsgBox "Монитор " MonitorNumber " не существует!"
        ; return false
        MonitorNumber := 1
    }

    MonitorGetWorkArea(MonitorNumber, &left, &top, &right, &bottom)

    WinActivate(WindowTitle)
    Sleep 500

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    centerX := x + (w // 2)
    centerY := y + (h // 2)

    if (centerX >= left && centerX <= right && centerY >= top && centerY <= bottom) {
        return true
    }

    WinActivate(WindowTitle)
    Sleep 500

    newX := left + ((right - left - w) // 2)
    newY := top + ((bottom - top - h) // 2)

    WinMove(newX, newY, w, h, WindowTitle)

    return true
}

; WindowMoveToMonitor(Remote_Title, 2)
