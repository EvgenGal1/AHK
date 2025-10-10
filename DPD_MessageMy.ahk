#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

; fn > бронирования писма за мной
MessageMy() {
    if WinExist("ahk_exe " WindowRemoteExe) {
        WinActivate("ahk_exe " WindowRemoteExe)
        ; наводка/клик на Bar сворачивания в обёртке
        Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_ShowY
        Sleep 500
        ; е/и обёртка скрыта и есть Bar
        if WinExist("ahk_class " Remote_WindowWrapper_Class) {
            ; двойной клик по обёртке для сворачивания
            Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_Click_WindowMaxY, 2
            ; разворачивание окна удалёнки с рамкой чтоб работали команды клавиш
            WinMaximize("ahk_exe " WindowRemoteExe)
        }
        ; комбин.клвш. ctrl+F8 (отметка смс моей категорией цвета)
        SendInput "^{F8}"
    }
    ExitApp
}

if (A_LineFile = A_ScriptFullPath) {
    MessageMy()
}
