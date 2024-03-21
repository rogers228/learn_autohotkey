#NoEnv
#SingleInstance force
SetTitleMatchMode, 2 ;標題比對字串模式2  符合任何字串即可(建議標題文字要多打字) 不可中文
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

#Include config.ahk

; session_name := "ahk_session"
; Run, putty -load %session_name% %SELECTER_HOSTNAME%

Run, C:\Program Files\PuTTY\putty.exe
; WinWaitActive, PuTTY

; Send, {Shift} ; 切換英文
; Sleep, 500

title :=  "PuTTY Configuration"
win := MyGetWin(title)
Send, {Shift} ; 切換英文
Sleep, 500

; open
MyMouseClick(win["x"]+314, win["y"]+425)
Sleep, 1000

Send, %SELECTER_USERNAME%{Enter}
Sleep, 1000

Send, %SELECTER_PASSWORD%{Enter}
Sleep, 1000

MyGetWin(winTitle) ;檢查視窗是否存在
{
    isExist := 0 ; 0不存在 1存在
    windows_x := 0 ;視窗位置x
    windows_y := 0 ;視窗位置y
    WinWait, %winTitle%, , 3
    if ErrorLevel
    {
        MsgBox, 48,,視窗超過時間尚未開啟
        Return
    }
    Else
    {
        if WinExist(winTitle)
        {
            isExist := 1 ;存在
            WinActivate
            WinGetPos, windows_x, windows_y ; Use the window found by WinExist.
        }
        obj := {isExist: isExist, x: windows_x, y: windows_y} ;key value 引用時使用key 增加可讀性
        ; 引用範例
        ; Msgbox, % obj["isExist"]
        ; Msgbox, % obj["x"]
        ; Msgbox, % obj["y"]
        Return obj
    }
}

MyMouseClick(mouse_x, mouse_y)
{
    MouseMove, %mouse_x%, %mouse_y%, 2
    MouseClick, left
}