# 5nm／7nm source-follower 殘差傳遞

聚焦 source-follower 殘差傳遞及緩衝器，Top Cell 為 `SF_RESBUF_12b_600MS`；檔頭規格為12-bit、600MS/s設計意圖。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260603、20260605、20260612、20260615、20260617。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

版本從初版、`fixed` 至 `fixed_v7`；部分 `.txt` 與 `.sp` 為相同正文。`20260605netlist.zip` 是歷史版本包，已保留。

## 使用前確認

v7 明列 `[DESIGN INTENT DOCUMENT — NOT PRODUCTION-READY]`；需要實際5nm／7nm模型與外部驗證。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
