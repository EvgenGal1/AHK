; #Persistent  ; Держит скрипт запущенным

; координаты для Pixel и Mouse относительно всего экрана
CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

; переменные: окно/путь/цвет/координаты/клавиши/время
remoteWindowTitle := "2 line support (3) — rds2ls3 — Подключение к удаленному рабочему столу"			; название TITLE окна удалёнки
aimpScriptPath := "D:\Про\Творения\AHK\Start_AIMP_Sound (REPEAT).ahk"			; путь скрипта для запуска аудио ч/з AIMP
defaultColor := 0xCDE6F7		; цвет пикселя (голубой) выделенного 1-го смс в RGB (16-ой системе)
trackingX := 1800				; координаты отслеживания цвета X
trackingY := 310				; координаты отслеживания цвета Y
windowMaxX := 1850				; координата X развернуть окно
windowMaxY := 15				; координата Y развернуть окно
selectCategory := "^{F10}"		; горячие клавиши выбора своей категории
checkInterval := 2000			; время интервала проверки (2 секунды)

; цикл проверки изменений
SetTimer(CheckForChanges, checkInterval)

; функция проверки наличия изменений
CheckForChanges() {
    global aimpScriptPath, remoteWindowTitle, defaultColor, trackingX, trackingY, windowMaxX, windowMaxY

    ; проверка существование окна удалёнки по TITLE. Либо ч/з - if (PID := ProcessExist("mstsc.exe"))
    if WinExist(remoteWindowTitle) {
        ; получить цвет пикселя в RGB по координатам отслеживания
        currentColor := Format("{:X}", PixelGetColor(trackingX, trackingY, "RGB"))

        ; проверить разницу цветов
        if (Format("{:X}", defaultColor) != currentColor) {

            ; клик на первое смс (для прогрузки 1-го смс)
            Click trackingX, trackingY

            ; остановить цикл проверки изменений
            SetTimer(CheckForChanges, 0)

            ; запуск AIMP без ожидания завершения скрипта (! RunWait)
            Run(aimpScriptPath)

            ; активация/разворачивание окно удалёнки
            WinActivate(remoteWindowTitle)
            ; WinMaximize(remoteWindowTitle)		; окно открывается с рамками
            ; WinRestore(remoteWindowTitle)			; окно открывается сокращённо по середине
            Click windowMaxX, windowMaxY			; клик по раскрытию окна

            ; отметка своей категорией по горяч.клвш.
            ; Send selectCategory
        }
        else {

            ToolTip("ВСЁ РОВНО!")
            Sleep(1000)
            ToolTip()
        }
    }
    else {

        ToolTip("Окно удалёнки не найдено!")
        Sleep(1000)
        ToolTip()
    }
}

^+a:: ProcessClose("AIMP.exe") 		; Ctrl Shift Q  >>  закрыть AIMP
^+q:: ExitApp  						; Ctrl Shift Q  >>  завершить скрипт
; ExitApp
