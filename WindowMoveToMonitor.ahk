#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

WindowMoveToMonitor(WindowTitle, MonitorNumber) {
    MonitorCount := MonitorGetCount()
    if (MonitorNumber > MonitorCount || MonitorNumber < 1) {
        MsgBox "Монитор " MonitorNumber " не существует!"
        return false
    }

    MonitorGetWorkArea(MonitorNumber, &left, &top, &right, &bottom)

    WinActivate(WindowTitle)
    Sleep 500

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    newX := left + ((right - left - w) // 2)
    newY := top + ((bottom - top - h) // 2)

    WinMove(newX, newY, w, h, WindowTitle)

    return true
}
