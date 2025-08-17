#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

WinActivate("ahk_exe " Remote_App ".exe")
Sleep 500

CheckColor() {
    currentColor := Format("{:X}", PixelGetColor(Remote_TrackingSmsX, Remote_TrackingSmsY, "RGB"))

    return allowedColors.Has(currentColor)
}
