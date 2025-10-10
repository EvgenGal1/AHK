#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\DPD_MessageSend.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

TopMessage() {
    if WinExist("ahk_exe " WindowRemoteExe) {
        WinActivate("ahk_exe " WindowRemoteExe)
        Sleep 500

        Click Remote_Click_Clt_VhodSmsX, Remote_Click_Clt_VhodSmsY
        Sleep 500

        Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY
        Sleep 500

        loop 30
            MouseClick "WheelUp"
        Sleep 1000
        Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY
        Sleep 500

        SendMessage()
    }
    ExitApp
}

; е/и внешн.запуск - сравн. путь ф.скрипта и путь ф.исполняемого (...Start.ahk != ...Top.ahk)
if (A_LineFile = A_ScriptFullPath) {
    TopMessage()
}
