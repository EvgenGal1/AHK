#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

CoordMode("Pixel", "Window")
CoordMode("Mouse", "Window")

RunApp(targetApp) {
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

        WinActivate("ahk_exe " %targetApp% ".exe")
        Sleep 1500
    }
}

RunHandler(targetHandler) {
    if (targetHandler = "VPN") {
        if WinExist(VPN_AuthTitle) {
            RunHandler("VPN_auth")
        }

        WinActivate("ahk_exe " %targetHandler% ".exe")
        Sleep 1500
        Click VPN_Click_ConnectX, VPN_Click_ConnectY
        Sleep 3000
    }
    else if (targetHandler = "VPN_auth") {
        RunHandler("SMS")

        WinActivate VPN_AuthTitle
        Sleep 1500

        Click VPN_Click_AuthX VPN_Click_AuthY
        Sleep 1500
        Send "^v"
        Sleep 1500
        Send "{Enter}"
        Sleep 10000

        if VPN_WarnsMap.Has(WinGetTitle("A")) {
            RunHandler("VPN_warn")
        }

        RunHandler("Remote_App")
        Run Meseng_App
        ExitApp()
    }
    else if (targetHandler = "SMS") {
        WinMaximize("ahk_exe " %targetHandler% ".exe")

        Run SMS_Bot
        Sleep 5000

        Click SMS_Click_DownX, SMS_Click_DownY
        Sleep 2000
        Click SMS_Click_DownX, SMS_Click_DownY
        Sleep 2000

        Click SMS_Click_CopyX, SMS_Click_CopyY, 2
        Sleep 1500
        Send "^c"
        Sleep 1500
    }
    else if (targetHandler = "VPN_dop") {
        if WinExist(VPN_AuthTitle) {
            WinActivate VPN_AuthTitle
            Sleep 1500
            Send "!{F4}"
            Sleep 1500
        }

        WinActivate("ahk_exe " VPN ".exe")
        Sleep 1500

        Click VPN_Click_InputPasteX, VPN_Click_InputPasteY
        Sleep 1500
        Send "^v"
        Sleep 1500
        Send "{Enter}"
        Sleep 10000

        if VPN_WarnsMap.Has(WinGetTitle("A")) {
            RunHandler("VPN_warn")
        }
    }
    else if (targetHandler = "VPN_warn") {
        Send "{Enter}"
        Sleep 1500

        RunHandler("VPN")
        Sleep 3000
        RunHandler("SMS")
        RunHandler("VPN_dop")
    }
    else if (targetHandler = "Remote_App") {
        Run Remote_App
        Sleep 2000

        Click Remote_Click_PasteX, Remote_Click_PasteY
        Sleep 1500
        Click Remote_Click_PasteX, Remote_Click_PasteY, 2
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

Run Voise_Bot

ExitApp()