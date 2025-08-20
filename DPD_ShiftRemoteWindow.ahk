#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\DPD_ExitRemoteFullScreen.ahk"

WinActivate(Remote_Title)
Sleep 500

ExitRemoteFullScreen()

WinActivate(Remote_Title)
Sleep 500

WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2 + 5, A_ScreenHeight - 32, Remote_Title)
Sleep 500

Run(Remote_DF_ReturnToRemote)

ExitApp()