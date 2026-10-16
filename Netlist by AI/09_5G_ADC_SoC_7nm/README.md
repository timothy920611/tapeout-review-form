# 7nm 5G ADC SoC 架構

Top Cell 為 `ADC_5G_SOC_12b`，描述4路交錯pipelined SAR、PLL、背景校正與JESD204B輸出，目標12-bit、12GSPS。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：`20260529`。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

保留同名 `.netlist` 與 `.txt`；目標規格以原檔頭為準。

## 使用前確認

需TSMC N7模型、系統子模組與testbench；目前是架構／netlist資料，沒有完整SoC驗證結果。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
