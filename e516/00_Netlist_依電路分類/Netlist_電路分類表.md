# Netlist 電路分類表

共 32 個 netlist 設計、49 個檔案（含 18 份 .txt 副本）。

> 每個標「有 .txt」的主檔另附一份內容完全相同的 .txt。

## 電路分類統計

| 電路分類 | 設計數 | 檔案數(含.txt) | 說明 |
|---|---:|---:|---|
| 01 StrongARM 比較器 | 4 | 4 | StrongARM 動態鎖存比較器（Razavi/Siddharth 型、N 平行路徑、6nm 版與 testbench） |
| 02 殘差放大器 (Residue Amplifier) | 16 | 29 | Pipelined SAR 用的殘差放大器/緩衝（NC 負電容輔助、Source-follower、AnalogAgent GAA），含多次修正版 |
| 03 Pipelined SAR + Delta-Sigma ADC | 3 | 4 | Pipelined SAR + 連續時間增量 Delta-Sigma 兩級 ADC（依 ISSCC 2021） |
| 04 SAR ADC | 7 | 8 | 各解析度 SAR ADC（4-bit 0.18µm、10-bit 40nm/180nm，含 pre/post-layout） |
| 05 ADC SoC 系統整合 | 2 | 4 | 完整 ADC 系統晶片（TI Pipelined-SAR + PLL + SerDes） |
| **合計** | **32** | **49** | — |

## 設計階段統計

| 設計階段 | 設計數 | 說明 |
|---|---:|---|
| 佈局前(示意圖級) | 28 | 只有電晶體與 .subckt，無任何佈局寄生；設計流程最前段，多為 AI 生成草稿 |
| 佈局前(測試平台) | 1 | 模擬用的 testbench（供給訊號/電源），非設計本體 |
| 類佈局後(手動估寄生) | 2 | 示意圖攤平後手動加上集總寄生估值（整數估算，非抽取工具產出） |
| 佈局後(寄生抽取) | 1 | 由 Calibre xRC 從實體佈局抽取的完整寄生 R+C（post-LVS） |

## 01 StrongARM 比較器（4 個設計）

| 檔名 | 日期 | 版本 | 設計階段 | 驗證狀態 | 製程節點 | 規格／Top Cell | 產生方式／來源 | 說明 | .txt |
|---|:--:|:--:|---|---|:--:|---|---|---|:--:|
| COMP_STRARM_core_Nparallel_auxgated_6nm.txt | 20260626 | — | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET | VDD0.9V, 3GHz BW | TKU2 產生 | 6nm StrongARM + N 平行放電路徑 + aux-gated（僅 .txt） | — |
| STRONGARM_N_PARALLEL.sp | 20260626 | — | 佈局前(示意圖級) | 草稿待驗證(未驗證估值×3、待PDK確認×3、待sim確認×1) | 65nm CMOS | VDD1.0V, 3GHz | 依 Siddharth TCAS-II 2020 | StrongARM + N=5 平行路徑輸出加速 | — |
| STRONGARM_RAZAVI_65nm_v1.netlist | 20260626 | v1 | 佈局前(示意圖級) | 草稿待驗證(未驗證估值×1、待PDK確認×5、待sim確認×3) | 65nm CMOS | StrongARM latch + NAND-SR | 依 Razavi SSCM2015 Fig.1(b) | Razavi 修改型 StrongARM 鎖存 + SR latch 緩衝 | — |
| tb_strongarm_n5.sp | 20260626 | — | 佈局前(測試平台) | 測試平台(前模擬用) | 65nm CMOS | testbench | 手寫測試平台 | STRONGARM_N_PARALLEL 的模擬 testbench（.include 該檔） | — |

## 02 殘差放大器 (Residue Amplifier)（16 個設計）

| 檔名 | 日期 | 版本 | 設計階段 | 驗證狀態 | 製程節點 | 規格／Top Cell | 產生方式／來源 | 說明 | .txt |
|---|:--:|:--:|---|---|:--:|---|---|---|:--:|
| AnalogAgent_NC_ResAmp_6nm_GAA.netlist | 20260603 | base | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent 多代理系統 | NC 殘差放大器（NC_RA_TOP_10b_500MS） | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed.netlist | 20260608 | fixed | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正版 | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v2.netlist | 20260608 | fixed_v2 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正 v2 | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v3.netlist | 20260608 | fixed_v3 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正 v3 | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v4.netlist | 20260608 | fixed_v4 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正 v4 | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v5.netlist | 20260612 | fixed_v5 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正 v5 | 有 |
| AnalogAgent_NC_ResAmp_6nm_GAA_fixed_v6.netlist | 20260612 | fixed_v6 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET GAA | 10b 500MS/s RA | AnalogAgent | NC 殘差放大器 修正 v6 | 有 |
| NC_assisted_ResAmp_6nm.netlist | 20260601 | base | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 6nm FinFET | 10b 500MS/s Pipe-SAR | TKU2/AnalogAgent | NC 負電容輔助殘差放大器（5b粗+RA+6b細） | 有 |
| SF_ResAmp_5nm7nm.sp | 20260603 | base | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | Source-follower 殘差緩衝（SF_RESBUF_12b_600MS） | 有 |
| SF_ResAmp_5nm7nm_fixed.sp | 20260605 | fixed | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正版 | 有 |
| SF_ResAmp_5nm7nm_fixed_v2.sp | 20260605 | fixed_v2 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v2 | 有 |
| SF_ResAmp_5nm7nm_fixed_v3.sp | 20260605 | fixed_v3 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v3 | 有 |
| SF_ResAmp_5nm7nm_fixed_v4.sp | 20260612 | fixed_v4 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v4 | 有 |
| SF_ResAmp_5nm7nm_fixed_v5.sp | 20260615 | fixed_v5 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v5 | — |
| SF_ResAmp_5nm7nm_fixed_v6.sp | 20260615 | fixed_v6 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v6 | — |
| SF_ResAmp_5nm7nm_fixed_v7.sp | 20260617 | fixed_v7 | 佈局前(示意圖級) | 架構藍圖, 未驗證(上線前需模擬) | 7nm/5nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | SF 殘差緩衝 修正 v7（設計藍圖，待模擬驗證） | — |

