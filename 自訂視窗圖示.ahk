;自訂Gui及系統列的預設圖示
;可將工作階段的程式更換圖示，以區別開發階段的腳本

#singleinstance force

Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text,x10 y10, Hello Icon!
Gui, MyForm: Show, w360 h45 Center ,Listen

;變更圖示
IconFile = C:\tmp\h.ico ;圖示路徑
IfNotExist, %IconFile%
    Return
IfExist, %IconFile%
    ChangeWindowIcon(IconFile, MyForm) ;變更視窗圖示
    Menu, Tray, Icon, %IconFile% ;變更系統列圖示
Return

MyFormGuiClose: ;關閉
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp

;變更圖示
ChangeWindowIcon(IconFile, hWnd) {
    if (!hWnd){
        Msgbox "Window Not Found"
        return 
    }
    hIcon := DllCall("LoadImage", uint, 0, str, IconFile, uint, 1, int, 0, int, 0, uint, LR_LOADFROMFILE:=0x10)
    if (!hIcon)
	      Throw "Icon file missing or invalid in `nChangeWindowIcon(" IconFile ", " WinSpec ")`n`n"
    SendMessage, WM_SETICON:=0x80, ICON_SMALL2:=0, hIcon,, ahk_id %hWnd%  ; Set the window's small icon
    SendMessage, WM_SETICON:=0x80, ICON_BIG:=1   , hIcon,, ahk_id %hWnd% ; Set the window's big icon to the same one.
    Return
}



