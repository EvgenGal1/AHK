CoordMode("Pixel", "Window")
CoordMode("Mouse", "Window")

#Include "D:\Про\Творения\AHK\AutoStartDPD [VAR].ahk"

RunApp(targetApp) {
    global VPN_App, SMS_App
	
    runTargetApp := ""

    if (targetApp = "VPN") {
        runTargetApp := VPN_App
    }
    else if (targetApp = "SMS") {
        runTargetApp := SMS_App
    }
	
    if !WinExist("ahk_exe " %targetApp% ".exe") {
        Run runTargetApp
        Sleep 4000
    }

    WinActivate("ahk_exe " %targetApp% ".exe")
    Sleep 1500
}

RunHandler(targetHandler) {	
    if (targetHandler = "VPN") {
        if WinExist(VPN_AuthTitle) {
			WinActivate VPN_AuthTitle
			Sleep 1500
            Send "!{F4}"
            Sleep 1500
        }
		
        WinActivate("ahk_exe " %targetHandler% ".exe")
        Sleep 1500
		
        Click VPN_ClickX, VPN_ClickY
        Sleep 1000
        Click VPN_ClickNextX, VPN_ClickNextY
        Sleep 1000
    }
    else if (targetHandler = "SMS") {
	    WinMaximize("ahk_exe " %targetHandler% ".exe")
		
        Run SMS_Bot
        Sleep 5000
		
        Click SMS_ClickX, SMS_ClickY
        Sleep 2000
        Click SMS_ClickX, SMS_ClickY
        Sleep 2000
		
        Click SMS_ClickNextX, SMS_ClickNextY, 2
        Sleep 1500
        Send "^c"
        Sleep 1500
    }
    else if (targetHandler = "VPN_dop") {
        Click VPN_ClickConfirmX, VPN_ClickConfirmY
        Sleep 1500
        Send "^v"
        Sleep 1500
        Send "{Enter}"
        Sleep 10000
    }
    else if (targetHandler = "Remote_App") {
        Run Remote_App
        Sleep 2000
		
        Click Remate_ClickX, Remate_ClickY, 2
        Sleep 1500
		
        SendInput Remote_Name
        Sleep 1000
        Send "{Enter}"
    }
}

if WinExist("ahk_exe " VPN ".exe") {
    while ProcessExist(VPN ".exe")
        ProcessClose(VPN ".exe")
    Sleep 1500
}

RunApp("VPN")
RunHandler("VPN")

RunApp("SMS")
RunHandler("SMS")

RunApp("VPN")
RunHandler("VPN_dop")

RunHandler("Remote_App")

Run Meseng_App

^+q:: ExitApp
ExitApp()