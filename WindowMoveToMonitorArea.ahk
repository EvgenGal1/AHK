#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\WindowGetMonitor.ahk"
#Include "D:\Про\Творения\AHK\WindowMoveToMonitor.ahk"
#Include "D:\Про\Творения\AHK\DPD_ExitRemoteFullScreen.ahk"

WindowMoveToMonitorArea(WindowTitle, MonitorNumber, Position) {
    MonitorCount := MonitorGetCount()
    if (MonitorNumber > MonitorCount || MonitorNumber < 1) {
        ; MsgBox "Монитор " MonitorNumber " не существует!"
        ; return false
        MonitorNumber := 1
    }

    parts := StrSplit(Position, "_")
    side := parts[1]
    rercent := parts[2]

    WinActivate(WindowTitle)
    Sleep 500

    if (InStr(WindowTitle, Remote_Title)) {
        ExitRemoteFullScreen()
        Sleep 500
    }

    if (MonitorCount > 1) {
        WindowMoveToMonitor(WindowTitle, MonitorNumber)
        Sleep 500
    }

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    if (side = "L") {
        if !(x <= 0 && w < 1600) {
            SendInput "{LWin down}{Left}{LWin up}"
        }
    }
    else if (side = "R") {
        if !(x > 1525 && w < 400) {
            SendInput "{LWin down}{Right}{LWin up}"
        }
    }
    Sleep 500

    WinGetPos(&x, &y, &w, &h, WindowTitle)
    Click x + (w // 2), y + (h // 2)
    Sleep 500

    AdjustWindowSize(WindowTitle, side, rercent)

    return true
}

AdjustWindowSize(WindowTitle, side, rercent) {
    tolerance := 5

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    currentMonitor := WindowGetMonitor(WindowTitle)
    MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)
    monitorWidth := right - left

    currentPercent := (w / monitorWidth) * 100

    if (Abs(currentPercent - rercent) > tolerance) {
        ResizeWindowToTargetPercent(WindowTitle, side, rercent, monitorWidth)
    }
}

ResizeWindowToTargetPercent(WindowTitle, side, rercent, monitorWidth) {
    targetWidth := monitorWidth * (rercent / 100)

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    if (side = "L") {
        newX := x
        newY := y
        newW := targetWidth
        newH := h
    } else {
        newX := (x + w) - targetWidth
        newY := y
        newW := targetWidth
        newH := h
    }

    WinMove(newX, newY, newW, newH, WindowTitle)
}

; WindowMoveToMonitorArea(Remote_Title, 2, "R_20")
; WindowMoveToMonitorArea("ahk_exe chrome.exe", 2, "L_80")
