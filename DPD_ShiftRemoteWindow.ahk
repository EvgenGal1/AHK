CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

WinActivate("ahk_exe " Remote_App ".exe")
Sleep 500

Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_ShowY
Sleep 500
if WinExist("ahk_class" Remote_WindowWrapper_Class) {
    Click Remote_WindowWrapper_ShowX, Remote_WindowWrapper_Click_WindowMaxY, 2
    Sleep 500
}

WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2 + 5, A_ScreenHeight - 32, "ahk_exe " Remote_App ".exe"
)
Sleep 500

Click Remote_Click_VhodSmsX, Remote_Click_VhodSmsY
Sleep 500
Click Remote_TrackingSmsX, Remote_TrackingSmsY

Run(Remote_DF_ReturnToRemote)

^+q:: ExitApp
ExitApp()