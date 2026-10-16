# 7nm 相干光通訊 ADC SoC 架構

Top Cell 為 `ADC_OPT_SOC_8b`，描述8路交錯ADC、ADPLL、FIR與光通訊介面，目標8-bit、64GSPS。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：`20260529`。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

保留同名 `.netlist` 與 `.txt`；SNDR等數字在檔頭標為目標。

## 使用前確認

需TSMC N7模型、相關子模組與testbench；此處未提供完整光通訊SoC實作或量測證據。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
