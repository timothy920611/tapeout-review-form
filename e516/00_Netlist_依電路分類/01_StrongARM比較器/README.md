# StrongARM 動態比較器

保存6nm aux-gated草稿、65nm Razavi型、N=5 parallel-path型與其testbench，供了解比較器拓樸及模擬相依。原分類表記錄2026-06-26，來源分別標示TKU2、Razavi SSCM 2015與Siddharth TCAS-II 2020；這些是原附資料的歸因。

直接備份來源：`00_Netlist_依電路分類.zip`，由repo擁有者蒐集提供；詳細日期、版本及產生方式見上層原附分類表。

## 本層檔案

| 原始檔案 | 大小（bytes） |
| --- | ---: |
| [COMP_STRARM_core_Nparallel_auxgated_6nm.txt](COMP_STRARM_core_Nparallel_auxgated_6nm.txt) | 12482 |
| [STRONGARM_N_PARALLEL.sp](STRONGARM_N_PARALLEL.sp) | 3709 |
| [STRONGARM_RAZAVI_65nm_v1.netlist](STRONGARM_RAZAVI_65nm_v1.netlist) | 7335 |
| [tb_strongarm_n5.sp](tb_strongarm_n5.sp) | 1612 |

## 使用與限制

對照 [比較器論文](../../01_動態比較器與StrongARM_Latch/README.md) 的01、02、03號文件。`STRONGARM_N_PARALLEL.sp` 與 `tb_strongarm_n5.sp` 必須同層，相對 `.include` 才能解析。通用模型只適合基本連接檢查；6nm檔需真實PDK。

本組四檔與已移除的舊分類完全相同，現以本目錄為保留版本。Netlist 由 AI 生成，流程見 [上層說明](../README.md#ai-生成與迭代流程)。

舊 README 曾記錄 ngspice 暫態可執行，但 `vdiff_out` 的 `v(voutp,voutn)` 未找到對應向量，`t_resolve` 選到觸發前的交越而得到負延遲。這些是移除舊目錄前轉錄的已知問題，本次未重跑模擬，也未修改原始量測定義。

原檔未改寫，改動與模擬輸出請另存工作副本。檔案SHA-256與歷史重複路徑（整理前路徑，非現存連結）可查 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到電路分類總覽](../README.md) · [回到e516總覽](../../README.md)
