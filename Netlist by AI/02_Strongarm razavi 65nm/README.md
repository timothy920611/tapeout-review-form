# 65nm Razavi StrongARM latch

Razavi SSCM 2015 Fig.1(b) 修改型 latch 加 NAND-SR buffer，附暫態分析與量測指令。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260626。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

`STRONGARM_RAZAVI_65nm_v1.netlist` 是此目錄唯一電路檔。

## 使用前確認

檔頭標有 `[PDK-CHECK-REQUIRED]`；先核對 BSIM4 模型與實際製程，不因含分析指令就假設可直接完成驗證。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
