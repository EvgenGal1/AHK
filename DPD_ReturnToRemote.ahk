#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\CheckColorChanges.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

; fn `проверить наличия изменений` цвета в координатах
CheckForChanges() {
    ; е/и не прошла проверка цвет БЕЗ активации окна
    if !CheckColor() {
        ; блокировка мыши/клавиатуры от лишних операций
        BlockInput(true)

        ; останка цикла проверки изменений цвета
        SetTimer(CheckForChanges, 0)

        ; запуск AIMP оповещения без ожидания завершения скрипта
        Run(Audio_DF_Start)

        ; активация окна удалёнки
        WinActivate("ahk_exe " WindowRemoteExe)
        Sleep 500

        ; клик на первое смс (для прогрузки 1-го смс)
        Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY

        ; клик по раскрытию окна (откл.от ложн.срабатываний)
        ; WinMaximize("ahk_exe " WindowRemoteExe)

        ; раскрытие окна удалёнки (2р. т.к.  раб.ч/з четвердь-полное)
        SendInput "{LWin down}"
        SendInput "{Up}"
        Sleep 100
        SendInput "{Up}"
        SendInput "{LWin up}"

        ; активация окна удалёнки на случай всплывшего AIMP
        WinActivate("ahk_exe " WindowRemoteExe)
        Sleep 500

        ; ; клик в центр окна (вроде не нужно)
        ; WinGetPos(&x, &y, &w, &h, Remote_Title)
        ; Click x + (w // 2), y + (h // 2)
        ; Sleep 500

        ; клик на первое смс
        Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY
        Sleep 500

        ; разблокировка ввода перед ExitApp
        BlockInput(false)

        ; выход из скрипта
        ExitApp
    }

}

; проверка существование окна удалёнки по EXE. Либо ч/з - if (PID := ProcessExist("mstsc.exe"))
if WinExist("ahk_exe " WindowRemoteExe) {
    WinActivate("ahk_exe " WindowRemoteExe)
    Sleep 500

    ; клик на входящее смс
    Click Remote_Click_Clt_VhodSmsX, Remote_Click_Clt_VhodSmsY
    Sleep 500

    ; клик на первое смс
    Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY
    Sleep 500

    ; цикл прокрутки вверх
    loop 30
        MouseClick "WheelUp"
    Sleep 1000

    Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY
    Sleep 500

    ; запуск отслеживания
    SetTimer(CheckForChanges, checkInterval)
}

^+e:: SetTimer(CheckForChanges, checkInterval) 		; Ctrl Shift E  >>  старт
^+d:: SetTimer(CheckForChanges, 0) 		; Ctrl Shift D  >>  пауза
^+a:: ProcessClose("AIMP.exe") 		; Ctrl Shift A  >>  закрыть AIMP
