#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

WindowMoveToMonitorArea("ahk_exe " WindowBrowserExe, 1, "M")
Sleep 250

WindowMoveToMonitorArea(Remote_Title, 2, "R_20")
Sleep 250

WindowMoveToMonitorArea("ahk_exe " WindowVSCExe, 2, "L_80")

ExitApp()