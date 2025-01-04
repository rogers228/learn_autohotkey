; msgbox, hi, %A_ScriptName%

; 定義 Python 主程式的路徑
pyqt_script := "C:\Users\USER\Documents\Learn_python\note\module\03_qt_test\main.py" ; 修改為你的 main.py 完整路徑
python_exe   := "C:\Python310\python.exe" ; 修改為你的 Python 可執行檔完整路徑
cmd_title    := "start_for_python_pyqt_gui" ; 定義 CMD 視窗的臨時標題

Run, %ComSpec% /c title %cmd_title% && "%python_exe%" "%pyqt_script%",, Min ; 以最小化方式啟動
; ComSpec ：系統變數，指向 cmd.exe。
; /c      ：執行完命令後自動退出。

WinWait, %cmd_title%,, 2000 ; 等待指定標題的視窗出現（最多 2 秒）
WinHide, %cmd_title% ; 確保cmd視窗隱藏

