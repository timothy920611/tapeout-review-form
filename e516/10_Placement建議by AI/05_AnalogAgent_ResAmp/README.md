# NC輔助殘差放大器：電路與 placement 交接

以NC_RA_TOP_10b_500MS相關階層為對象，保存靜態電路審查與6nm配置提案。報告明列pin-count、控制連線等待修問題；AnalogAgent參考PDF是設計自動化框架論文。

來源為提供者上傳的 `10_2.zip`，原始相對目錄 `05_AnalogAgent_ResAmp` 保留原樣，包括名稱中的空白與尾綴2。這些名稱是來源資料的一部分，不代表本次新建的版本號。

## 本層檔案

| 原始檔案 | 用途 |
| --- | --- |
| [AnalogAgent_ResAmp Placement Review.pdf](AnalogAgent_ResAmp%20Placement%20Review.pdf) | AI配置／審查提案PDF |
| [Netlist AnalogAgent_ResAmp.txt](Netlist%20AnalogAgent_ResAmp.txt) | 電路netlist（文字） |
| [論文AnalogAgent_ResAmp.pdf](%E8%AB%96%E6%96%87AnalogAgent_ResAmp.pdf) | 參考文獻PDF |

## 使用方式與限制

先讀配置／審查提案了解top cell、分區、相依與待確認事項，再對照 `Netlist AnalogAgent_ResAmp.txt` 的階層及連線，最後回查參考PDF。placement文件的假設、尺寸、製程對應與SHA聲明應以原文及目前檔案另行核對，這次沒有更改電路或執行實體設計流程。

本層只有netlist與PDF，沒有實際GDS／OASIS、DRC／LVS／PEX報告、PDK或可重現的routing輸出。配置提案與參考論文不等同已通過製程驗證。所有原始位元組與來源包一致；SHA-256及相同舊repo路徑見 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到placement總覽](../README.md) · [回到e516總覽](../../README.md)
