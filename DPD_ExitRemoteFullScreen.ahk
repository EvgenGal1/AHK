#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

; выход из полноэкранного режима обёртки удалёнки
ExitRemoteFullScreen() {
    if WinExist("ahk_exe " WindowRemoteExe) {
        ; активация окна удалёнки
        WinActivate("ahk_exe " WindowRemoteExe)
        Sleep 500
        ; получитьаем ширину окна
        WinGetPos(, , &w, , "ahk_exe " WindowRemoteExe)
        ; е/и окно большое (полноэкранное) - сворачиваем
        if (w > 1000) {
            ; наводка/клик на кнопку сворачивания в обёртке
            Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_ShowY
            Sleep 1000
            ; е/и обёртка скрыта и есть Bar, 2 клик по обёртке для сворачивания
            if WinExist("ahk_class " Remote_WindowWrapper_Class) {
                Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_Click_WindowMaxY, 2
                Sleep 500
            }
        }
    }
}
