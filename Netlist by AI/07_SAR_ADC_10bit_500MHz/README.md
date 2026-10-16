# 10-bit 500MS/s 非同步 SAR ADC

初版檔頭標示 TKU2 AnalogAgent，參考 Ding et al. TVLSI 2018 與 OpenSAR ICCAD 2021，包含多種分析與量測指令。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260612、20260617。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

初版 `.sp`／`.txt` 及 `SAR_ADC_10bit_500MHz_fixed_ver1.sp`；修正版需逐項核對 `[CONFIRM]` 註記。

## 使用前確認

引用的 `models/40nm_cmos.lib` 不在目前資料中，需另行取得合法模型並確認TT等corner；這次未執行該ADC模擬。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)
