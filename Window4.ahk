#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

if WinExist("ahk_exe " BrowserChromeExe) {
    WindowMoveToMonitorArea("ahk_exe " BrowserChromeExe, 1, "M")
    Sleep 250
}

if WinExist("ahk_exe " WindowRemoteExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowRemoteExe, 2, "R_20")
    Sleep 250
}

if WinExist("ahk_exe" WindowVSCExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowVSCExe, 2, "L_80")
}
if WinExist("ahk_exe" WindowASExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowASExe, 2, "L_80")
}

ExitApp()