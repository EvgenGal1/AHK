#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\WindowMoveToMonitorArea.ahk"

WindowMoveToMonitorArea("ahk_exe " WindowBrowserExe, 1, "M")
Sleep 250

WindowMoveToMonitorArea(Remote_Title, 2, "R_20")
Sleep 250

WindowMoveToMonitorArea("ahk_exe " WindowVSCExe, 2, "L_80")

ExitApp()