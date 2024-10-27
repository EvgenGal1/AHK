; вызов fn каждые 0.25 сек.
SetTimer WatchCursor, 250

WatchCursor() {
    ; по курсору мыши сохр.в перем. координаты/ID окна/эл.кправ.
    MouseGetPos(&x, &y, &id, &control)
    windowTitle := WinGetTitle("ahk_id " id)
    windowClass := WinGetClass("ahk_id " id)
    windowExe := WinGetClass("ahk_id " id)

    ; окно вывода
    ToolTip(
        "TITLE : " windowTitle "`n"
        "ahk_exe : " windowExe "`n"
        "ahk_id : " id "`n"
        "ahk_class : " windowClass "`n"
        "Control : " control
    )

    ; проверка одновременного нажатия Ctrl+C. "P" (Physical) — физически нажатие на клвт. "T" (Toggle) — ключ переключаtvs[ клвш.типа Caps Lock
    if (GetKeyState("Ctrl", "P") and GetKeyState("C", "P")) {
        ; A_Clipboard := "ahk_id: " id "`n" "ahk_class: " windowClass "`n" "TITLE: " windowTitle "`n" "Control: " control
        copiedData := "TITLE: " windowTitle "`n" "ahk_exe: " windowExe "`n" "ahk_id: " id "`n" "ahk_class: " windowClass "`n" "Control: " control
        A_Clipboard := copiedData
        Sleep(500)

        ; проверка копирования
        ; if !ClipWait(300)		; проверка буфера не раб.
        if (A_Clipboard == copiedData) {
            ToolTip("Данные успешно скопированы в буфер обмена!")
        } else {
            ToolTip("Ошибка копирования данных в буфер обмена!")
        }
        Sleep(1000)		; Задержка смс
    }
}

^q:: ExitApp		; Ctrl+Q завершит скрипт
^p:: Pause  		; Ctrl+P поставит скрипт на паузу
