#Requires AutoHotkey v2.0

#Include "D:\Про\Творения\AHK\DPD [VAR].ahk"
#Include "D:\Про\Творения\AHK\DPD_ExitRemoteFullScreen.ahk"

CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")

SendMessage() {
    if WinExist(Remote_Title) {
        WinActivate(Remote_Title)
        Sleep 500

        ; выход из обёртки удалёнки
        ExitRemoteFullScreen()

        ; разворачивание окна удалёнки с рамкой чтоб работали команды клавиш
        WinMaximize(Remote_Title)
        Sleep 500

        ; клик ПКМ на 1ое СМС
        Click Remote_TrackingSmsX, Remote_TrackingSmsY, "Right"
        Sleep 500

        ; клик на "Копировать"
        Click Remote_TrackingSmsX + 15, Remote_TrackingSmsY + 15, 2
        Sleep 500

        ; созд.нов.письмо ч/з Ctrl+n
        SendInput "^n"
        Sleep 500

        ; вставить личную почту
        SendText MyMail
        ; Sleep 1500
        SendInput "{Enter}"
        Sleep 500

        ; Перейти к полю темы (3 раза Tab)
        ; SendInput "{Tab 3}" ; ! иногда не успевает пройти все поля и можно отправить ещё кому нить. надо сверх надёжно пройти
        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"
        Sleep 500
        SendInput "{Tab}"

        ; Ввести тему письма
        SendInput "тест"
        Sleep 500

        ; Перейти к телу письма (Tab)
        SendInput "{Tab}"
        Sleep 500

        ; Вставить скопированное сообщение (Ctrl+V)
        SendInput "^v"
        Sleep 2000

        ; выделить тело cvv и удалить
        SendInput "^a"
        SendInput "{Delete}"

        ; ; Отправить письмо (Ctrl+Enter)
        SendInput "^{Enter}"
        Sleep 500

        ; подтвердить
        SendInput "^{Enter}"
        Sleep 500

        ExitApp
    }
}

SendMessage()

^+q:: ExitApp