CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

SetTimer(CheckForChanges, checkInterval)

CheckForChanges() {
    global Audio_DF_Start, Remote_Title, allowedColors, Remote_TrackingX, Remote_TrackingY, Remote_Click_WindowMaxX,
        Remote_Click_WindowMaxY

    if WinExist(Remote_Title) {
        currentColor := Format("{:X}", PixelGetColor(Remote_TrackingX, Remote_TrackingY, "RGB"))

        if !allowedColors.Has(currentColor) {
            Click Remote_TrackingX, Remote_TrackingY

            SetTimer(CheckForChanges, 0)

            Run(Audio_DF_Start)

            WinActivate(Remote_Title)
            Click Remote_Click_WindowMaxX, Remote_Click_WindowMaxY

            ExitApp
        }
    }
}

^+e:: SetTimer(CheckForChanges, checkInterval)
^+d:: SetTimer(CheckForChanges, 0)
^+a:: ProcessClose("AIMP.exe")
^+q:: ExitApp