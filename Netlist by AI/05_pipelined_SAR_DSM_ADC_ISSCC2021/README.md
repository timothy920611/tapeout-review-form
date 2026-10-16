# Pipelined SAR／DSM ADC

依 Baek et al. ISSCC 2021 Session 10.5 架構描述的12-bit、600MS/s系統，Top Cell 為 `PIPE_SAR_DSM_ADC_12b`。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260601、20260617。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

保存初版及 `fixed_v2`、`fixed_v3`；v3 包含 keeper、body tie、浮接點等修改紀錄。

## 使用前確認

需要 Samsung SF7P 模型與 testbench。檔頭引用的論文量測數字不能當成本 netlist 的已重現結果。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
