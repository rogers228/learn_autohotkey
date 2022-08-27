#Singleinstance force ;單線
#Persistent ;持續

SetTimer, Alert_handler, 1000
alr := {"ready": true, "show_clock": true, "h":9, "m":38, "s":30}

Alert_handler(){
    Global alr
    if (alr["show_clock"] = true){
        ToolTip, %A_Hour%:%A_Min%:%A_Sec%
    }

    ; if (alr["ready"] = true  and A_Hour = alr["h"] and A_Min = alr["m"]){
    if (alr["ready"] = true  and A_Sec = alr["s"]){
        alr["ready"] := false ;停用
        ToolTip
        Run_handler()
    }
}

Run_handler(){
     MsgBox , 64, Run_handler, It's timerout do something, 2
     SetTimer, Restart, -120000 ; 固定時間 重新啟用
}

Restart(){ ;重新啟用
    Global alr
    alr["ready"] := true 
}