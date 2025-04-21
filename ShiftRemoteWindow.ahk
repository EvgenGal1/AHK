WinWait("ahk_exe " "mstsc.exe")
WinActivate("ahk_exe " "mstsc.exe")
WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2 + 5, A_ScreenHeight - 32, "ahk_exe " "mstsc.exe")