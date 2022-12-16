; 按鍵代替滑鼠點擊

#SingleInstance force ;禁止多開
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

Gui, MyForm: New, +HwndMyForm
Gui, MyForm: Add, Text, ,key press to mouse click is running...
Gui, MyForm: Add, Button, gMyHide, Hide to System ;隱藏至系統列
Gui, MyForm: Show, xCenter yCenter w300
Menu, tray, add, Exit, MyFormGuiClose ;增加離開功能

Space:: ;Space
    MouseGetPos, cx, cy ;記住滑鼠現在位置
    MouseClick, left, 1540, 188, ,2 ;按下滑鼠左鍵 速度2
    MouseMove, cx, cy, 0 ;滑鼠回去原來位置
    Return

MyFormGuiClose:
    MsgBox ,292, Esc, Would you want to quit?
    IfMsgBox Yes
            ExitApp
    Return

MyHide: ;隱藏視窗
    WinHide, ahk_id %MyForm% ;hwnd
    Return

ESC:: ;強制關閉
    ExitApp
    Return