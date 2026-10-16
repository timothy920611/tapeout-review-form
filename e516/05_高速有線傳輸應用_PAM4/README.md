# 高速有線傳輸應用 PAM4

收錄4份PAM4 wireline、接收端AFE及高速時間交錯ADC文獻，供理解ADC在高速連結中的規格、架構與類比前端需求。

來源為提供者從各方面蒐集後上傳的 `05_高速有線傳輸應用_PAM4.zip`，按包內原路徑展開。下表的年份、出處與主題轉錄自原附 [論文分類總表](../論文分類總表.md)，原作者姓名與完整引文以各PDF正文為準；這次沒有另行聲稱下載來源或發表資訊已經外部查證。

## 文件索引

| 原始檔案 | 原表年份／出處 | 主題 |
| --- | --- | --- |
| [01_A 112-Gb-s PAM-4 Long-Reach Wireline Transceiver with 36-Way TI SAR ADC in 7-nm FinFET (JSSC 2021).pdf](01_A%20112-Gb-s%20PAM-4%20Long-Reach%20Wireline%20Transceiver%20with%2036-Way%20TI%20SAR%20ADC%20in%207-nm%20FinFET%20%28JSSC%202021%29.pdf) | 2021；IEEE JSSC | PAM4、有線收發機、時間交錯SAR、RX AFE |
| [02_A 56-Gb-s PAM4 Wireline Transceiver with 32-Way TI SAR ADC in 16-nm FinFET (JSSC 2017).pdf](02_A%2056-Gb-s%20PAM4%20Wireline%20Transceiver%20with%2032-Way%20TI%20SAR%20ADC%20in%2016-nm%20FinFET%20%28JSSC%202017%29.pdf) | 2017；IEEE JSSC | PAM4、有線收發機、時間交錯SAR、CTLE |
| [03_A 64-Gb-s 0.33-pJ-bit PAM4 Receiver Analog Front-End with Triple-Peaking CTLE in 40-nm CMOS (ICAS 2024).pdf](03_A%2064-Gb-s%200.33-pJ-bit%20PAM4%20Receiver%20Analog%20Front-End%20with%20Triple-Peaking%20CTLE%20in%2040-nm%20CMOS%20%28ICAS%202024%29.pdf) | 2024；IEEE ICAS | PAM4 RX AFE、三峰CTLE、VGA |
| [04_A 46GS-s 7-bit Time-Interleaved Time-Domain ADC with Synthesizable Unit ADCs in 16nm FinFET (2025).pdf](04_A%2046GS-s%207-bit%20Time-Interleaved%20Time-Domain%20ADC%20with%20Synthesizable%20Unit%20ADCs%20in%2016nm%20FinFET%20%282025%29.pdf) | 2025；研討會 (Texas A&M / GIST) | 時間域ADC、時間交錯、可合成單元ADC |

## 使用方式

先比較01／02的7nm與16nm時間交錯SAR收發機，再讀03的CTLE接收前端與04的時間域ADC。跨製程比較時應核對功耗、通道、取樣率與量測條件，不單比標題數字。

各PDF均保留原始位元組，開啟請使用一般PDF閱讀器；來源與校驗值見 [FILE_INVENTORY.csv](../FILE_INVENTORY.csv)。文件可讀性檢查不等同研究結果可重現，實際製程、模擬與量測條件需回查原文。自製或AI筆記的整理敘述應與正式文獻區分。

[回到e516總覽](../README.md)
