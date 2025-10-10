#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

if WinExist("ahk_exe " WindowRemoteExe) {
    ; на мониторе 2 прижать в право на 20%
    WindowMoveToMonitorArea("ahk_exe " WindowRemoteExe, 2, "R_20")
    Sleep 500
}

if WinExist("ahk_exe " BrowserChromeExe) {
    ; на мониторе 2 прижать в лево на 80%
    WindowMoveToMonitorArea("ahk_exe " BrowserChromeExe, 2, "L_80")
    Sleep 500
}

Run(Remote_DF_ReturnToRemote)

ExitApp()