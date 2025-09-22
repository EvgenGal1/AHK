; При ГОРИЗОНТАЛЬНОМ располож.мониторов - 1(экран справо), 2(ноут слево)

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

; на 1-ом мониторе
if (MonitorCount > 1) {
    Monitor := SysGet(1)  ; инфо 1-го монитора

    ; проверка приложения
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)			; ожидает приложения
        WinActivate("ahk_exe " WindowVSCExe)		; актвирует окно приложения
        ; WinMaximize("ahk_exe" WindowVSCExe)		; откр.макс.на активном мониторе окна
        ; WinRestore("ahk_exe" WindowVSCExe)		; разворач.из свёрнутого режика до старых размеров
        WinMove(-1920, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)		; откр.в раб.область на 1-ом мониторе
    }
    Sleep 250
}

; на 2-ом мониторе (ноут)
if (MonitorCount > 1) {
    Monitor := SysGet(2)  ; инфо 2-го монитора

    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)
        WinActivate("ahk_exe " WindowBrowserExe)
        WinMove(0, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на 2-ом мониторе
    }
}

ExitApp()