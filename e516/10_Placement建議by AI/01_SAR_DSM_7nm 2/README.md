# SAR＋DSM ADC：電路與 placement 交接

以PIPE_SAR_DSM_ADC_12b為對象，參考ISSCC 2021 10.5論文，保存電路拆分、placement與驗證前置建議。

來源為提供者上傳的 `10_1.zip`，原始相對目錄 `01_SAR_DSM_7nm 2` 保留原樣，包括名稱中的空白與尾綴2。這些名稱是來源資料的一部分，不代表本次新建的版本號。

## 本層檔案

| 原始檔案 | 用途 |
| --- | --- |
| [SAR_DSM_7nm.netlist](SAR_DSM_7nm.netlist) | 電路netlist（文字） |
| [SAR_DSM_7nm_placement建議.pdf](SAR_DSM_7nm_placement%E5%BB%BA%E8%AD%B0.pdf) | AI配置／審查提案PDF |
| [論文SAR_DSM_7nm.pdf](%E8%AB%96%E6%96%87SAR_DSM_7nm.pdf) | 參考文獻PDF |

## 使用方式與限制

先讀配置／審查提案了解top cell、分區、相依與待確認事項，再對照 `SAR_DSM_7nm.netlist` 的階層及連線，最後回查參考PDF。placement文件的假設、尺寸、製程對應與SHA聲明應以原文及目前檔案另行核對，這次沒有更改電路或執行實體設計流程。

本層只有netlist與PDF，沒有實際GDS／OASIS、DRC／LVS／PEX報告、PDK或可重現的routing輸出。配置提案與參考論文不等同已通過製程驗證。所有原始位元組與來源包一致；SHA-256及歷史重複路徑（整理前路徑，非現存連結）見 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到placement總覽](../README.md) · [回到e516總覽](../../README.md)
