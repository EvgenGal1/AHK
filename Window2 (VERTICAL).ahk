WindowVSCExe := "Code.exe"
WindowBrowserExe := "chrome.exe"

MonitorCount := MonitorGetCount()

if (MonitorCount > 1) {
    Monitor := SysGet(1)
    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)
        WinActivate("ahk_exe " WindowBrowserExe)
        WinMove(0, 1080, A_ScreenWidth + 100, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)
    }
    Sleep 250
}

if (MonitorCount > 1) {
    Monitor := SysGet(2)
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)
        WinActivate("ahk_exe " WindowVSCExe)
        WinMove(0, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)
    }
}
