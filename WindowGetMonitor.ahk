#Requires AutoHotkey v2.0

; опред.номера монитора окна
WindowGetMonitor(WindowTitle) {
    ; получить позицию окна
    WinGetPos(&x, &y, &w, &h, WindowTitle)
    ; получить список мониторов
    MonitorCount := MonitorGetCount()
    ; проверить каждый монитор
    loop MonitorCount {
        ; возврат коорд.границ
        MonitorGetWorkArea(A_Index, &left, &top, &right, &bottom)
        ; коорд.центр окна относительно монитора
        centerX := x + (w // 2)
        centerY := y + (h // 2)
        ; проверяем нахождение центра окна на мониторе
        if (centerX >= left && centerX <= right && centerY >= top && centerY <= bottom) {
            return A_Index
        }
    }
    ; е/и не найдено, возвращаем 1 - экран ноута, 2 - доп.монитор
    return 1
}

; пример использования
; WindowGetMonitor("ahk_exe " WindowRemoteExe)
; MsgBox "Окно находится на мониторе номер: " monitorNumber

; ExitApp()
