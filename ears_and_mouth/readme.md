# client server communication
# 工作站與服務器通訊

工作站對伺服器發出製表請求，伺服器處理完成後回應工作站。
優點
1. 統一由伺服器製表，僅維護伺服器
2. 所有人報表一致，沒有版本問題
3. 使用socket進行通訊，各平台程式皆可對接

具體流程
1. 伺服器app server開啟等待請求
2. 各工作站有製表需求時，開啟a子線程mouth通知伺服器
3. 開啟b子線程ears等待回應，超時即關閉
4. 伺服器app server收到請求後，轉drive處理
5. drive負責解析請求，轉相對應的python處理製表
6. python製表完成後，使用mouth通知工作站b子線程ears
7. b子線程ears收到後開啟報表,結束。