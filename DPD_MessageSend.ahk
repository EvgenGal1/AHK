#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\DPD_ExitRemoteFullScreen.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

; fn > отправка письма
SendMessage() {
    if WinExist("ahk_exe " WindowRemoteExe) {
        WinActivate("ahk_exe " WindowRemoteExe)
        Sleep 500
        ; выход из обёртки удалёнки
        ExitRemoteFullScreen()
        ; разворачивание окна удалёнки с рамкой чтоб работали команды клавиш
        WinMaximize("ahk_exe " WindowRemoteExe)
        Sleep 500
        ; клик на "Входящие" СМС
        Click Remote_Click_Clt_VhodSmsX, Remote_Click_Clt_VhodSmsY
        Sleep 500
        ; клик ПКМ на 1ое СМС
        Click Remote_Clt_TrackingSmsX, Remote_Clt_TrackingSmsY, "Right"
        Sleep 500
        ; клик на "Копировать"
        Click Remote_Clt_TrackingSmsX + 15, Remote_Clt_TrackingSmsY + 15, 2
        Sleep 500
        ; созд.нов.письмо ч/з Ctrl+n
        SendInput "^n"
        Sleep 500
        ; вставить личную почту
        SendText MyMail
        ; Sleep 1500
        SendInput "{Enter}"
        Sleep 500
        ; перейти к полю темы (3 раза Tab)
        ; SendInput "{Tab 3}" ; ! иногда не успевает пройти все поля и можно отправить ещё кому нить. надо сверх надёжно пройти
        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"
        ; ввести тему письма
        SendInput "тест"
        Sleep 500
        ; перейти к телу письма (Tab)
        SendInput "{Tab}"
        Sleep 500
        ; вставить скопированное сообщение (Ctrl+V)
        SendInput "^v"
        Sleep 2000
        ; выделить тело смс и удалить
        SendInput "^a"
        SendInput "{Delete}"
        ; отправить письмо (Ctrl+Enter)
        SendInput "^{Enter}"
        Sleep 500
        ; подтвердить
        SendInput "^{Enter}"
        Sleep 500
    }
    ExitApp
}

; е/и внешн.запуск - сравн. путь ф.скрипта и путь ф.исполняемого (...Send.ahk != ...Top.ahk)
if (A_LineFile = A_ScriptFullPath) {
    SendMessage()
}
