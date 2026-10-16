# Pipelined SAR＋Delta-Sigma ADC

包含依ISSCC 2021 Session 10.5架構描述的ADC原版、fixed_v2、fixed_v3。原附分類表標示Samsung 7nm、12-bit 600MS/s，日期為2026-06-01及2026-06-17。

直接備份來源：`00_Netlist_依電路分類.zip`，由repo擁有者蒐集提供；詳細日期、版本及產生方式見上層原附分類表。

## 本層檔案

| 原始檔案 | 大小（bytes） |
| --- | ---: |
| [pipelined_SAR_DSM_ADC_ISSCC2021.netlist](pipelined_SAR_DSM_ADC_ISSCC2021.netlist) | 19763 |
| [pipelined_SAR_DSM_ADC_ISSCC2021.txt](pipelined_SAR_DSM_ADC_ISSCC2021.txt) | 19763 |
| [pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v2.netlist](pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v2.netlist) | 25992 |
| [pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v3.netlist](pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v3.netlist) | 29555 |

## 使用與限制

先讀初版架構，再比較v2／v3的keeper、時脈、body tie及連線修正。初版`.txt`是`.netlist`的相同內容副本。

四個原始檔與舊Netlist分類05相同，缺少真實SF7P模型與完整testbench。原表的規格和修正敘述是資料本身的紀錄，沒有在本次備份中重新驗證。

原檔未改寫，改動與模擬輸出請另存工作副本。檔案SHA-256與相同舊repo路徑可查 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到電路分類總覽](../README.md) · [回到e516總覽](../../README.md)
