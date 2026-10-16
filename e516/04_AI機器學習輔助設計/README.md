# AI／機器學習輔助設計

資料由提供者從各方面蒐集後，以 `04_01.zip`、`04_02.zip` 分包上傳，另直接提供第13份RAIL報告。本目錄合併兩包與直接附件，保留原檔名；原包中的PDF直接位於包根目錄，未為分包另建研究分類。收錄ANN最佳化、LLM sizing、GNN、AMS合成、AnalogAgent、LayoutCopilot、GLayout、SPICE驗證及RAIL等主題。

## 文件索引

以下年份、出處與關鍵字取自原附[論文分類總表](../論文分類總表.md)，原作者與完整引用以PDF正文為準。

| 原始文件 | 原表年份／出處 | 主題 |
| --- | --- | --- |
| [01_A Global-Local Optimization Approach for Asynchronous SAR ADC Design (ANN surrogate).pdf](01_A%20Global-Local%20Optimization%20Approach%20for%20Asynchronous%20SAR%20ADC%20Design%20%28ANN%20surrogate%29.pdf) | 2024；Univ. of Glasgow / Georgia Tech | ANN代理模型、差分演化、SAR最佳化 |
| [02_An LLM-assisted Analog IC Design Tool with Automatic Topology Selection and Circuit Sizing (SMACD 2025).pdf](02_An%20LLM-assisted%20Analog%20IC%20Design%20Tool%20with%20Automatic%20Topology%20Selection%20and%20Circuit%20Sizing%20%28SMACD%202025%29.pdf) | 2025；IEEE SMACD (NYCU) | LLM、拓樸選擇、ANN sizing |
| [03_Analog Mixed-Signal Circuit Synthesis Enabled by Circuit Architectures and ML (ASP-DAC 2022).pdf](03_Analog%20Mixed-Signal%20Circuit%20Synthesis%20Enabled%20by%20Circuit%20Architectures%20and%20ML%20%28ASP-DAC%202022%29.pdf) | 2022；ASP-DAC (USC) | AMS 合成、數位密集架構、ML |
| [04_GNN-RE - Graph Neural Networks for Reverse Engineering of Gate-Level Netlists (TCAD 2022).pdf](04_GNN-RE%20-%20Graph%20Neural%20Networks%20for%20Reverse%20Engineering%20of%20Gate-Level%20Netlists%20%28TCAD%202022%29.pdf) | 2022；IEEE TCAD | GNN、網表逆向工程、子電路分類 |
| [05_Generative AI for Analog Integrated Circuit Design - Methodologies and Applications (IEEE Access 2025).pdf](05_Generative%20AI%20for%20Analog%20Integrated%20Circuit%20Design%20-%20Methodologies%20and%20Applications%20%28IEEE%20Access%202025%29.pdf) | 2025；IEEE Access | 生成式AI、GNN/LLM/VAE、回顧 |
| [06_Joint Optimization of Sequential Elements and Metal Layer Usage Using AI-ML (JCSTS 2025).pdf](06_Joint%20Optimization%20of%20Sequential%20Elements%20and%20Metal%20Layer%20Usage%20Using%20AI-ML%20%28JCSTS%202025%29.pdf) | 2025；JCSTS (AMD) | GNN+強化學習、金屬層分配、物理設計 |
| [07_Toward End-to-End Analog Design Automation with ML and Data-Driven Approaches (ASP-DAC 2024).pdf](07_Toward%20End-to-End%20Analog%20Design%20Automation%20with%20ML%20and%20Data-Driven%20Approaches%20%28ASP-DAC%202024%29.pdf) | 2024；ASP-DAC (UT Austin) | 端到端自動化、layout-aware sizing、回顧 |
| [08_AnalogAgent - Self-Improving Analog Circuit Design Automation with LLM Agents (arXiv 2026).pdf](08_AnalogAgent%20-%20Self-Improving%20Analog%20Circuit%20Design%20Automation%20with%20LLM%20Agents%20%28arXiv%202026%29.pdf) | 2026；arXiv (NTU Singapore) | LLM agent、自我改進、類比自動化 |
| [09_LayoutCopilot - An LLM-Powered Multiagent Framework for Interactive Analog Layout Design (TCAD 2025).pdf](09_LayoutCopilot%20-%20An%20LLM-Powered%20Multiagent%20Framework%20for%20Interactive%20Analog%20Layout%20Design%20%28TCAD%202025%29.pdf) | 2025；IEEE TCAD (PKU) | LLM 多代理、互動式類比佈局 |
| [10_Large Language Model (LLM) for Standard Cell Layout Design Optimization (LAD 2024).pdf](10_Large%20Language%20Model%20%28LLM%29%20for%20Standard%20Cell%20Layout%20Design%20Optimization%20%28LAD%202024%29.pdf) | 2024；IEEE LAD Workshop (NVIDIA) | LLM、標準單元佈局、PPA最佳化 |
| [11_Human Language to Analog Layout Using GLayout Layout Automation Framework (2026).pdf](11_Human%20Language%20to%20Analog%20Layout%20Using%20GLayout%20Layout%20Automation%20Framework%20%282026%29.pdf) | 2026；研討會 / arXiv | 自然語言、GLayout、類比佈局自動化 |
| [12_SPICED+ - Bug Pattern Identification and Correction of Trojans in A-MS Circuits Using LLM (TVLSI 2025).pdf](12_SPICED%2B%20-%20Bug%20Pattern%20Identification%20and%20Correction%20of%20Trojans%20in%20A-MS%20Circuits%20Using%20LLM%20%28TVLSI%202025%29.pdf) | 2025；IEEE TVLSI | LLM、SPICE netlist、木馬偵測與修正 |

## 閱讀與完整性

先讀05／07綜述建立流程全貌；拓樸與sizing讀01／02／03；網表讀04／12；多代理與互動佈局讀08／09／11；標準單元最佳化讀10。這裡保存的是研究文件，沒有附各工具的完整程式碼、模型、PDK、API認證或可執行環境。

原分類表的13份現已全部收到：01–12來自兩個ZIP，第13份 **Resilient Analog Instance Language (RAIL) Enabled Open-Source Mixed-Signal Circuits**（2023，AFRL技術報告）由提供者另行上傳，見下列連結。該報告涉及RAIL語言與開源混合訊號自動化，可在閱讀其他工具方法後查閱。原附分類表與來源檔未改寫。

- [13_RAIL 原始技術報告](13_Resilient%20Analog%20Instance%20Language%20%28RAIL%29%20Enabled%20Open-Source%20Mixed-Signal%20Circuits%20%28AFRL%202023%29.pdf)

兩份來源ZIP及逐檔SHA-256均保存；AI相關方法與文獻內容不等同本repo已完成其系統重現。

`11_Human Language to Analog Layout...`的7頁PDF無法直接擷取文字，但已成功渲染並檢視首頁，可用一般PDF閱讀器閱讀，需要全文搜尋時應另做OCR工作副本。原檔名與分類表標2026，首頁ACM Reference Format則列MLCAD 2024；保留原檔命名，引用時應依正文核對年份與DOI（10.1145/3670474.3685971）。

[回到e516總覽](../README.md) · [來源清單](../FILE_INVENTORY.csv)
