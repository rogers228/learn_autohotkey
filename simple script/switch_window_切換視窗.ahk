#Persistent
#SingleInstance force ;禁止多開
SetTitleMatchMode, 2  ; 設定標題匹配模式

Loop
{
    WinGetActiveTitle, curr_title ; 獲取當前活動視窗的標題
    if (title != curr_title && curr_title != "")
    {
        MsgBox, %curr_title%  ; 顯示標題
        title := curr_title
    }
}
