#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\DPD_ExitRemoteFullScreen.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

SendMessage() {
    if WinExist(Remote_Title) {
        WinActivate(Remote_Title)
        Sleep 500

        ExitRemoteFullScreen()
        Sleep 500

        WinMaximize(Remote_Title)
        Sleep 500

        Click Remote_TrackingSmsX, Remote_TrackingSmsY, "Right"
        Sleep 500

        Click Remote_TrackingSmsX + 15, Remote_TrackingSmsY + 15, 2
        Sleep 500

        SendInput "^n"
        Sleep 500

        SendText MyMail
        SendInput "{Enter}"
        Sleep 500

        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"

        SendInput "тест"
        Sleep 500

        SendInput "{Tab}"
        Sleep 500

        SendInput "^v"
        Sleep 2000

        SendInput "^a"
        SendInput "{Delete}"

        SendInput "^{Enter}"
        Sleep 500

        SendInput "^{Enter}"
        Sleep 500

        ExitApp
    }
}

^+q:: ExitApp