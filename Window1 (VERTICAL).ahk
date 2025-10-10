; При ВЕРТИКАЛЬНОМ располож.мониторов - 1(экран сверху), 2(ноут снизу)

; схемы разворачивания окон (скрипт/аудио)
; "Window1" | "окнаРаз" : браузер - верх(монитор), остальное низ(ноут)
; "Window2" | "окнаДва" : VSCode - верх, браузер низ
; "Window3" | "окнаТри" : браузер - верх лево 80%, удал-ка - верх право 20%, VSCode - низ
; "Window4" | "окнаЧетыри" : VSCode - верх лево 80%, удал-ка - верх право 20%, браузер - низ

; переменные Exe приложений
#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; ноут
if (MonitorCount > 1) {
    ; инфо 1-го монитора
    Monitor := SysGet(1)

    ; проверка приложения
    if WinExist("ahk_exe " WindowVSCExe) {
        ; ожидает приложения
        WinWait("ahk_exe " WindowVSCExe)
        ; актвирует окно приложения
        WinActivate("ahk_exe " WindowVSCExe)
        ; WinMaximize("ahk_exe" WindowVSCExe)		; откр.макс.на активном мониторе окна
        ; WinRestore("ahk_exe" WindowVSCExe)		; разворач.из свёрнутого режика до старых размеров
        ; откр.в раб.область на 1-ом мониторе
        WinMove(0, 1080, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)
    }
    Sleep 250
}

; экран
if (MonitorCount > 1) {
    ; инфо 2-го монитора
    Monitor := SysGet(2)

    if WinExist("ahk_exe " BrowserChromeExe) {
        WinWait("ahk_exe " BrowserChromeExe)
        WinActivate("ahk_exe " BrowserChromeExe)
        ; откр.в раб.область на 2-ом мониторе
        WinMove(0, 0, A_ScreenWidth + 100, A_ScreenHeight - 40, "ahk_exe " BrowserChromeExe)
    }
}

ExitApp()