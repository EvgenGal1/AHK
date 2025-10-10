#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

MonitorCount := MonitorGetCount()

if (MonitorCount > 1) {
    Monitor := SysGet(1)
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)
        WinActivate("ahk_exe " WindowVSCExe)
        WinMove(-1920, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)
    }
    Sleep 250
}

if (MonitorCount > 1) {
    Monitor := SysGet(2)

    if WinExist("ahk_exe " BrowserChromeExe) {
        WinWait("ahk_exe " BrowserChromeExe)
        WinActivate("ahk_exe " BrowserChromeExe)
        WinMove(0, 0, A_ScreenWidth * 0.8, A_ScreenHeight - 40, "ahk_exe " BrowserChromeExe)
    }
    Sleep 250

    if WinExist("ahk_exe " WindowRemoteExe) {
        WinWait("ahk_exe " WindowRemoteExe)
        WinActivate("ahk_exe " WindowRemoteExe)
        WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2, A_ScreenHeight - 40, "ahk_exe " WindowRemoteExe
        )
    }
    Sleep 250
}

ExitApp()