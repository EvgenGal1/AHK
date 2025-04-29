#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

WinActivate("ahk_exe " Remote_App ".exe")
Sleep 500

Click 1000, 0
Sleep 500
Click 1000, 15, 2
Sleep 500

WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2 + 5, A_ScreenHeight - 32, "ahk_exe " Remote_App ".exe"
)
Sleep 500

Click 240, 260
Sleep 500

Run(pathScriptReturnToRemote)

^+q:: ExitApp
ExitApp()