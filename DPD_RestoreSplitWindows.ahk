#Requires AutoHotkey v2.0

; #Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\WindowMoveToMonitorArea.ahk"

; на мониторе 2 прижать в право на 20%
WindowMoveToMonitorArea(Remote_Title, 2, "R_20")

; TM("перед CHROME")

; на мониторе 2 прижать в лево на 80%
WindowMoveToMonitorArea("ahk_exe chrome.exe", 2, "L_80")
Sleep 500

; TM("перед Remote_DF_ReturnToRemote")

Run(Remote_DF_ReturnToRemote)

; ^+q:: ExitApp
ExitApp()