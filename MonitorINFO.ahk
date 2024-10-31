; стар.скрипт раздел.смс (доки):

; MonitorCount := MonitorGetCount()
; MonitorPrimary := MonitorGetPrimary()
; MsgBox "Monitor Count:`t" MonitorCount "`nPrimary Monitor:`t" MonitorPrimary
; Loop MonitorCount
; {
    ; MonitorGet A_Index, &L, &T, &R, &B
    ; MonitorGetWorkArea A_Index, &WL, &WT, &WR, &WB
    ; MsgBox
    ; (
        ; "Monitor:`t#" A_Index "
        ; Name:`t" MonitorGetName(A_Index) "
        ; Left:`t" L " (" WL " work)
        ; Top:`t" T " (" WT " work)
        ; Right:`t" R " (" WR " work)
        ; Bottom:`t" B " (" WB " work)"
    ; )
; }





; нов.скрипт общ.смс:

; границы 1го монитора. Общ./раб.области
MonitorGet 1, &Left1, &Top1, &Right1, &Bottom1
MonitorGetWorkArea 1, &WLeft1, &WTop1, &WRight1, &WBottom1

; границы 2го монитора. Общ./раб.области
MonitorGet 2, &Left2, &Top2, &Right2, &Bottom2
MonitorGetWorkArea 2, &WLeft2, &WTop2, &WRight2, &WBottom2

; общий вывод:
MsgBox
(
	"кол-во Мониторов : " MonitorGetCount() " `t `t Главный : " MonitorGetPrimary()
	"`n"
	"общ.размеры (Ш х В) : `t " SysGet(78) " x " SysGet(79)
	"`n"
	"Главный " MonitorGetPrimary() " (Ш х В) : `t " SysGet(0) " x " SysGet(1)	" `t левый : `t " SysGet(76) " x " SysGet(77)
	"`n`n"
	"Монитор _1_ `t `t ИМЯ: " MonitorGetName(1)
	"`n"
	"общ.коорд.:	Left: " Left1 "	Top: " Top1 "	Right: " Right1 "	Bottom:	" Bottom1
	"`n"
	"раб.коорд.:	Left: " WLeft1 "	Top: " WTop1 "	Right: " WRight1 "	Bottom:	" WBottom1
	"`n`n"
	"Монитор _2_ `t `t ИМЯ: " MonitorGetName(2)
	"`n"
	"общ.коорд.:	Left: " Left2 "	Top: " Top2 "	Right: " Right2 "	Bottom:	" Bottom2
	"`n"
	"раб.коорд.:	Left: " WLeft2 "	Top: " WTop2 "	Right: " WRight2 "	Bottom:	" WBottom2
)