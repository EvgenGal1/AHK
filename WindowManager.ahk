#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

class WindowManager {
    ; задержка по умолчанию
    static DefaultDelay := 250
    ; fn общего перемещения окон. принимает:
    ;   * указанный|имеющийся конфиг.окна
    ;   * опцион.задержка после отработки перемещ.окна (250)
    static MoveWindows(WindowConfigs, customDelay := "") {
        ; задержка тернирным оператором
        delay := customDelay != "" ? customDelay : this.DefaultDelay
        ; перебор масс.конфиг.окон по длине объ.
        loop WindowConfigs.Length {
            window := WindowConfigs[A_Index]
            ; обраб.возможных ошб.без прерывания скрипта
            try {
                ; проверка существ.окна
                if WinExist("ahk_exe " window.exe) {
                    ; перемещаем окно
                    WindowMoveToMonitorArea("ahk_exe " window.exe, window.monitor, window.area)
                    ; задержка после перемещения
                    if (delay > 0) {
                        Sleep delay
                    }
                }
            }
            catch as e {
                OutputDebug("Ошибка с окном: " window.exe " - " e.Message)
            }
        }
    }
}

; глобал.конфиг.окон (разные параметры сценариев) > распред.по экранам. Экраны: Ноут (1), монитор (2)
GlobalWindowConfigs := Map(
    ; IDE макс.на ноут, браузер макс.на монитор, удалёнка 20% вниз на ноут,
    "windowParams_1", [{ exe: WindowVSCExe, monitor: 1, area: "M" }, { exe: WindowASExe, monitor: 1, area: "M" }, { exe: WindowRemoteExe,
        monitor: 1, area: "B_40" }, { exe: BrowserChromeExe, monitor: 2, area: "M" }, { exe: BrowserYandexExe, monitor: 2,
            area: "M" }, { exe: BrowserEdgeExe,
                monitor: 2, area: "M" }],
    ; IDE макс.на монитор, браузер макс.на ноут, удалёнка 20% вниз на ноут
    "windowParams_2", [{ exe: BrowserChromeExe, monitor: 1, area: "M" }, { exe: BrowserYandexExe, monitor: 1, area: "M" }, { exe: BrowserEdgeExe,
        monitor: 1, area: "M" }, { exe: WindowRemoteExe, monitor: 1, area: "B_40" }, { exe: WindowVSCExe,
            monitor: 2, area: "M" }, { exe: WindowASExe, monitor: 2, area: "M" }],
    ; IDE макс.на ноут, браузер 80% в лево на монитор, удалёнка 20% в право на монитор
    "windowParams_3", [{ exe: WindowVSCExe, monitor: 1, area: "M" }, { exe: WindowASExe, monitor: 1, area: "M" }, { exe: BrowserChromeExe,
        monitor: 2, area: "L_80" }, { exe: BrowserYandexExe, monitor: 2, area: "L_80" }, { exe: BrowserEdgeExe, monitor: 2,
            area: "L_80" }, { exe: WindowRemoteExe, monitor: 2, area: "R_20" }],
    ; браузер макс.на ноут, IDE 80% в лево на монитор, удалёнка 20% в право на монитор
    "windowParams_4", [{ exe: BrowserChromeExe, monitor: 1, area: "M" }, { exe: BrowserYandexExe, monitor: 1, area: "M" }, { exe: BrowserEdgeExe,
        monitor: 1, area: "M" } { exe: WindowVSCExe,
            monitor: 2, area: "L_80" }, { exe: WindowASExe, monitor: 2, area: "L_80" }, { exe: WindowRemoteExe, monitor: 2,
                area: "R_20" },]
)