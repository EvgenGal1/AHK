; переменные Exe приложений
#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; на 1-ом мониторе
if (MonitorCount > 1) {
    Monitor := SysGet(1)  ; инфо 1-го монитора

    ; проверка приложения
    if WinExist("ahk_exe " WindowVSCExe) {
        WinWait("ahk_exe " WindowVSCExe)			; ожидает приложения
        WinActivate("ahk_exe " WindowVSCExe)		; актвирует окно приложения
        WinMove(-1920, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)		; откр.в раб.область на 1-ом мониторе
    }
    Sleep 250
}

if (MonitorCount > 1) {
    Monitor := SysGet(2)

    if WinExist("ahk_exe " WindowBrowserExe) {
        WinWait("ahk_exe " WindowBrowserExe)
        WinActivate("ahk_exe " WindowBrowserExe)
        WinMove(0, 0, A_ScreenWidth * 0.8, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на 2-ом мониторе на 80% с ЛЕВО
    }
    Sleep 250

    if WinExist("ahk_exe " WindowRemoteExe) {
        WinWait("ahk_exe " WindowRemoteExe)
        WinActivate("ahk_exe " WindowRemoteExe)
        WinMove(A_ScreenWidth - (A_ScreenWidth * 0.2), 0, A_ScreenWidth * 0.2, A_ScreenHeight - 40, "ahk_exe " WindowRemoteExe
        )		; откр.в раб.область на 2-ом мониторе на 20% с ПРАВО
    }
    Sleep 250
}

ExitApp()