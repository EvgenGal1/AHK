CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

SetTimer(CheckForChanges, checkInterval)

CheckForChanges() {
    global aimpScriptPath, remoteWindowTitle, defaultColor, trackingX, trackingY, windowMaxX, windowMaxY

    if WinExist(remoteWindowTitle) {
        currentColor := Format("{:X}", PixelGetColor(trackingX, trackingY, "RGB"))

        if (Format("{:X}", defaultColor) != currentColor) {
            Click trackingX, trackingY

            SetTimer(CheckForChanges, 0)

            Run(aimpScriptPath)

            WinActivate(remoteWindowTitle)
            Click windowMaxX, windowMaxY

            ExitApp
        }
    }
}

^+e:: SetTimer(CheckForChanges, checkInterval)
^+d:: SetTimer(CheckForChanges, 0)
^+a:: ProcessClose("AIMP.exe")
^+q:: ExitApp