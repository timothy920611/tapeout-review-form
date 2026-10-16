# 殘差放大器與緩衝器

包含AnalogAgent NC 6nm GAA、NC-assisted 6nm，以及source-follower 5nm／7nm三組電路。來源由原分類表標示AnalogAgent／TKU2與ISSCC 2021參考架構，版本日期集中於2026年6月。

直接備份來源：`00_Netlist_依電路分類.zip`，由repo擁有者蒐集提供；詳細日期、版本及產生方式見上層原附分類表。

## 本層檔案

| 原始檔案 | 大小（bytes） |
| --- | ---: |
| [AnalogAgent_NC_ResAmp_6nm_GAA.netlist](AnalogAgent_NC_ResAmp_6nm_GAA.netlist) | 33015 |
| [AnalogAgent_NC_ResAmp_6nm_GAA.txt](AnalogAgent_NC_ResAmp_6nm_GAA.txt) | 33015 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed.netlist) | 33689 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed.txt) | 33689 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v2.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v2.netlist) | 37508 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v2.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v2.txt) | 37508 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v3.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v3.netlist) | 42270 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v3.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v3.txt) | 42270 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v4.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v4.netlist) | 47404 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v4.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v4.txt) | 47404 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v5.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v5.netlist) | 52147 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v5.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v5.txt) | 52147 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v6.netlist](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v6.netlist) | 59955 |
| [AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v6.txt](AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v6.txt) | 59955 |
| [NC_assisted_ResAmp_6nm.netlist](NC_assisted_ResAmp_6nm.netlist) | 25867 |
| [NC_assisted_ResAmp_6nm.txt](NC_assisted_ResAmp_6nm.txt) | 25867 |
| [SF_ResAmp_5nm7nm.sp](SF_ResAmp_5nm7nm.sp) | 41972 |
| [SF_ResAmp_5nm7nm.txt](SF_ResAmp_5nm7nm.txt) | 41972 |
| [SF_ResAmp_5nm7nm_fixed.sp](SF_ResAmp_5nm7nm_fixed.sp) | 41933 |
| [SF_ResAmp_5nm7nm_fixed.txt](SF_ResAmp_5nm7nm_fixed.txt) | 41933 |
| [SF_ResAmp_5nm7nm_fixed_v2.sp](SF_ResAmp_5nm7nm_fixed_v2.sp) | 50685 |
| [SF_ResAmp_5nm7nm_fixed_v2.txt](SF_ResAmp_5nm7nm_fixed_v2.txt) | 50685 |
| [SF_ResAmp_5nm7nm_fixed_v3.sp](SF_ResAmp_5nm7nm_fixed_v3.sp) | 52728 |
| [SF_ResAmp_5nm7nm_fixed_v3.txt](SF_ResAmp_5nm7nm_fixed_v3.txt) | 52728 |
| [SF_ResAmp_5nm7nm_fixed_v4.sp](SF_ResAmp_5nm7nm_fixed_v4.sp) | 60119 |
| [SF_ResAmp_5nm7nm_fixed_v4.txt](SF_ResAmp_5nm7nm_fixed_v4.txt) | 60119 |
| [SF_ResAmp_5nm7nm_fixed_v5.sp](SF_ResAmp_5nm7nm_fixed_v5.sp) | 71046 |
| [SF_ResAmp_5nm7nm_fixed_v6.sp](SF_ResAmp_5nm7nm_fixed_v6.sp) | 78174 |
| [SF_ResAmp_5nm7nm_fixed_v7.sp](SF_ResAmp_5nm7nm_fixed_v7.sp) | 90414 |

## 使用與限制

AnalogAgent系列保存初版至fixed_v6；SF系列保存初版至fixed_v7。比較版本時先讀檔尾修正紀錄，再核對連線、bulk tie、時序與模型名稱。`.txt`配對檔保留作閱讀副本。

29個原始檔與舊Netlist分類中的04、06、08相同。SF fixed_v7自述為未驗證的架構藍圖；多數模型未附，不可把論文性能當作這份電路已模擬結果。

原檔未改寫，改動與模擬輸出請另存工作副本。檔案SHA-256與歷史重複路徑（整理前路徑，非現存連結）可查 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到電路分類總覽](../README.md) · [回到e516總覽](../../README.md)
