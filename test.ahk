#singleinstance force
Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text, , Please select a file.
Gui, MyForm: Add, Edit, w430 vMyFileText
Gui, MyForm: Add, Button, h24 w120 gMySelectFile, 選擇檔案
Gui, MyForm: Add, Button, h24 w220 gMySub vMyBtn, 建立後開啟
Gui, MyForm: Show, w460 h160 Center ,Listen ;自訂標題

Return

MySub:
    startTime := A_Now
    GuiControl, Disable, MyBtn ;停用按鈕避免重複按多次
    SetTimer, MyTimer1, -5000 ;最大等待時間 60 秒，負號代表僅執行一次
    SetTimer, MyTimer2, 1000
    Return

MyTimer1:
    endTime := A_Now
    ;MsgBox, % DateDiff(startTime, endTime, "Seconds") 
    MsgBox, 48, ,程式超時未回應，請洽系統管理員!
    SetTimer, MyTimer2, Off
    ToolTip,
    GuiControl, MyForm: Enable, MyBtn
    Return

MyTimer2:
    ;讀取回應後關閉
    ToolTip, %A_Now%

    Return

MySelectFile: ;選擇檔案
    FileSelectFile, SelectedFile, 1, , Open a file, Text Documents (*.txt; *.doc)
    if (Not SelectedFile = "")
        ;MsgBox, The user selected the following:`n%SelectedFile%s
        GuiControl, , MyFileText, %SelectedFile%
    Return

MyFormGuiClose: ;關閉
	MsgBox ,292 , Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp

DateDiff(starT, endT, timeUnits)
{
    EnvSub, endT, starT, % timeUnits
    Return endT
}