## 03 Pipelined SAR + Delta-Sigma ADC（3 個設計）

| 檔名 | 日期 | 版本 | 設計階段 | 驗證狀態 | 製程節點 | 規格／Top Cell | 產生方式／來源 | 說明 | .txt |
|---|:--:|:--:|---|---|:--:|---|---|---|:--:|
| pipelined_SAR_DSM_ADC_ISSCC2021.netlist | 20260601 | base | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | Samsung 7nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | Pipelined SAR(7b) + 2x 交錯 CT 增量 Delta-Sigma(6.5b) | 有 |
| pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v2.netlist | 20260617 | fixed_v2 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | Samsung 7nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | Pipelined SAR + DSM 修正 v2 | — |
| pipelined_SAR_DSM_ADC_ISSCC2021_fixed_v3.netlist | 20260617 | fixed_v3 | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | Samsung 7nm FinFET | 12b 600MS/s | 依 ISSCC 2021 | Pipelined SAR + DSM 修正 v3 | — |

## 04 SAR ADC（7 個設計）

| 檔名 | 日期 | 版本 | 設計階段 | 驗證狀態 | 製程節點 | 規格／Top Cell | 產生方式／來源 | 說明 | .txt |
|---|:--:|:--:|---|---|:--:|---|---|---|:--:|
| A_postlayout_1.spice | (根目錄) | post-layout | 類佈局後(手動估寄生) | 含手動估算寄生(未經抽取工具) | 0.18µm CMOS | 4-bit SAR | TKU2 產生 | 4-bit SAR ADC 佈局後（攤平階層） | — |
| A_pre_layout_1.spice | (根目錄) | pre-layout | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 0.18µm CMOS | 4-bit SAR | TKU2 產生 | 4-bit SAR ADC 佈局前 netlist | — |
| B_postlayout_2.spice | (根目錄) | post-layout | 類佈局後(手動估寄生) | 含手動估算寄生(未經抽取工具) | 0.18µm CMOS | 4-bit SAR | TKU2 產生 | 4-bit SAR ADC 佈局後（第2組） | — |
| B_pre_layout_2.spice | (根目錄) | pre-layout | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 0.18µm CMOS | 4-bit SAR | TKU2 產生 | 4-bit SAR ADC 電路級 netlist（第2組） | — |
| C_postlayout_2.netlist | (根目錄) | post-layout | 佈局後(寄生抽取) | 已抽取, LVS clean(待後模擬) | TSMC 180nm CMOS | 10-bit SAR (v2) | Calibre xRC 抽取 | SAR_ADC_10B_v2 佈局後 post-LVS/RC（含寄生R/C） | — |
| SAR_ADC_10bit_500MHz.sp | 20260612 | base | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | 40nm CMOS | 10b 500MS/s 非同步 | TKU2 AnalogAgent（參 Ding TVLSI2018 / OpenSAR） | 階層式 10-bit 非同步 SAR ADC | 有 |
| SAR_ADC_10bit_500MHz_fixed_ver1.sp | 20260617 | fixed_ver1 | 佈局前(示意圖級) | 草稿待驗證(待sim確認×3) | 40nm CMOS | 10b 500MS/s 非同步 | TKU2 AnalogAgent | 10-bit 非同步 SAR ADC 修正 ver1 | — |

## 05 ADC SoC 系統整合（2 個設計）

| 檔名 | 日期 | 版本 | 設計階段 | 驗證狀態 | 製程節點 | 規格／Top Cell | 產生方式／來源 | 說明 | .txt |
|---|:--:|:--:|---|---|:--:|---|---|---|:--:|
| 5G_ADC_SoC_7nm.netlist | 20260529 | — | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | TSMC 7nm FinFET | 12b 12GSPS (4-way TI) | TKU2 產生 | 4-way TI Pipelined-SAR + PLL + 動態RA + JESD204B SerDes | 有 |
| Coherent_OPT_ADC_SoC_7nm.netlist | 20260529 | — | 佈局前(示意圖級) | 示意圖草稿(尚未模擬簽核) | TSMC 7nm FinFET | 8b 64GSPS (8-way TI) | TKU2 產生 | 8-way TI Flash-assisted Pipeline + ADPLL + 400G 光同調 PAM4 SerDes | 有 |
