# client server communication
# 工作站與服務器通訊

區域網路內工作站對伺服器發出製表excel請求，伺服器處理完成後回應工作站。

優點
1. 統一由伺服器製表，僅維護伺服器
2. 工作站不需安裝python
2. 所有人報表一致，沒有版本問題
3. 使用socket進行通訊封裝為exe，各工作站皆可重用
4. python script為獨立線程，崩潰時不影響主線程center，更新時不必重啟
5. python script分離，可同時開發

具體流程
1. 伺服器center開啟等待請求
2. 各工作站有製表需求時，開啟a子線程mouth通知伺服器
3. 開啟b子線程ears等待回應，超時即關閉
4. 伺服器center收到請求後，轉drive處理
5. drive負責解析請求，轉相對應的python script處理製表
6. python script製表完成後，使用mouth通知工作站b子線程ears
7. b子線程ears收到後開啟報表,結束。