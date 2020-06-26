;使用兩台螢幕時，在主螢幕工作時能夠直接按掉第二台螢幕的廣告。
;使用Gui

#SingleInstance force ;禁止多開
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

;第一廣告位置
x1 = 3320 ;預設值
y1 = 892 ;預設值
label_1 .= "Ctrl + Backspacex x" . x1 . ",y" . y1 

;第二廣告位置
x2 = 2880 ;預設值
y2 = 740 ;預設值
label_2 .= "Ctrl + \ x" . x2 . ",y" . y2 

;第三廣告位置
x3 = 3781 ;預設值
y3 = 934 ;預設值
label_3 .= "Ctrl + > x" . x3 . ",y" . y3 

;顯示滑鼠座標
label_4 .= "Ctrl + M Show Mouse Pos"

Gui, Add, Text,x10 y2, %label_1%
Gui, Add, Text,x10 y16, %label_2%
Gui, Add, Text,x10 y30, %label_3%
Gui, Add, Text,x220 y30, %label_4%
Gui, Show, x600 y0 w360 h45, Close YouTube Ads

^Backspace::
	MouseGetPos, cx, cy ;記住滑鼠現在位置
	MouseClick, left, x1, y1, ,0 ;按下滑鼠左鍵 速度2
	MouseMove, cx, cy, 0 ;滑鼠回去原來位置 速度2
	Gui, Show ;視窗always on top
	Return

^\::
	MouseGetPos, cx, cy ;記住滑鼠現在位置
	MouseClick, left, x2, y2, ,0 ;按下滑鼠左鍵 速度2
	MouseMove, cx, cy, 0 ;滑鼠回去原來位置 速度2
	Gui, Show ;視窗always on top
	Return
	
^Right::
	MouseGetPos, cx, cy ;記住滑鼠現在位置
	MouseClick, left, x3, y3, ,0 ;按下滑鼠左鍵 速度2
	MouseMove, cx, cy, 0 ;滑鼠回去原來位置 速度2
	Gui, Show ;視窗always on top
	Return
	
^m:: ; Ctrl+M 設定當前滑鼠座標
	MouseGetPos, xpos, ypos
	MsgBox, The cursor is at X%xpos% Y%ypos%.
	Return
	
ESC:: ;強制關閉
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp
	Return