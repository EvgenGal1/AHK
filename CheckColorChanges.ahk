#Requires AutoHotkey v2.0

CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

WinActivate("ahk_exe " Remote_App ".exe")
Sleep 500

CheckColor() {
    currentColor := Format("{:X}", PixelGetColor(Remote_TrackingSmsX, Remote_TrackingSmsY, "RGB"))

    return allowedColors.Has(currentColor)
}
