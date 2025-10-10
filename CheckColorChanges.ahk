#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

; fn > проверки цвета в конкретном окне
CheckColor() {
    ; сохр.текущий режим
    originalMode := A_CoordModePixel
    ; использ.режим Screen, но вычисления по абсолют.координатам
    CoordMode("Pixel", "Screen")
    ; получить позицию окна
    if !WinExist("ahk_exe " WindowRemoteExe) {
        CoordMode("Pixel", originalMode)
        ; окно не найдено - не срабатывать ложно
        return true
    }
    WinGetPos(&winX, &winY, &winW, &winH, "ahk_exe " WindowRemoteExe)
    ; вычислить абсолют.коорд.тчк.отслеживания
    absoluteX := winX + Remote_Clt_TrackingSmsX
    absoluteY := winY + Remote_Clt_TrackingSmsY
    ; получить цвет по абсолют.координатам
    currentColor := Format("{:X}", PixelGetColor(absoluteX, absoluteY, "RGB"))
    ; восстанав.оригинальный режим
    CoordMode("Pixel", originalMode)
    ; проверка цвета
    return allowedColors.Has(currentColor)
}
