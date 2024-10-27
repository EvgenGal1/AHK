; #Persistent  ; Держит скрипт запущенным

; переменные: пути/приложения/файлы
trackPath := "D:\Музон\Моё\MINI_Beethoven-Symphony№5.mp3"
AIMP := "C:\Program Files (x86)\AIMP\AIMP.exe"
targerString :="MINI_Beethoven-Symphony№5"

; Запуск AIMP с заданным треком ч/з разделение перем.пробелом / ждать 0.5 сек.
Run(AIMP ' ' trackPath)
Sleep 500

; проверка раб.AIMP
; WinWait("AIMP")  ||  WinActivate("AIMP.exe")  ||  if WinExist(trackPath) ; не раб е/и окно скрыто и/или не активно
if (PID := ProcessExist("AIMP.exe")) ; условие по процессу
{
	; ожидание проверки процесса
	Sleep 1000
		
	; востановить AIMP из свернутого режима
    if WinExist(AIMP)
		WinActivate
    else
    {
		; ожидание активации 5 сек.
		Sleep 5000
		
		; перезапуск AIMP для вывода из свёрнутого режива
		Run(AIMP)
		
		SoundSetVolume(100) ; Общий звук на 100
		; SoundSetVolume("100", , AIMP) 						; не раб.с AIPM. 
		; Send "^+{Up}" ; глобал.клвш.AIMP Ctrl Shift Up		; не раб.с AIMP
		; SoundSetMute(true, , "AIMP") ; откл.звук				; не раб.с AIMP
    }
	
	; задержка для активации AIMP
	Sleep 1000 
	
	; TITLE по PID процесса
    windowTitle := WinGetTitle("ahk_pid " PID)
	
	; проверка совпадения TITLE с назв.трека
	if !InStr(windowTitle, targerString)
	{	
		; активация необходимого трека
		Run(AIMP ' ' trackPath)
		Sleep 500
				
		; ВКЛ.повтор трека в AIMP (ч/з мкд. горячих клавиш)
		; Send "{r}" ; локал.клвш.вкл.повтор  >>  R (не раб.без активного окна)
		; Send("{Shift Ctrl r}") или Send("{Shift Ctrl R}") ; не раб
		Send "+^r" ; глобал.клвш.вкл.повтор  >>  Shift + Ctrl + R
	}
}

; ^+s::RunWait(scriptTrack) 		;  Ctrl Shift S  >>  перезапустить скрипт трека с ожидание выполнения
^+a::ProcessClose("AIMP.exe") 		;  Ctrl Shift A  >>  закрыть AIMP
^q::ExitApp							; Ctrl Q  >>  завершит скрипт
; ProcessClose("AIMP.exe")
ExitApp()