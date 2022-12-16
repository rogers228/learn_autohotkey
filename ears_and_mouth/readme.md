# 工作站與後台(伺服器)通訊

Windows平台下區域網路內工作站對伺服器發出製表(excel)請求，完成後開啟。

Client/Server架構
1. 統一由伺服器製表，僅維護伺服器
2. 工作站不需安裝python
3. 所有人報表一致，沒有版本問題
4. 使用socket進行通訊封裝為exe，各工作站皆可重用
5. report_gui使用c#, autohoteky編程，製表使用python, pandas, openpyxl
6. python script分離可同時開發；獨立線程，崩潰時不影響主線程，更新時不必重啟
7. excel放於nas共用資料夾，自動清理

具體流程
1. 伺服器center保持開啟等待請求
2. 工作站製表需求，開啟report_gui, 1.等待回應<br>2. 子線程mouth通知伺服器製表<br>3.子線程清理資料夾先前的製表
3. 伺服器center收到請求後，轉drive處理
4. drive負責解析引數，轉相對應的python script處理製表
5. python script製表完成後，使用子線程mouth通知原工作站
6. 原工作站收到後開啟報表或顯示錯誤提示。

資料夾架構
|  名稱   | 說明
|  ----   | ----  
| server  | 1.center_gui<br>2.drive
| client  | 1.report_gui<br>
| communication | 1.ears.exe<br>2.mouth.exe
| python script | 可分離獨立
