# 6nm N-parallel StrongARM 比較器

StrongARM latch 加 N=5 並聯放電路徑與輔助時脈閘控，Top Cell 為 `COMP_STRARM_NPARALLEL`。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260626。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

唯一原檔為 `.txt`，正文是 SPICE netlist；沒有同名 `.sp` 副本。

## 使用前確認

需要對應 6nm PDK、模型對應與外部 testbench。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
