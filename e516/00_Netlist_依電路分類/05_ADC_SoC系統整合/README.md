# 5G／光通訊 ADC SoC

保存5G_ADC_SoC_7nm與Coherent_OPT_ADC_SoC_7nm兩組系統netlist，各附一份相同.txt。原分類表來源標示TKU2，日期2026-05-29，描述7nm FinFET架構草稿。

直接備份來源：`00_Netlist_依電路分類.zip`，由repo擁有者蒐集提供；詳細日期、版本及產生方式見上層原附分類表。

## 本層檔案

| 原始檔案 | 大小（bytes） |
| --- | ---: |
| [5G_ADC_SoC_7nm.netlist](5G_ADC_SoC_7nm.netlist) | 27237 |
| [5G_ADC_SoC_7nm.txt](5G_ADC_SoC_7nm.txt) | 27237 |
| [Coherent_OPT_ADC_SoC_7nm.netlist](Coherent_OPT_ADC_SoC_7nm.netlist) | 23875 |
| [Coherent_OPT_ADC_SoC_7nm.txt](Coherent_OPT_ADC_SoC_7nm.txt) | 23875 |

## 使用與限制

前者目標12-bit／12GSPS、4路交錯及JESD204B；後者目標8-bit／64GSPS、8路交錯及PAM4。適合比較系統分塊與介面，不應當作已完成SoC的可重現設計。

四檔與舊分類09、10相同。實際N7 PDK、部分系統實作及完整驗證證據未附；規格是原檔目標值。

原檔未改寫，改動與模擬輸出請另存工作副本。檔案SHA-256與歷史重複路徑（整理前路徑，非現存連結）可查 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到電路分類總覽](../README.md) · [回到e516總覽](../../README.md)
