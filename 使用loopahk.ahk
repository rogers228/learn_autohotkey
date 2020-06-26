;這是測試
Loop, 3
{
    MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
    Sleep, 100
}

ESC:: ;強制關閉
    ExitApp
	Return