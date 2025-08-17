#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\WindowMoveToMonitorArea.ahk"

WindowMoveToMonitorArea(Remote_Title, 2, "R_20")

WindowMoveToMonitorArea("ahk_exe chrome.exe", 2, "L_80")
Sleep 500

Run(Remote_DF_ReturnToRemote)

^+q:: ExitApp
ExitApp()