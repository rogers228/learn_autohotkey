;取代原始的熱鍵
;改為自己習慣的熱鍵
;或者原本的熱鍵太難按

#SingleInstance force ;禁止多開
Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text, ,Ctrl+P replace Ctrl+F5 is running...
Gui, MyForm: Add, Button, gMyHide, Hide to System ;隱藏至系統列
Gui, MyForm: Show, xCenter yCenter w300
Menu, tray, add, Exit, MyFormGuiClose ;增加離開功能

^p:: ;Ctrl+P
	Send ^{F5} ;取代Ctrl+F5
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