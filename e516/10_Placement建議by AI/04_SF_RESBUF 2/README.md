# Source-follower殘差傳遞：電路與 placement 交接

以SF_RESBUF_12b_600MS為對象，placement PDF描述短路徑、replica匹配與各通道獨立驅動三種假設方案；參考PDF為5nm FinFET類比／混合訊號設計挑戰文獻。

來源為提供者上傳的 `10_2.zip`，原始相對目錄 `04_SF_RESBUF 2` 保留原樣，包括名稱中的空白與尾綴2。這些名稱是來源資料的一部分，不代表本次新建的版本號。

## 本層檔案

| 原始檔案 | 用途 |
| --- | --- |
| [Netlist SF_RESBUF.txt](Netlist%20SF_RESBUF.txt) | 電路netlist（文字） |
| [SF_RESBUF_Placement.pdf](SF_RESBUF_Placement.pdf) | AI配置／審查提案PDF |
| [論文 SF_RESBUF.pdf](%E8%AB%96%E6%96%87%20SF_RESBUF.pdf) | 參考文獻PDF |

## 使用方式與限制

先讀配置／審查提案了解top cell、分區、相依與待確認事項，再對照 `Netlist SF_RESBUF.txt` 的階層及連線，最後回查參考PDF。placement文件的假設、尺寸、製程對應與SHA聲明應以原文及目前檔案另行核對，這次沒有更改電路或執行實體設計流程。

本層只有netlist與PDF，沒有實際GDS／OASIS、DRC／LVS／PEX報告、PDK或可重現的routing輸出。配置提案與參考論文不等同已通過製程驗證。所有原始位元組與來源包一致；SHA-256及歷史重複路徑（整理前路徑，非現存連結）見 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到placement總覽](../README.md) · [回到e516總覽](../../README.md)
