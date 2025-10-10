#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"

; перемещение окна на указанный монитор
WindowMoveToMonitor(WindowTitle, MonitorNumber) {
    ; проверка сущ.монитора
    MonitorCount := MonitorGetCount()
    if (MonitorNumber > MonitorCount || MonitorNumber < 1) {
        ; MsgBox "Монитор " MonitorNumber " не существует!"
        ; return false
        MonitorNumber := 1
    }
    ; получить раб.область указан.монитора
    MonitorGetWorkArea(MonitorNumber, &left, &top, &right, &bottom)
    ; активировать окно
    WinActivate(WindowTitle)
    Sleep 500
    ; получить позицию/размеры окна
    WinGetPos(&x, &y, &w, &h, WindowTitle)
    ; проверить нахождение окно на нужном мониторе
    centerX := x + (w // 2)
    centerY := y + (h // 2)
    ; е/и окно уже на нужном мониторе - не перемещаем
    if (centerX >= left && centerX <= right && centerY >= top && centerY <= bottom) {
        ; уже на нужном мониторе
        return true
    }
    WinActivate(WindowTitle)
    Sleep 500

    ; Вычисляем новые координаты (центрируем на новом мониторе)
    newX := left + ((right - left - w) // 2)
    newY := top + ((bottom - top - h) // 2)

    ; Перемещаем окно
    WinMove(newX, newY, w, h, WindowTitle)

    return true
}

; пример использования
; WindowMoveToMonitor("ahk_exe " WindowRemoteExe, 2)

; ExitApp()
