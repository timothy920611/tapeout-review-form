# SAR ADC 架構與電路設計

收錄8份SAR／pipelined-SAR ADC文獻，從6nm負電容回授補償、電流模殘差、7nm SAR＋DSM，到設計分割、生醫與其他FinFET節點。用途是理解系統架構與各電路規格的來源。

來源為提供者從各方面蒐集後上傳的 `02_SAR_ADC架構與電路設計.zip`，按包內原路徑展開。下表的年份、出處與主題轉錄自原附 [論文分類總表](../論文分類總表.md)，原作者姓名與完整引文以各PDF正文為準；這次沒有另行聲稱下載來源或發表資訊已經外部查證。

## 文件索引

| 原始檔案 | 原表年份／出處 | 主題 |
| --- | --- | --- |
| [01_A 10-Bit 500-MS-s Pipelined SAR ADC with Feedback Factor Compensation in 6-nm FinFET (TCAS-II 2025).pdf](01_A%2010-Bit%20500-MS-s%20Pipelined%20SAR%20ADC%20with%20Feedback%20Factor%20Compensation%20in%206-nm%20FinFET%20%28TCAS-II%202025%29.pdf) | 2025；IEEE TCAS-II | pipelined SAR、負電容NC、residue amp |
| [02_A 9.1-ENOB 10-Bit 500-MS-s Pipelined-SAR ADC with Current-Mode Residue (JSSC 2019).pdf](02_A%209.1-ENOB%2010-Bit%20500-MS-s%20Pipelined-SAR%20ADC%20with%20Current-Mode%20Residue%20%28JSSC%202019%29.pdf) | 2019；IEEE JSSC | pipelined-SAR、電流模residue |
| [03_A 12b 600MS-s Pipelined SAR and 2x-Interleaved Incremental Delta-Sigma ADC in 7nm FinFET (ISSCC 2021).pdf](03_A%2012b%20600MS-s%20Pipelined%20SAR%20and%202x-Interleaved%20Incremental%20Delta-Sigma%20ADC%20in%207nm%20FinFET%20%28ISSCC%202021%29.pdf) | 2021；ISSCC (10.5) | pipelined SAR、incremental DSM、source-follower residue |
| [04_A Novel Approach to Design SAR-ADC - Design Partitioning Method (TCAD 2016).pdf](04_A%20Novel%20Approach%20to%20Design%20SAR-ADC%20-%20Design%20Partitioning%20Method%20%28TCAD%202016%29.pdf) | 2016；IEEE TCAD | SAR ADC 建模、LUT、架構評估 |
| [05_Design and Implementation of High-Speed Low-Power 12-bit SAR ADC using 22nm FinFET (WSEAS 2022).pdf](05_Design%20and%20Implementation%20of%20High-Speed%20Low-Power%2012-bit%20SAR%20ADC%20using%2022nm%20FinFET%20%28WSEAS%202022%29.pdf) | 2022；WSEAS Trans. Systems & Control | 12-bit SAR、低功耗、OTA |
| [06_Design and Simulation of 10-Bit SAR ADC Using 18nm FinFET (ISCAIE 2024).pdf](06_Design%20and%20Simulation%20of%2010-Bit%20SAR%20ADC%20Using%2018nm%20FinFET%20%28ISCAIE%202024%29.pdf) | 2024；IEEE ISCAIE | 10-bit SAR、模擬驗證 |
| [07_Design, Implementation and Analysis of a Low-Power SAR ADC for Biomedical Applications (MSc Thesis 2025).pdf](07_Design%2C%20Implementation%20and%20Analysis%20of%20a%20Low-Power%20SAR%20ADC%20for%20Biomedical%20Applications%20%28MSc%20Thesis%202025%29.pdf) | 2025；碩士論文 (CSU Long Beach) | 生醫應用、低功耗SAR、碩士論文 |
| [08_Highly Efficient FinFET-Based Analog-to-Digital Converter Design (Cureus 2025).pdf](08_Highly%20Efficient%20FinFET-Based%20Analog-to-Digital%20Converter%20Design%20%28Cureus%202025%29.pdf) | 2025；Cureus Journal of Engineering | FinFET ADC、高速數位應用 |

## 使用方式

先讀01–03比較殘差處理，再讀04的建模／分割方法；05–08用來拓展不同製程與應用。可對照00分類的殘差放大器及SAR／DSM netlist，但這些AI草稿並不是原論文完整重製。

各PDF均保留原始位元組，開啟請使用一般PDF閱讀器；來源與校驗值見 [FILE_INVENTORY.csv](../FILE_INVENTORY.csv)。文件可讀性檢查不等同研究結果可重現，實際製程、模擬與量測條件需回查原文。自製或AI筆記的整理敘述應與正式文獻區分。

[回到e516總覽](../README.md)
