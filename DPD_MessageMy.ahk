#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

MessageMy() {
    if WinExist(Remote_Title) {
        WinActivate(Remote_Title)

        Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_ShowY
        Sleep 500

        if WinExist("ahk_class " Remote_WindowWrapper_Class) {
            Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_Click_WindowMaxY, 2

            WinMaximize(Remote_Title)
        }

        SendInput "^{F8}"
    }
    ExitApp
}

if (A_LineFile = A_ScriptFullPath) {
    MessageMy()
}
