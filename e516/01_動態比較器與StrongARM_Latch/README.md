# 動態比較器與 StrongARM Latch

這裡保存提供者從各方面蒐集整理的11份PDF，直接來源為 `01_動態比較器與StrongARM_Latch.zip`。01–08為論文／教學文章，09–11是原檔名標示的自製摘要或AI輔助筆記。作者與出版資訊以下列PDF首頁及既有檔名為依據；不是把所有內容歸為蒐集者原創。

## 文件索引

| 原始檔案 | 原作者／出處紀錄 | 閱讀重點 |
| --- | --- | --- |
| [01_The StrongARM Latch - A Circuit for All Seasons (Razavi 2015).pdf](01_The%20StrongARM%20Latch%20-%20A%20Circuit%20for%20All%20Seasons%20%28Razavi%202015%29.pdf) | Behzad Razavi；IEEE Solid-State Circuits Magazine，2015 | StrongARM基本拓樸、reset／amplification／regeneration操作與設計取捨 |
| [02_Understanding the Regenerative Comparator Circuit (Abidi 2014).pdf](02_Understanding%20the%20Regenerative%20Comparator%20Circuit%20%28Abidi%202014%29.pdf) | Asad Abidi、Hao Xu；檔名年份2014 | 以等效電路理解再生比較器的動態、失調與雜訊 |
| [03_A 1-V 3-GHz StrongARM Latch Voltage Comparator (TCAS-II 2020).pdf](03_A%201-V%203-GHz%20StrongARM%20Latch%20Voltage%20Comparator%20%28TCAS-II%202020%29.pdf) | R. K. Siddharth et al.；IEEE TCAS-II，2020 | 65nm、1V、3GHz平行路徑StrongARM；對照N-parallel netlist |
| [04_A 1.2-V Dynamic Bias Latch-Type Comparator with 0.4-mV Noise (JSSC 2018).pdf](04_A%201.2-V%20Dynamic%20Bias%20Latch-Type%20Comparator%20with%200.4-mV%20Noise%20%28JSSC%202018%29.pdf) | Harijot Singh Bindra et al.；IEEE JSSC，2018 | dynamic-bias前置放大器、能耗與輸入雜訊的權衡 |
| [05_A 19 fJ-op Low-Offset StrongARM Latch Comparator (ISCAS 2024).pdf](05_A%2019%20fJ-op%20Low-Offset%20StrongARM%20Latch%20Comparator%20%28ISCAS%202024%29.pdf) | Abdullah Alshehri、Khaled Salama、Hossein Fariborzi；ISCAS，2024 | 低功耗與低失調StrongARM，閱讀其post-layout條件 |
| [06_Analysis and Design of a Low-Voltage Low-Power Double-Tail Comparator (TVLSI 2014).pdf](06_Analysis%20and%20Design%20of%20a%20Low-Voltage%20Low-Power%20Double-Tail%20Comparator%20%28TVLSI%202014%29.pdf) | Samaneh Babayan-Mashhadi、Reza Lotfi；IEEE TVLSI，2014 | 低電壓double-tail拓樸與延遲分析 |
| [07_Design of Strong-Arm Latch Comparator for Low-Power 12-bit SAR ADC (ICICACS 2024).pdf](07_Design%20of%20Strong-Arm%20Latch%20Comparator%20for%20Low-Power%2012-bit%20SAR%20ADC%20%28ICICACS%202024%29.pdf) | Pinninti Kishore et al.；ICICACS，2024 | 以12-bit SAR ADC為應用背景的StrongARM設計 |
| [08_Kickback Noise Reduction Techniques for CMOS Latched Comparators (TCAS-II 2006).pdf](08_Kickback%20Noise%20Reduction%20Techniques%20for%20CMOS%20Latched%20Comparators%20%28TCAS-II%202006%29.pdf) | Pedro M. Figueiredo、João C. Vital；IEEE TCAS-II，2006 | kickback形成機制與抑制方法 |
| [09_[自製摘要] 6nm FinFET StrongARM Latch 設計要點 Executive Summary.pdf](09_%5B%E8%87%AA%E8%A3%BD%E6%91%98%E8%A6%81%5D%206nm%20FinFET%20StrongARM%20Latch%20%E8%A8%AD%E8%A8%88%E8%A6%81%E9%BB%9E%20Executive%20Summary.pdf) | 檔名標示自製摘要；原作者／工具未另附明確紀錄 | 6nm FinFET StrongARM重點彙整；屬二手摘要，需對照原始論文 |
| [10_[自製筆記] High-Speed StrongARM Latch in 6nm FinFET - Core Techniques (by Claude).pdf](10_%5B%E8%87%AA%E8%A3%BD%E7%AD%86%E8%A8%98%5D%20High-Speed%20StrongARM%20Latch%20in%206nm%20FinFET%20-%20Core%20Techniques%20%28by%20Claude%29.pdf) | 檔名標示自製筆記、by Claude；模型版本與對話未附 | 6nm FinFET高速比較器的核心技術與挑戰彙整 |
| [11_[自製筆記] StrongARM Latch 6nm FinFET 高速設計技術與文獻回顧 (by Claude).pdf](11_%5B%E8%87%AA%E8%A3%BD%E7%AD%86%E8%A8%98%5D%20StrongARM%20Latch%206nm%20FinFET%20%E9%AB%98%E9%80%9F%E8%A8%AD%E8%A8%88%E6%8A%80%E8%A1%93%E8%88%87%E6%96%87%E7%8D%BB%E5%9B%9E%E9%A1%A7%20%28by%20Claude%29.pdf) | 檔名標示自製筆記、by Claude；模型版本與對話未附 | 6nm FinFET高速設計與文獻回顧；引用與推論需回查原文 |

## 建議閱讀順序

先讀01建立拓樸與時序觀念，再讀02理解再生動態；研究速度可讀03、05，研究雜訊與功耗可讀04、06、08，最後讀07了解SAR應用。09–11適合整理術語與問題清單，關鍵公式、製程數字與設計結論仍應回查所引論文。

對照電路可前往 [00分類的StrongARM資料](../00_Netlist_依電路分類/01_StrongARM比較器/README.md)。這是主題關聯，並不表示每篇論文都有完整對應netlist或可重現的量測環境。

## 保存與限制

11份PDF均完成全文文字擷取檢查，可用一般PDF閱讀器開啟；這只驗證檔案可讀。論文的公開連結、DOI、下載日期與完整AI對話尚未統一建立，已知資訊保留於原文。備份未新增統一授權，原文件的作者與出版者標示保留不變。

[回到e516總覽](../README.md) · [原始來源清單](../FILE_INVENTORY.csv)
