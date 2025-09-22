; переменные Exe приложений
#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; ноут
if (MonitorCount > 1) {
    Monitor := SysGet(1)  ; инфо 1-го монитора

    ; проверка приложения
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)			; ожидает приложения
        WinActivate("ahk_exe " WindowVSCExe)			; актвирует окно приложения
        WinMove(0, 1080, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)		; откр.в раб.область на Ноуте
    }
    Sleep 250
}

; экран
if (MonitorCount > 1) {
    Monitor := SysGet(2)  ; инфо 2-го монитора

    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)
        WinActivate("ahk_exe " WindowBrowserExe)
        WinMove(0, 0, A_ScreenWidth * 0.8, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на Экране на 80% с ЛЕВО
    }
    Sleep 250

    if WinExist("ahk_exe " WindowRemoteExe) {
        WinWait("ahk_exe " WindowRemoteExe)
        WinActivate("ahk_exe " WindowRemoteExe)
        WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2, A_ScreenHeight - 40, "ahk_exe " WindowRemoteExe
        )		; откр.в раб.область на Экране на 20% с ПРАВО
    }
}

ExitApp()