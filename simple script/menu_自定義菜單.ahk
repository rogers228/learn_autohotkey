#Persistent
#SingleInstance force

Menu, tray, NoStandard ; 不使用預設 (清除菜單)
Menu, Tray, Add, Reload This Script, HandleReload
Menu, Tray, Add, Run Flask Dev, Choose ; 使用 Choose 強制選擇後觸發，避免啟動時觸發
Menu, Tray, Add  ; 添加分隔線
Menu, Tray, Add, Exit, HandleExit

Choose:
    if (A_ThisMenuItem = "Run Flask Dev"){
        RunWait, %ComSpec% /c "python flask_dev.py", %MS_85_release%\local
    }
    return

HandleReload:
    Reload
    Return

HandleExit:
    ExitApp
    Return