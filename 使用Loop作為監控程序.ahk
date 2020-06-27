;使用Loop+Sleep做成Timer的效果
;搭配Gui CheckBox 可讓使用者控制開關
;可做成後台的監控中心

#SingleInstance force ;禁止多開

MyTimer = 2000 ;毫秒為單位
Gui, Add, CheckBox, y20 vMyCheckbox gMyloop Checked, Enable Timer to listen
Gui, Show, w360 h45 Center ,Listen


Myloop:
    Loop
    {
        GuiControlGet, MyCheckbox
        if (MyCheckbox = 0)
        {
            Break
        }
        ;MsgBox, Iteration number is %A_Index%.
        ;此處可以加上監控
        Sleep, %MyTimer% ;Timer
    }

GuiClose: ;使用GuiClose關閉按鈕
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp
    Return

ESC:: ;強制關閉
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp
	Return