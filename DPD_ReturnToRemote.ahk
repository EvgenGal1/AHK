#Requires AutoHotkey v2.0

CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

CheckForChanges() {
    if !CheckColor() {
        Click Remote_TrackingSmsX, Remote_TrackingSmsY

        SetTimer(CheckForChanges, 0)

        Run(Audio_DF_Start)

        WinActivate(Remote_Title)
        Sleep 500

        SendInput "{LWin down}"
        SendInput "{Up}"
        Sleep 50
        SendInput "{Up}"
        SendInput "{LWin up}"

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