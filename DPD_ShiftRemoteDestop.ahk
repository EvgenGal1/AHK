#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowManager.ahk"

; отдельн.конфиг.окна удалёнки и передача в логику перемещения
myConfig := [{ exe: WindowRemoteExe, monitor: 2, area: "R_20" }]
WindowManager.MoveWindows(myConfig)

; запуск отслеживания для возврата на удалёнку
Run(CheckAndOpenRemoteDesktop)

; сброс кода, завершение скрипта
ExitApp()