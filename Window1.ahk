#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"
#Include "D:\Pro\Projects\AHK\WindowManager.ahk"

; использ.готовый конфиг > окна 1 (мжн.доб.задержку)
WindowManager.MoveWindows(GlobalWindowConfigs["windowParams1"])

; ; отдельн.конфиг. и передача
; myConfig := [{ exe: WindowBrowserExe, monitor: 2, area: "M" }, { exe: WindowVSCExe, monitor: 1, area: "M" }, { exe: WindowASExe,
;     monitor: 1, area: "M" }, { exe: WindowRemoteExe, monitor: 1, area: "B_40" }]
; WindowManager.MoveWindows(myConfig)

ExitApp()