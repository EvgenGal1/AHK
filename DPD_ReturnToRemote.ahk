#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\CheckColorChanges.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

CheckForChanges() {
    if !CheckColor() {
        Click Remote_TrackingSmsX, Remote_TrackingSmsY

        SetTimer(CheckForChanges, 0)

        Run(Audio_DF_Start)

        WinActivate(Remote_Title)
        Sleep 500

        SendInput "{LWin down}"
        SendInput "{Up}"
        Sleep 100
        SendInput "{Up}"
        SendInput "{LWin up}"

        WinActivate(Remote_Title)
        Sleep 500

        WinGetPos(&x, &y, &w, &h, Remote_Title)
        Click x + (w // 2), y + (h // 2)
        Sleep 500

        Click Remote_TrackingSmsX, Remote_TrackingSmsY

        ExitApp
    }

}

if WinExist(Remote_Title) {
    Click Remote_Click_VhodSmsX, Remote_Click_VhodSmsY
    Sleep 500

    Click Remote_TrackingSmsX, Remote_TrackingSmsY
    Sleep 500

    loop 30
        MouseClick "WheelUp"
    Sleep 1000
    Click Remote_TrackingSmsX, Remote_TrackingSmsY
    Sleep 500

    SetTimer(CheckForChanges, checkInterval)
}

^+e:: SetTimer(CheckForChanges, checkInterval)
^+d:: SetTimer(CheckForChanges, 0)
^+a:: ProcessClose("AIMP.exe")
^+q:: ExitApp