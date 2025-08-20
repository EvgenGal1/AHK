; При ВЕРТИКАЛЬНОМ располож.мониторов - 1(экран сверху), 2(ноут снизу)

; схемы разворачивания окон (скрипт/аудио)
; "Window1" | "окнаРаз" : браузер - верх(монитор), остальное низ(ноут)
; "Window2" | "окнаДва" : VSCode - верх, браузер низ
; "Window3" | "окнаТри" : VSCode - верх лево 80%, удал-ка - верх право 20%, браузер - низ
; "Window4" | "окнаЧетыри" : браузер - верх лево 80%, удал-ка - верх право 20%, VSCode - низ

; переменные Exe приложений
#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\WindowMoveToMonitorArea.ahk"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; ноут
if (MonitorCount > 1) {
    Monitor := SysGet(1)  ; инфо 1-го монитора

    ; проверка приложения
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)			; ожидает приложения
        WinActivate("ahk_exe " WindowVSCExe)		; актвирует окно приложения
        ; WinMaximize("ahk_exe" WindowVSCExe)		; откр.макс.на активном мониторе окна
        ; WinRestore("ahk_exe" WindowVSCExe)		; разворач.из свёрнутого режика до старых размеров
        WinMove(0, 1080, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)		; откр.в раб.область на 1-ом мониторе
    }
    Sleep 250
}

; экран
if (MonitorCount > 1) {
    Monitor := SysGet(2)  ; инфо 2-го монитора

    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)
        WinActivate("ahk_exe " WindowBrowserExe)
        /* A_ScreenWidth больше чтоб встал по ширине */
        WinMove(0, 0, A_ScreenWidth + 100, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на 2-ом мониторе
    }
}

ExitApp()