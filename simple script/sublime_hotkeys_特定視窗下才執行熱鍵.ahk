; sublime text 熱鍵

#SingleInstance force ;禁止多開
#IfWinActive ahk_class PX_WINDOW_CLASS ; 僅針對 sublime text

; gui
Gui, MyForm: New, +HwndMyForm
    ;變更圖示
    IconFile = sublime.ico ;圖示路徑
    IfNotExist, %IconFile%
        Return
    IfExist, %IconFile%
        ChangeWindowIcon(IconFile, MyForm) ;變更視窗圖示
        Menu, Tray, Icon, %IconFile% ;變更系統列圖示

; ini
IniRead, PATH_35_sass, config.ini, DIRPATH, 35_sass

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

^j:: ;Ctrl+J
    Run %ComSpec% /c "python compile_sass.py", %PATH_35_sass%, UseErrorLevel
    if ErrorLevel
        MsgBox, % "A_LastError=" A_LastError
    else
        MsgBox, 64, Sublime hotkeys, % "run finished", 2
    Return


