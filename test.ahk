﻿#singleinstance force

MyWaitTime := 5000 ;等待時間(毫秒)

;Gui
    Gui, MyForm: New, +HwndMyForm
    Gui, MyForm: Add, Text, , Please select a file:
    Gui, MyForm: Add, Edit, w430 r3 vMyFileText
    Gui, MyForm: Add, Button, x320 h24 w120 gMySelectFile, 選擇檔案
    GuiControl, +ReadOnly, MyFileText ;僅讀取
    Gui, MyForm: Add, Button, x120 y120 h24 w220 gMySendRequest vMyBtn, 建立後開啟
    GuiControl, Disable, MyBtn ;該按鈕預設為停用，等使用者輸入參數後才啟用
    Gui, MyForm: Show, w460 h160 Center ,Listen ;自訂標題
    Return


MySendRequest: ;發送請求
    RequestFileName := A_ComputerName . "__;__" . A_Now
    GuiControl, Disable, MyBtn ;停用按鈕避免重複按多次
    SetTimer, MyTimer1, %MyWaitTime% ;等待時間(毫秒)
    SetTimer, MyTimer2, 1000 ;監控回應時間間隔(毫秒)
    Return

MyTimer1: ;等待時間
    ;發送請求
    ;
    ;
    SetTimer, MyTimer1, Off
    SetTimer, MyTimer2, Off
    ToolTip, ;偵錯用
    MsgBox, 48, ,程式超時未回應，請洽系統管理員!
    GuiControl, MyForm: Enable, MyBtn ;重新啟用按鈕
    Return

MyTimer2:
    ;讀取回應後關閉

    ToolTip, % A_Now  ;偵錯用
    Return

MySelectFile: ;選擇檔案
    FileSelectFile, SelectedFile, 1, , Open a file, Text Documents (*.txt; *.doc)
    if (Not SelectedFile = "")
        ;MsgBox, The user selected the following:`n%SelectedFile%s
        GuiControl, , MyFileText, %SelectedFile%
        GuiControl, Enable, MyBtn 
    Return

MyFormGuiClose: ;關閉
	MsgBox ,292 , Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp

; DateDiff(starT, endT, timeUnits)
; {
;     EnvSub, endT, starT, % timeUnits
;     Return endT
; }