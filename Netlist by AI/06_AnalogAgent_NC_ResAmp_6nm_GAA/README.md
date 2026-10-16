# 6nm GAA 負電容殘差放大器

Top Cell 為 `NC_RA_TOP_10b_500MS`；以動態負電容補償回授因子，檔頭自述由 AnalogAgent MAS 生成。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260603、20260608、20260612。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

保留初版、`fixed` 至 `fixed_v6`，有多組相同名稱的 `.txt`／`.netlist`。

## 使用前確認

需要實際GAA模型、testbench與golden schematic；MAS 的描述來自原檔，未附生成系統原始碼與對話。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
