# 光通訊 ADC SoC：電路與 placement 交接

以ADC_OPT_SOC_8b為對象，保存分區與placement規劃。參考PDF屬wireline／ADC相關文獻，不能僅憑檔名當作此SoC的製造或量測結果。

來源為提供者上傳的 `10_1.zip`，原始相對目錄 `03_Coherent_OPT_ADC_SoC_7nm` 保留原樣，包括名稱中的空白與尾綴2。這些名稱是來源資料的一部分，不代表本次新建的版本號。

## 本層檔案

| 原始檔案 | 用途 |
| --- | --- |
| [Coherent_OPT_ADC_SoC_7nm_placement_plan.pdf](Coherent_OPT_ADC_SoC_7nm_placement_plan.pdf) | AI配置／審查提案PDF |
| [Netlist Coherent_OPT_ADC_SoC_7nm.txt](Netlist%20Coherent_OPT_ADC_SoC_7nm.txt) | 電路netlist（文字） |
| [論文 Coherent_OPT_ADC_SoC_7nm.pdf](%E8%AB%96%E6%96%87%20Coherent_OPT_ADC_SoC_7nm.pdf) | 參考文獻PDF |

## 使用方式與限制

先讀配置／審查提案了解top cell、分區、相依與待確認事項，再對照 `Netlist Coherent_OPT_ADC_SoC_7nm.txt` 的階層及連線，最後回查參考PDF。placement文件的假設、尺寸、製程對應與SHA聲明應以原文及目前檔案另行核對，這次沒有更改電路或執行實體設計流程。

本層只有netlist與PDF，沒有實際GDS／OASIS、DRC／LVS／PEX報告、PDK或可重現的routing輸出。配置提案與參考論文不等同已通過製程驗證。所有原始位元組與來源包一致；SHA-256及相同舊repo路徑見 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到placement總覽](../README.md) · [回到e516總覽](../../README.md)
