#SingleInstance force ;禁止多開
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

Gui, 1:Add, Text,x10 y10, Press:
Gui, 1:Add, ComboBox, r20 x40 y7 w80 h60 gSelect vSelect Choose1,^Backspace|^P|F8
Gui, 1:Add, Text,x125 y10, to MouseClick here
Gui, 1:Add, Edit, r1 x220 y7  vT1, 9999
Gui, 1:Add, Edit, r1 x255 y7  vT2, 9999
Gui, 1:Add, Text,x287 y10,(Ctrl+M Set Current Pos)
Gui, 1:Show, x600 y0 w420 ,Press Key to Close Ads

x1 = 819
y1 = 467
old_k := "^Backspace"
GuiControl,, T1, %x1%
GuiControl,, T2, %y1%
Hotkey, %old_k%, doit
Return

doit: ;滑鼠按一下固定位置
	;MsgBox You pressed %A_ThisHotkey%.
	Gui, Submit 
	gx = %T1%
	gy = %T2%
	MouseGetPos, cx, cy ;記住滑鼠現在位置
	MouseClick, left, gx, gy, ,2 ;按下滑鼠左鍵 速度2
	MouseMove, cx, cy, 2 ;滑鼠回去原來位置 速度2
	Gui, 1:Minimize
	Return

Select:
	Gui,SubMit,NoHide
	Hotkey, %old_k%, Off
	Hotkey, %Select%, doit, On
	old_k = %Select%
	Return
	
^m:: ; Ctrl+M 設定當前滑鼠座標
	MouseGetPos, xpos, ypos
	;MsgBox, The cursor is at X%xpos% Y%ypos%.
	GuiControl,, T1, %xpos%
	GuiControl,, T2, %ypos%
	Return
	
ESC:: ;強制關閉
	ExitApp
	Return