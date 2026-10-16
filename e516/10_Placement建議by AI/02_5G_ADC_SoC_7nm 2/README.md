# 5G ADC SoC：電路與 placement 交接

以ADC_5G_SOC_12b為對象。placement文中使用ASAP7／Calibre作規則示例；參考PDF實際題名為6nm feedback-factor-compensation pipelined SAR ADC，不是整顆5G SoC的實作證據。

來源為提供者上傳的 `10_1.zip`，原始相對目錄 `02_5G_ADC_SoC_7nm 2` 保留原樣，包括名稱中的空白與尾綴2。這些名稱是來源資料的一部分，不代表本次新建的版本號。

## 本層檔案

| 原始檔案 | 用途 |
| --- | --- |
| [5G_ADC_SoC_7nm_placement_plan.pdf](5G_ADC_SoC_7nm_placement_plan.pdf) | AI配置／審查提案PDF |
| [Netlist 5G_ADC_SoC_7nm.txt](Netlist%205G_ADC_SoC_7nm.txt) | 電路netlist（文字） |
| [論文 5G_ADC_SoC_7nm.pdf](%E8%AB%96%E6%96%87%205G_ADC_SoC_7nm.pdf) | 參考文獻PDF |

## 使用方式與限制

先讀配置／審查提案了解top cell、分區、相依與待確認事項，再對照 `Netlist 5G_ADC_SoC_7nm.txt` 的階層及連線，最後回查參考PDF。placement文件的假設、尺寸、製程對應與SHA聲明應以原文及目前檔案另行核對，這次沒有更改電路或執行實體設計流程。

本層只有netlist與PDF，沒有實際GDS／OASIS、DRC／LVS／PEX報告、PDK或可重現的routing輸出。配置提案與參考論文不等同已通過製程驗證。所有原始位元組與來源包一致；SHA-256及歷史重複路徑（整理前路徑，非現存連結）見 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到placement總覽](../README.md) · [回到e516總覽](../../README.md)
