Netlist 依電路分類整理
========================

你的 AI 生成 SPICE netlist，依「電路類型」分成 5 類（共 32 個設計、49 個檔案）。
表格另含「設計階段」與「驗證狀態」兩欄。

資料夾
------
01_StrongARM比較器/                (4 檔)
02_殘差放大器_Residue_Amplifier/    (29 檔)
03_Pipelined_SAR_DSM_ADC/          (4 檔)
04_SAR_ADC/                        (8 檔)
05_ADC_SoC系統整合/                (4 檔)
Netlist_電路分類表.xlsx            完整清單（含電路分類統計、設計階段統計分頁）
Netlist_電路分類表.md              同內容 Markdown 版

設計階段（IC 設計流程位置）
--------------------------
- 佈局前(示意圖級)：28 個。只有電晶體與 .subckt，無佈局寄生，多為 AI 生成草稿。
- 佈局前(測試平台)：1 個。模擬用 testbench。
- 類佈局後(手動估寄生)：2 個。攤平示意圖 + 手動集總寄生估值（非抽取工具）。
- 佈局後(寄生抽取)：1 個。Calibre xRC 實體抽取、post-LVS、含耦合電容。

其他說明
--------
- 檔名保留原樣（tb_strongarm_n5.sp 會 .include STRONGARM_N_PARALLEL.sp，已同資料夾）。
- 每個 .sp/.netlist 多附一份相同的 .txt，一併保留。
- 已略過 20260605netlist.zip（與同資料夾散檔重複）。
