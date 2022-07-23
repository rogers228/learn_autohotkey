#SingleInstance force ;禁止多開

Gui, Add, Text, ,I will close in 5 seconds
Gui, Show, xCenter yCenter w300
SetTimer, MyTimeout, -5000
Return

MyTimeout:
    ExitApp
    Return

ESC:: ;強制關閉
    ExitApp
    Return
    