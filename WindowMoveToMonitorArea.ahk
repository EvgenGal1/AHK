#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowGetMonitor.ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitor.ahk"
#Include "D:\Pro\Projects\AHK\DPD_ExitRemoteFullScreen.ahk"

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
        WinActivate(WindowTitle)
        Sleep 500
        Click (w // 2), (h // 2)
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
    }
    else if (side = "R") {
        MonitorGetWorkArea(WindowGetMonitor(WindowTitle), &left, &top, &right, &bottom)
        if !(x >= (right - 400) && w < 800) {
            SendInput "{LWin down}{Right}{LWin up}"
        }
    }
    else if (side = "B") {
        monitorHeight := bottom - top
        monitorWidth := right - left

        WinActivate(WindowTitle)
        Sleep 300

        SendInput "{LWin down}{Down}{LWin up}"
        Sleep 500

        WinGetPos(&x, &y, &w, &h, WindowTitle)

        newX := left
        newY := y
        newW := monitorWidth
        newH := h

        WinMove(newX, newY, newW, newH, WindowTitle)
    }
}

AdjustWindowSize(WindowTitle, side, percent) {
    tolerance := 5
    WinGetPos(&x, &y, &w, &h, WindowTitle)

    currentMonitor := WindowGetMonitor(WindowTitle)
    MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)
    monitorWidth := right - left
    monitorHeight := bottom - top

    if (side = "B") {
        currentPercent := (h / monitorHeight) * 100
    }
    else if (side = "R") OR (side = "L") {
        currentPercent := (w / monitorWidth) * 100
    }

    if (Abs(currentPercent - percent) > tolerance) {
        ResizeWindowToTargetPercent(WindowTitle, side, percent, monitorWidth, monitorHeight)
    }

    if (side = "B") {
        MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)
        monitorWidth := right - left
        if (w < monitorWidth - 10) {
            WinMove(left, y, monitorWidth, h, WindowTitle)
        }
    }
}

ResizeWindowToTargetPercent(WindowTitle, side, percent, monitorWidth, monitorHeight) {
    targetWidth := monitorWidth * (percent / 100)
    targetHeight := monitorHeight * (percent / 100)

    WinGetPos(&x, &y, &w, &h, WindowTitle)

    if (side = "L") {
        newX := x
        newY := y
        newW := targetWidth
        newH := h
    }
    else if (side = "R") {
        newX := (x + w) - targetWidth
        newY := y
        newW := targetWidth
        newH := h
    }
    else if (side = "B") {
        currentMonitor := WindowGetMonitor(WindowTitle)
        MonitorGetWorkArea(currentMonitor, &left, &top, &right, &bottom)

        newX := left
        newY := bottom - Integer(targetHeight)
        newW := monitorWidth
        newH := Integer(targetHeight)

        WinMove(newX, newY, newW, newH, WindowTitle)

        clickX := Integer(newW // 2)
        clickY := Integer(newH // 2) + (newH // 4)
        Click(clickX, clickY)
    }
    WinMove(newX, newY, newW, newH, WindowTitle)
}
