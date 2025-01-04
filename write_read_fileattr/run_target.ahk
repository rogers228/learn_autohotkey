; 開啟 target_script 的 pyqt5 並隱藏cmd視窗
; 編譯為 target_script.exe 後
; 使用 write_attr.py 寫入 ads target_script

python_exe   := "C:\Python310\python.exe" ; 修改為你的 Python 可執行檔完整路徑
cmd_title    := "start_for_python_pyqt_gui" ; 定義 CMD 視窗的臨時標題

; 讀取本腳本的 ads屬性為target_script的值
file_path := A_ScriptFullPath
property_name := "target_script"
adsPath := file_path ":" property_name
file := FileOpen(adsPath, "r")
if file
{
    target_script := file.Read() ; 讀取屬性值
    file.Close()
}
else
{
    MsgBox, 缺少ads屬性 target_script
    ExitApp
}

; 開啟 target_script 並隱藏cmd視窗

if FileExist(target_script)
{
    ; MsgBox, %target_script%
    Run, %ComSpec% /c title %cmd_title% && "%python_exe%" "%target_script%",, Min ; 以最小化方式啟動
    ; ComSpec ：系統變數，指向 cmd.exe。
    ; /c      ：執行完命令後自動退出。

    WinWait, %cmd_title%,, 2000 ; 等待指定標題的視窗出現（最多 2 秒）
    WinHide, %cmd_title% ; 確保cmd視窗隱藏
}
else
{
    MsgBox, 檔案 "%target_script%" 不存在缺少ads屬性 target_script
    ExitApp
}