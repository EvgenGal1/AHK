#Requires AutoHotkey v2.0

#Include "D:\Pro\Projects\AHK\DPD [VAR].ahk"
#Include "D:\Pro\Projects\AHK\WindowMoveToMonitorArea.ahk"

class WindowManager {
    ; задержка
    static DefaultDelay := 250
    ; fn общего перемещения окон. принимает:
    ;   * указанный|имеющийся конфиг.окна
    ;   * опцион.задержка после отработки перемещ.окна (250)
    static MoveWindows(WindowConfigs, customDelay := "") {
        delay := customDelay != "" ? customDelay : this.DefaultDelay
        ; перебор масс.конфиг.окон по длине объ.
        loop WindowConfigs.Length {
            window := WindowConfigs[A_Index]
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
    }
}

; глобал.конфиг.окон
GlobalWindowConfigs := Map(
    ; конфиги > разных сценариев с индивид. окнами/параметрами
    "windowParams1", [{ exe: WindowBrowserExe, monitor: 2, area: "M" }, { exe: WindowVSCExe, monitor: 1, area: "M" }, { exe: WindowASExe,
        monitor: 1, area: "M" }, { exe: WindowRemoteExe, monitor: 1, area: "B_40" }],
    "windowParams2", [{ exe: WindowBrowserExe, monitor: 1, area: "M" }, { exe: WindowRemoteExe, monitor: 1, area: "B_40" }, { exe: WindowVSCExe,
        monitor: 2, area: "M" }, { exe: WindowASExe, monitor: 2, area: "M" }],
    "windowParams3", [{ exe: WindowVSCExe, monitor: 1, area: "M" }, { exe: WindowASExe, monitor: 1, area: "M" }, { exe: WindowBrowserExe,
        monitor: 2, area: "L_80" }, { exe: WindowRemoteExe, monitor: 2, area: "R_20" }],
    "windowParams4", [{ exe: WindowBrowserExe, monitor: 1, area: "M" }, { exe: WindowRemoteExe, monitor: 2, area: "R_20" }, { exe: WindowVSCExe,
        monitor: 2, area: "L_80" }, { exe: WindowASExe, monitor: 2, area: "L_80" }]
)