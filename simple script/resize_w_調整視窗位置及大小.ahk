x := -10
y := 20
w := 1980
h := 1040

SetTitleMatchMode, 2
WinMove, ahk_class Chrome_WidgetWin_1,, %x%, %y%, %w%, %h%
WinActivate, ahk_class Chrome_WidgetWin_1