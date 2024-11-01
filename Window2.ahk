; переменные Exe приложений
WindowVSCExe := "Code.exe"
WindowBrowserExe := "chrome.exe"

; кол-во мониторов
MonitorCount := MonitorGetCount()

; на 1-ом мониторе
if (MonitorCount > 1) {
	Monitor := SysGet(1)  ; инфо 1-го монитора
	
	; проверка приложения
	if WinExist("ahk_exe " WindowBrowserExe) {
		WinWait("ahk_exe " WindowBrowserExe)			; ожидает приложения
		WinActivate("ahk_exe " WindowBrowserExe)		; актвирует окно приложения
		WinMove(-1920, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowBrowserExe)		; откр.в раб.область на 1-ом мониторе
	}
	Sleep 250
}

if (MonitorCount > 1) {
	Monitor := SysGet(2)
	
	if WinExist("ahk_exe " WindowVSCExe) {
		WinWait("ahk_exe " WindowVSCExe)
		WinActivate("ahk_exe " WindowVSCExe)
		WinMove(0, 0, A_ScreenWidth, A_ScreenHeight - 40, "ahk_exe " WindowVSCExe)				; откр.в раб.область на 2-ом мониторе
	}
}