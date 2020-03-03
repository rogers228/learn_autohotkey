#SingleInstance force ;禁止多開
^m:: ; Ctrl+M
	MouseGetPos, xpos, ypos 
	MsgBox, The cursor is at X%xpos% Y%ypos%.
	Return