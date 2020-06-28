;自訂視窗
;1.自訂圖示，以區別開發階段的腳本
;2.Gui可最小化至系統列，不佔據工作列
;3.簡化功能表

#singleinstance force

Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text,x10 y10, Hello Icon!
Gui, MyForm: Add, Button, x220 y10 w120 gMyHide, Minimize to System
Gui, MyForm: Show, w360 h45 Center ,Listen
Menu, Tray, NoStandard ;移除標準功能
Menu, tray, add, Reload This Script, ReloadThisScript ;增加重啟功能
Menu, Tray, Add, Show Window, MyShow ;增加顯示視窗功能
Menu, tray, add, Exit, MyFormGuiClose ;增加離開功能
Menu, Tray, Default, Show Window ;設定選單預設值，滑鼠點兩下圖示即可觸發

;變更圖
IconFile = h.ico ;圖示路徑
IfNotExist, %IconFile%
    Return
IfExist, %IconFile%
    ChangeWindowIcon(IconFile, MyForm) ;變更視窗圖示
    Menu, Tray, Icon, %IconFile% ;變更系統列圖示
Return

MyHide: ;隱藏視窗
    WinHide, ahk_id %MyForm% ;hwnd
    Return

MyShow: ;顯示視窗
	WinShow, ahk_id %MyForm%
	WinActivate, ahk_id %MyForm%
    Return

MyFormGuiClose: ;關閉
	MsgBox ,292, Esc, Would you want to quit?
	IfMsgBox Yes
    		ExitApp

ReloadThisScript: ;重啟腳本
    Reload
    Return

ChangeWindowIcon(IconFile, hWnd) { ;變更圖示
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



