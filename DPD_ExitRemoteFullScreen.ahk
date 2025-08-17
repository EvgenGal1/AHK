#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

ExitRemoteFullScreen() {
    WinActivate(Remote_Title)
    Sleep 500

    WinGetPos(, , &w, , Remote_Title)

    if (w > 1000) {
        Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_ShowY
        Sleep 500

        if WinExist("ahk_class " Remote_WindowWrapper_Class) {
            Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_Click_WindowMaxY, 2
            Sleep 500
        }
    }
}
