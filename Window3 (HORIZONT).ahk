; переменные Exe приложений
#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; на 1-ом мониторе
if (MonitorCount > 1) {
    Monitor := SysGet(1)  ; инфо 1-го монитора

    ; проверка приложения
    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)			; ожидает приложения
        WinActivate("ahk_exe " WindowBrowserExe)			; актвирует окно приложения
        WinMove(-1920, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на 1-ом мониторе
    }
    Sleep 250
}

if (MonitorCount > 1) {
    Monitor := SysGet(2)

    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)
        WinActivate("ahk_exe " WindowVSCExe)
        WinMove(0, 0, A_ScreenWidth * 0.8, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)		; откр.в раб.область на 2-ом мониторе на 80% с ЛЕВО
    }
    Sleep 250

    ; 391 1047   375 1008 ; с рамкой
    ; 384 1040   384 1040 ; без рамки
    ; WinSetRegion  -  Изменяет форму указанного окна на указанный прямоугольник, эллипс или многоугольник.
    ; WinRedraw  -  Перерисовывает указанное окно.
    ; WinGetStyle / WinGetExStyle  -  Возвращает стиль или расширенный стиль (соответственно) указанного окна.
    ; WinSetStyle / WinSetExStyle  -  Изменяет стиль или расширенный стиль указанного окна соответственно.
    ; Стили окон и элементов управления  -  https://www.autohotkey.com/docs/v2/misc/Styles.htm
    if WinExist("ahk_exe " WindowRemoteExe) {
        WinWait("ahk_exe " WindowRemoteExe)
        WinActivate("ahk_exe " WindowRemoteExe)
        WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2, A_ScreenHeight - 40, "ahk_exe " WindowRemoteExe
        )		; откр.в раб.область на 2-ом мониторе на 20% с ПРАВО
    }
    Sleep 250
}

ExitApp()