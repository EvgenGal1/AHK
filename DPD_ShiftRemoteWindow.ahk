#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\DPD_ExitRemoteFullScreen.ahk"

WinActivate("ahk_exe " WindowRemoteExe)
Sleep 500

ExitRemoteFullScreen()

WinActivate("ahk_exe " WindowRemoteExe)
Sleep 500

WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2 + 5, A_ScreenHeight - 32, "ahk_exe " WindowRemoteExe
)
Sleep 500

Run(Remote_DF_ReturnToRemote)

ExitApp()