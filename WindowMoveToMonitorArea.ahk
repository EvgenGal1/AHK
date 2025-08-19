#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\WindowGetMonitor.ahk"
#Include "D:\Про\Творения\AHK\WindowMoveToMonitor.ahk"
#Include "D:\Про\Творения\AHK\DPD_ExitRemoteFullScreen.ahk"

WindowMoveToMonitorArea(WindowTitle, MonitorNumber, Position) {
    MonitorCount := MonitorGetCount()
    if (MonitorNumber > MonitorCount || MonitorNumber < 1) {
        MonitorNumber := 1
    }

    WinActivate(WindowTitle)
    Sleep 500

    if (InStr(WindowTitle, Remote_Title)) {
        ExitRemoteFullScreen()
    }

    if (MonitorCount > 1) {
        WindowMoveToMonitor(WindowTitle, MonitorNumber)
    }

    WinActivate(WindowTitle)
    Sleep 500

    if (Position = "M") {
        SendInput "{LWin down}{Up}{LWin up}"
    }
    else {
        parts := StrSplit(Position, "_")
        side := parts[1]
        percent := parts[2]

        SnapWindowToSide(WindowTitle, side, percent)
        Sleep 500

        WinGetPos(&x, &y, &w, &h, WindowTitle)
        Click x + (w // 2), y + (h // 2)
        Sleep 500

        AdjustWindowSize(WindowTitle, side, percent)

    }
    return true
}

MaximizeWindow(WindowTitle) {
    SendInput "{LWin down}{Up}{LWin up}"
    Sleep 500
}

SnapWindowToSide(WindowTitle, side, percent) {
    WinGetPos(&x, &y, &w, &h, WindowTitle)

    currentMonitor := WindowGetMonitor(WindowTitle)
    MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)

    WinActivate(WindowTitle)
    Sleep 500

    if (side = "L") {
        if (x <= 0 && y <= 0) {
            if (h < bottom) {
                SendInput "{LWin down}"
                SendInput "{Up}"
                Sleep 500
                SendInput "{Left}"
                SendInput "{LWin up}"
                Sleep 500
                SendInput "{LWin down}{Left}{LWin up}"
            }
            else if (w > right) {
                SendInput "{LWin down}{Left}{LWin up}"
                Sleep 500
                SendInput "{LWin down}{Left}{LWin up}"
            }
            else if (Abs((((w / right) * 100) - percent)) > 10) {
                Sleep 500
                WinActivate(WindowTitle)
                SendInput "{LWin down}"
                SendInput "{Up}"
                Sleep 500
                SendInput "{Down}"
                SendInput "{LWin up}"
            }
        } else {
            SendInput "{LWin down}{Left}{LWin up}"
        }
    } else if (side = "R") {
        MonitorGetWorkArea(WindowGetMonitor(WindowTitle), &left, &top, &right, &bottom)
        if !(x >= (right - 400) && w < 800) {
            SendInput "{LWin down}{Right}{LWin up}"
        }
    }
}

AdjustWindowSize(WindowTitle, side, percent) {

    tolerance := 5

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    currentMonitor := WindowGetMonitor(WindowTitle)
    MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)
    monitorWidth := right - left

    currentPercent := (w / monitorWidth) * 100

    if (Abs(currentPercent - percent) > tolerance) {
        ResizeWindowToTargetPercent(WindowTitle, side, percent, monitorWidth)
    }
}

ResizeWindowToTargetPercent(WindowTitle, side, percent, monitorWidth) {
    targetWidth := monitorWidth * (percent / 100)

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

^+q:: ExitApp