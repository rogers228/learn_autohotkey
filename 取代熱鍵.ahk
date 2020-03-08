;取代原始的熱鍵
;改為自己習慣的熱鍵
;或者原本的熱鍵太難按

#SingleInstance force ;禁止多開
Gui, Add, Text,x10 y10, Ctrl+P replace Ctrl+F5 is running...
Gui Show, xCenter yCenter w220, Replace hotkey

^p:: ;Ctrl+P
	Send ^{F5} ;取代Ctrl+F5
	Return

GuiClose:
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp
	Return

ESC:: ;強制關閉
    ExitApp
	Return