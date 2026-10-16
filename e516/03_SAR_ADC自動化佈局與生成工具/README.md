# SAR ADC 自動化佈局與生成工具

收錄8份自動化SAR ADC佈局文獻：數位P&R、OpenSAR、混合自動化、FinFET生成框架與CDAC寄生匹配。供選擇佈局流程、研究規格到版圖方法及理解自動化工具限制。

來源為提供者從各方面蒐集後上傳的 `03_SAR_ADC自動化佈局與生成工具.zip`，按包內原路徑展開。下表的年份、出處與主題轉錄自原附 [論文分類總表](../論文分類總表.md)，原作者姓名與完整引文以各PDF正文為準；這次沒有另行聲稱下載來源或發表資訊已經外部查證。

## 文件索引

| 原始檔案 | 原表年份／出處 | 主題 |
| --- | --- | --- |
| [01_SAR ADC Layout Generation Using Digital Place-and-Route Tools (Tsai & Liu 2023).pdf](01_SAR%20ADC%20Layout%20Generation%20Using%20Digital%20Place-and-Route%20Tools%20%28Tsai%20%26%20Liu%202023%29.pdf) | 2023；Tsai & Liu, NTU (研討會) | DPR 佈局、macro-cell、寄生抑制 |
| [02_A 0.0067-mm2 12-bit 20-MS-s SAR ADC Using Digital Place-and-Route Tools in 40-nm CMOS (TVLSI 2022).pdf](02_A%200.0067-mm2%2012-bit%2020-MS-s%20SAR%20ADC%20Using%20Digital%20Place-and-Route%20Tools%20in%2040-nm%20CMOS%20%28TVLSI%202022%29.pdf) | 2022；IEEE TVLSI | DPR 佈局、SAR ADC、超小面積 |
| [03_OpenSAR - An Open Source Automated End-to-end SAR ADC Compiler (ICCAD 2021).pdf](03_OpenSAR%20-%20An%20Open%20Source%20Automated%20End-to-end%20SAR%20ADC%20Compiler%20%28ICCAD%202021%29.pdf) | 2021；IEEE/ACM ICCAD | 開源、端到端SAR編譯器、自動P&R |
| [04_A Circuit-Design-Driven Tool with a Hybrid Automation Approach for SAR ADCs in IoT (ASSCC 2017).pdf](04_A%20Circuit-Design-Driven%20Tool%20with%20a%20Hybrid%20Automation%20Approach%20for%20SAR%20ADCs%20in%20IoT%20%28ASSCC%202017%29.pdf) | 2017；IEEE A-SSCC (研討會) | 混合自動化、IoT SAR、樣板佈局 |
| [05_A Hybrid Design Automation Tool for SAR ADCs in IoT (TVLSI 2018).pdf](05_A%20Hybrid%20Design%20Automation%20Tool%20for%20SAR%20ADCs%20in%20IoT%20%28TVLSI%202018%29.pdf) | 2018；IEEE TVLSI | 混合自動化、IoT SAR、規格到佈局 |
| [06_A 500-MS-s 8-bit SAR ADC from an Automated Layout Generation Framework in 14-nm FinFET (2024).pdf](06_A%20500-MS-s%208-bit%20SAR%20ADC%20from%20an%20Automated%20Layout%20Generation%20Framework%20in%2014-nm%20FinFET%20%282024%29.pdf) | 2024；研討會 (Hanyang Univ.) | 自動佈局框架、FinFET SAR |
| [07_PASTEL - Parasitic Matching-Driven Placement and Routing of Capacitor Arrays in SAR-ADCs (TCAD 2020).pdf](07_PASTEL%20-%20Parasitic%20Matching-Driven%20Placement%20and%20Routing%20of%20Capacitor%20Arrays%20in%20SAR-ADCs%20%28TCAD%202020%29.pdf) | 2020；IEEE TCAD | 電容陣列P&R、寄生匹配、非線性最小化 |
| [08_Placement for Binary-Weighted Capacitive Array in SAR ADC Using Multiple Weighting Methods (TCAD 2014).pdf](08_Placement%20for%20Binary-Weighted%20Capacitive%20Array%20in%20SAR%20ADC%20Using%20Multiple%20Weighting%20Methods%20%28TCAD%202014%29.pdf) | 2014；IEEE TCAD | 電容陣列擺放、匹配、失配抑制 |

## 使用方式

先讀01／02理解DPR流程，再讀03 OpenSAR及04／05混合流程，最後讀07 PASTEL與08電容陣列擺放。04與05是相關研討會／期刊版本，保留兩者；06提供FinFET案例。本目錄只有論文PDF，未附工具原始碼、安裝環境、PDK或可直接執行的流程。

各PDF均保留原始位元組，開啟請使用一般PDF閱讀器；來源與校驗值見 [FILE_INVENTORY.csv](../FILE_INVENTORY.csv)。文件可讀性檢查不等同研究結果可重現，實際製程、模擬與量測條件需回查原文。自製或AI筆記的整理敘述應與正式文獻區分。

[回到e516總覽](../README.md)
