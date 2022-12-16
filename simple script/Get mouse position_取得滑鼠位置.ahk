; 取得滑鼠座標

#SingleInstance force ;禁止多開
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text, ,Press Ctrl+M to get mouse position
Gui, MyForm: Add, Button, gMyHide, Hide to System ;隱藏至系統列
Gui, MyForm: Show, xCenter yCenter w300
Menu, tray, add, Exit, MyFormGuiClose ;增加離開功能

^m:: ; Ctrl+M
	MouseGetPos, xpos, ypos 
	MsgBox, The cursor is at X%xpos% Y%ypos%.
	Return

MyFormGuiClose:
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp
	Return

MyHide: ;隱藏視窗
    WinHide, ahk_id %MyForm% ;hwnd
    Return

ESC:: ;強制關閉
    ExitApp
	Return