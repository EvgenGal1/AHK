#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

CheckColor() {
    originalMode := A_CoordModePixel

    CoordMode("Pixel", "Screen")

    if !WinExist(Remote_Title) {
        CoordMode("Pixel", originalMode)
        return true
    }

    WinGetPos(&winX, &winY, &winW, &winH, Remote_Title)

    absoluteX := winX + Remote_Clt_TrackingSmsX
    absoluteY := winY + Remote_Clt_TrackingSmsY

    currentColor := Format("{:X}", PixelGetColor(absoluteX, absoluteY, "RGB"))

    CoordMode("Pixel", originalMode)

    return allowedColors.Has(currentColor)
}
