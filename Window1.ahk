#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

if WinExist("ahk_exe" WindowVSCExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowVSCExe, 1, "M")
}
if WinExist("ahk_exe" WindowASExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowASExe, 1, "M")
}
Sleep 250

if WinExist("ahk_exe " WindowRemoteExe) {
    WindowMoveToMonitorArea(Remote_Title, 1, "B_40")
}
Sleep 250

if WinExist("ahk_exe " WindowBrowserExe) {
    WindowMoveToMonitorArea("ahk_exe " WindowBrowserExe, 2, "M")
}

ExitApp()