
; file_path := A_ScriptFullPath
; property_name := "target_script"

; msgbox, hi, %file_path%

; ; 使用 NTFS Alternate Data Streams 讀取屬性
; adsPath := file_path ":" property_name
; if FileExist(adsPath)
; {
;     file := FileOpen(adsPath, "r")
;     if file
;     {
;         value := file.Read() ; 讀取屬性值
;         file.Close()
;         MsgBox, 自訂屬性 "%property_name%" 的值為：`n%value%
;     }
;     else
;     {
;         MsgBox, 無法讀取自訂屬性 "%property_name%"
;     }
; }
; else
; {
;     MsgBox, 自訂屬性 "%property_name%" 不存在於檔案 "%file_path%"
; }

; 精簡版
target_script := FileOpen(A_ScriptFullPath ":" "target_script", "r").Read()
MsgBox, target_script：`n%target_script%