;ahk後台監控
;使用Loop+Sleep做成Timer的效果
;搭配Gui CheckBox 可讓使用者控制開關
;可做成後台的監控程序，簡單易用，也可以執行其他語言，例如python腳本做更複雜的事情
;ahk完全可以勝任簡易Gui及取代簡易windows排程

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
        ;此處可以加上監控，Run 其他程序
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