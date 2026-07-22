# Netlist and Spice

AI 生成之類比／混合訊號電路 netlist 歸檔，依電路分類，共 **50 個檔案 / 11 個資料夾**。
分類依據為 Notion 資料庫「Netlsit ver」的 10 筆條目，資料夾編號 01–10 對應該資料庫由上而下的顯示順序（依最後更新時間遞減）；另有一個 `_未列入Notion` 收納資料庫中查無對應條目的檔案。

原始來源：`Netlist_by_AI.zip`（原本以生成日期 `2026MMDD` 分資料夾存放）。
重整原則：**檔名一律未更動**，日期資訊改由本文件承載。

---

## 目錄

- [快速索引](#快速索引)
- [命名與版本規則](#命名與版本規則)
- [各電路詳細說明](#各電路詳細說明)
- [模擬前必讀](#模擬前必讀)
- [資料品質稽核](#資料品質稽核)

---

## 快速索引

| # | 資料夾 | Top Cell | 製程 / VDD | 規格 | 檔數 | 版次 |
|---|---|---|---|---|---|---|
| 01 | Comp strarm core nparallel auxgated 6nm | `COMP_STRARM_NPARALLEL` | 6nm FinFET HP / 0.9 V | 比較器，3 GHz 再生頻寬 | 1 | — |
| 02 | Strongarm razavi 65nm | StrongARM latch + NAND-SR | TSMC 65nm GP / — | Razavi SSCM 2015 Fig.1(b) 原型 | 1 | — |
| 03 | Strongarm n parallel | StrongARM + N=5 booster | 65nm / 1.0 V | 3 GHz，含 testbench | 2 | — |
| 04 | SF_ResAmp_5nm7nm | `SF_RESBUF_12b_600MS` | 7nm 核心 + 5nm 開關 / 0.8 V | 12b 600 MS/s | 14 | v1→v7 |
| 05 | pipelined_SAR_DSM_ADC_ISSCC2021 | `PIPE_SAR_DSM_ADC_12b` | Samsung SF7P / 0.8 V | 12b 600 MS/s | 4 | v1→v3 |
| 06 | AnalogAgent_NC_ResAmp_6nm_GAA | `NC_RA_TOP_10b_500MS` | 6nm GAA / 0.9 V + 0.78 V | 10b 500 MS/s | 14 | v1→v6 |
| 07 | SAR_ADC_10bit_500MHz | 階層式 SAR | 泛用 40nm BSIM3v3 / 0.9 V | 10b 500 MS/s 非同步 | 3 | v1 |
| 08 | NC_assisted_ResAmp_6nm | `PIPE_SAR_ADC_10b_NC` | 6nm FinFET HP / 0.9 V + 0.78 V | 10b 500 MS/s | 2 | — |
| 09 | 5G_ADC_SoC_7nm | `ADC_5G_SOC_12b` | TSMC N7 / 0.75 V | 12b 12 GSPS，4-way TI | 2 | — |
| 10 | Coherent_OPT_ADC_SoC_7nm | `ADC_OPT_SOC_8b` | TSMC N7 / 0.75 V | 8b 64 GSPS，8-way TI | 2 | — |
| — | `_未列入Notion` | 4b SAR ×2 + `SAR_ADC_10B_v2` | 泛用 0.18µm / 1.8 V | pre/post-layout 對照組 | 5 | — |

---

## 命名與版本規則

原始檔名的後綴即版本序：

```
<CIRCUIT>.sp                    ← 初版（v1）
<CIRCUIT>_fixed.sp              ← 第一次修正
<CIRCUIT>_fixed_v2.sp  …  _v7   ← 後續迭代
```

Notion 的 `last ver` 欄位記錄的就是最後一個 `_vN` 的 N 值。已逐一比對，四筆有版號的條目全部吻合：

| 條目 | Notion last ver | 實際最新檔 |
|---|---|---|
| SF_ResAmp_5nm7nm | 7 | `SF_ResAmp_5nm7nm_fixed_v7.sp` |
| pipelined_SAR_DSM_ADC_ISSCC2021 | 3 | `..._fixed_v3.netlist` |
| AnalogAgent_NC_ResAmp_6nm_GAA | 6 | `..._fixed_v6.netlist` |
| SAR_ADC_10bit_500MHz | 1 | `SAR_ADC_10bit_500MHz_fixed_ver1.sp` |

副檔名 `.sp` / `.netlist` / `.spice` / `.txt` 混用，但**沒有語意差別**，見「資料品質稽核」第 1 點。

---

## 各電路詳細說明

### 01 — Comp strarm core nparallel auxgated 6nm

6 nm FinFET HP，VDD 0.9 V，目標 3.0 GHz 再生頻寬。
StrongARM latch 加上 N=5 條輸入驅動的並聯放電路徑（每側 M1A–E / M2A–E），提升 Outp/Outm 的等效 Gm，再生速度約快 50%；輔助時脈 CLK1 在 settling 後把這些分支關斷，消除額外靜態功耗。
設計方法採 Abidi & Xu 的三相（sample / propagation / regeneration）相平面分析，並強制 CC < CL，讓 propagation 階段的交叉耦合對維持在穩定放大狀態，避免提前再生造成 offset 惡化。

- 37 MOS、4 電容、5 個 `.subckt`、216 行
- 參考：Siddharth et al., TCAS-II 2020；Abidi & Xu, 2014
- 原始位置：`20260626`

### 02 — Strongarm razavi 65nm

`STRONGARM_RAZAVI_65nm_v1.netlist` — Razavi《A Circuit for All Seasons》SSCM 2015 Fig.1(b) 的修改型 StrongARM latch，後接 NAND-SR latch buffer。TSMC 65nm GP / BSIM4，檔內標記 `[PDK-CHECK-REQUIRED]`。

- 17 MOS、5 個 `.subckt`、158 行
- **本資料夾中唯一自帶 `.tran` + `.meas` 的獨立可跑檔案**（其餘多數為純 netlist）
- 語法為通用 SPICE（ngspice / HSPICE / PySpice）；要跑 Spectre 需以 `simulator lang=spice` 包起來
- 原始位置：`20260626`

### 03 — Strongarm n parallel

| 檔案 | 內容 |
|---|---|
| `STRONGARM_N_PARALLEL.sp` | 主電路。Razavi 拓樸 + Siddharth TCAS-II 2020 的 N=5 parallel-path output booster。65nm、VDD 1.0 V、fclk 3 GHz，尺寸取自該論文 Table I。21 MOS，自帶 2 張 `.model` 卡 |
| `tb_strongarm_n5.sp` | Sanity testbench。VDD 1.0 V、fclk 3 GHz（Tclk 333.3 ps）、VIC 0.5 V、差動可掃 |

> ⚠️ `tb_strongarm_n5.sp` 第 5 行是 `.include 'STRONGARM_N_PARALLEL.sp'` —— **相對路徑**。兩檔必須同層，搬動任一個都會讓 testbench 跑不起來。Notion 未單獨列 testbench 條目，是我依此依存關係併入本資料夾。

原始位置：均為 `20260626`

### 04 — SF_ResAmp_5nm7nm

版本最多、行數最長的一組（v7 已達 1597 行）。

Top Cell `SF_RESBUF_12b_600MS`，混合節點設計：7nm FinFET 負責 SAR 第一級與 RT-BUF / FB-BUF，5nm FinFET 負責取樣開關與 CDAC 開關。12-bit（7b coarse SAR + 1.5b redundancy + 6.5b CT-DSM）、600 MS/s、單一 0.8 V 電源、13 mW。核心概念是 source-follower 殘差**傳遞**（1× 增益，不放大），第一級 CDAC 複製到第二級回授路徑，藉此免除級間增益校正。

檔頭另記錄了 5nm 開關的 GIDL 抑制方案（top-plate 超過 1.2 V 時把閘極偏壓抬升約 400 mV，維持 Vgd < 1.2 V）與 dummy 漏電處理（series floating-diffusion）。

**版本演進**

| 版本 | 日期 | 行數 | MOS | 重點 |
|---|---|---|---|---|
| `SF_ResAmp_5nm7nm` | 6/3 | 838 | 78 | 初版 |
| `_fixed` | 6/5 | 838 | 78 | 單位大小寫正規化（`690F`→`690f`）、CMOS 堆疊接點修正、DFF TG 時脈相位修正 |
| `_fixed_v2` | 6/5 | 989 | 78 | 架構準確度 + 製程物理補強 |
| `_fixed_v3` | 6/5 | 1011 | 82 | 6 項 netlist 修復（TG 極性、PMOS body、CDAC 虛擬地、CU 值 173.0f→172.5f、bias cascode 接點、CMFB 死迴路） |
| `_fixed_v4` | 6/12 | 1121 | 82 | 4 項優化：SF bulk 改接 source 消體效應、bias cascode NFIN 6→12、bootstrap GIDL clamp 分壓、新增 F7 交錯規則 |
| `_fixed_v5` | 6/15 | 1284 | 82 | CMFB 分壓 2k→10k + 5 fF 前饋電容；新增 DCDU_7N 三位元數控延遲單元處理 TI skew |
| `_fixed_v6` | 6/15 | 1383 | 82 | 續前 |
| `_fixed_v7` | 6/17 | 1597 | 82 | 檔頭自我標注 `[DESIGN INTENT DOCUMENT — NOT PRODUCTION-READY]`，效能數字標 `[UNVERIFIED-ESTIMATE]`，檔尾附 DESIGN CHECKLIST |

另含 `20260605netlist.zip`，內容為 `fixed` / `v2` / `v3` 的副本 + macOS `__MACOSX` 資源檔，保留原樣未解開。

原始位置：`20260603` / `20260605` / `20260612` / `20260615` / `20260617`

### 05 — pipelined_SAR_DSM_ADC_ISSCC2021

Baek et al., ISSCC 2021 Session 10.5 的復刻。Samsung 7nm FinFET（SF7P）、0.8 V、12-bit 600 MS/s（2× 交錯，每通道 300 MS/s）。量測值 SNDR 58.2 dB @ 300 MS/s、56.6 dB @ 600 MS/s；FoM_Walden 45.6 fJ/conv-step；面積 0.037 mm²。無增益校正，靠 replica 匹配。

與 04 是**同一篇論文的兩種切法**：05 是完整 ADC 系統，04 聚焦在 source-follower 殘差傳遞緩衝器本身。

**版本演進**

| 版本 | 日期 | 行數 | 重點 |
|---|---|---|---|
| 初版 | 6/1 | 414 | — |
| `_fixed_v2` | 6/17 | 526 | DFF master-latch keeper loop 修復、新增 PHASE_SPLIT_CTRL、SF bulk 接 source、新增 F7/F8 失效規則 |
| `_fixed_v3` | 6/17 | 581 | 10 項驗證再修：keeper 重建為標準閘控雙反相 latch、**把 v2 的 SF bulk 改回接 VSS**（bulk FinFET 無 triple well 不能 source-tie NMOS body）、浮接 net 修補、MUX2 cell 補齊、DSM 量化器 D=Q 短路移除、CDAC 終端 dummy 修正 |

> v3 的第 02 項把 v2 剛改的東西改了回去，並附上 LVS 層面的理由。這種來回是版本鏈裡最有參考價值的段落。

原始位置：`20260601` / `20260617`

### 06 — AnalogAgent_NC_ResAmp_6nm_GAA

Top Cell `NC_RA_TOP_10b_500MS`，6nm GAA。以動態負電容（NC）補償回授因子 β 的殘差放大器。

**版本演進**

| 版本 | 日期 | 行數 | MOS | 重點 |
|---|---|---|---|---|
| 初版 | 6/3 | 635 | 67 | — |
| `_fixed` | 6/8 | 645 | 67 | 8 項 bug：DFF TG 時脈相位與輸入節點、bootstrap PMOS bulk 浮接→接 VDD、CDAC dummy 輸入接 REFN、DYN_NC 供電 VDD_DIG→VDD_ANA、輸出開關 D/S 反向、fine CDAC 缺 MSB、OTA bias mirror Vds=0 |
| `_fixed_v2` | 6/8 | 702 | 73 | +6 MOS、+3 電容、+3 電阻 |
| `_fixed_v3` | 6/8 | 782 | 73 | +10 subckt 實例 |
| `_fixed_v4` | 6/8 | 858 | 73 | — |
| `_fixed_v5` | 6/12 | 931 | 71 | 器件數首次下降 |
| `_fixed_v6` | 6/12 | 1048 | 71 | 4 項強化：bulk 接 source（local well）、Bit-4 DFF 前加預延遲鏈確保時序一致、dummy cell 拆成對稱 P/N 側、新增 SEM 規則 |

原始位置：`20260603` / `20260608` / `20260612`

### 07 — SAR_ADC_10bit_500MHz

10-bit 500 MS/s 非同步 SAR ADC，泛用 40nm CMOS（BSIM3v3）、0.9 V。參數鏈推導自 Ding et al., TVLSI 2018 Fig.3；另參考 Liu et al. (OpenSAR), ICCAD 2021。檔頭標注 `Auto-generated via TKU2 AnalogAgent`。

| 版本 | 日期 | 行數 | MOS | X | 重點 |
|---|---|---|---|---|---|
| 初版 | 6/12 | 612 | 27 | 103 | 階層式，帶 `.dc` / `.noise` / `.tran` / `.measure` |
| `_fixed_ver1` | **6/17** | 494 | 106 | 68 | FinFET AMS 驗證通過版；VDD 拆成 VDD_ANA / VDD_DIG；改動清單在檔尾 Section 10，`[CONFIRM]` 標記處需與 golden schematic 對照 |

> 這是唯一一組「修正後行數反而變少、但 MOS 數大增（27→106）」的案例——階層被部分攤平，`.subckt` 從 5 增為 11、X 實例從 103 減為 68。若要比較兩版，不能只看行數。

兩版皆為此歸檔中唯二使用 `.LIB "models/40nm_cmos.lib" TT` 的檔案，該 lib 不在壓縮檔內。

原始位置：`20260612` / `20260617`

### 08 — NC_assisted_ResAmp_6nm

Top Cell `PIPE_SAR_ADC_10b_NC`，6nm FinFET HP，雙電源（數位 0.9 V / 類比 0.78 V，後者由 FVF 產生）。10-bit 500 MS/s，架構為 5b coarse SAR + NC-assisted RA + 6b fine SAR，級間增益 16×。

核心數據：NC 值 −295 fF 補償 368 fF（含 ~100 fF 寄生），β 從 0.059 提升到 0.24；OTA 的 AOL 需求因此從 60 dB 放寬到 48 dB、fu 從 >20.6 GHz 放寬到 4.9 GHz。量測 SNDR 53.6 dB @ Nyquist、功耗 2.7 mW、FoM_Walden 13.8 fJ/conv-step、面積 0.014 mm²。
參考 Kwon et al., IEEE TCAS-II Vol.72 No.5, May 2025。

> 與 06 的關係：兩者都是 NC 殘差放大器，但 Top Cell 不同（`PIPE_SAR_ADC_10b_NC` vs `NC_RA_TOP_10b_500MS`），Notion 也分成兩筆條目，故此處分開存放。08 沒有後續版本，可視為 06 那條版本鏈的前身。

原始位置：`20260601`

### 09 — 5G_ADC_SoC_7nm

`ADC_5G_SOC_12b`，TSMC N7（CLN7FF）。三組電源域：IO 1.8 V / core 0.75 V / PLL 0.9 V。12-bit 12 GSPS（4-way 時間交錯，每路 3 GSPS）。架構含 4-way TI Pipelined-SAR、片上 PLL、動態殘差放大器、背景校正、JESD204B SerDes 輸出。目標 SNDR 58 dB / SFDR 70 dB，功耗 290 mW。

- 本歸檔中階層最深的一份：**164 個 X 實例、28 個 `.subckt`**、99 MOS
- 原始位置：`20260529`

### 10 — Coherent_OPT_ADC_SoC_7nm

`ADC_OPT_SOC_8b`，TSMC N7。IO 1.8 V / core 0.75 V / DSP 0.80 V。8-bit **64 GSPS**（8-way 時間交錯，每路 8 GSPS），架構為 8-way TI flash-assisted pipeline + 片上 ADPLL + 4-tap FIR 預失真 + 400G 相干光 PAM-4 SerDes。目標 SNDR 46 dB / SFDR 55 dB，輸入頻寬 40 GHz（−3 dB，主動 T/H），功耗 480 mW。

- 27 個電阻是全歸檔最多（高速通道的終端與繞線建模）
- 與 09 同日生成，是一組「高解析度 vs 高速度」的對照
- 原始位置：`20260529`

### `_未列入Notion`

原壓縮檔根目錄的 5 個檔案，在 Notion 資料庫中找不到對應條目。這批與 01–10 的風格明顯不同：**自帶 level-1 `.model` 卡，是本歸檔中唯二真正可以直接餵進模擬器跑的檔案**（另一個是 02）。

| 檔案 | 行數 | MOS | C | R | 說明 |
|---|---|---|---|---|---|
| `A_pre_layout_1.spice` | 134 | 24 | 21 | 27 | 4-bit SAR ADC，乾淨 schematic-level，19 X 實例 / 12 subckt |
| `A_postlayout_1.spice` | 635 | 164 | 216 | 215 | 同上，完全攤平（DFF/NAND/INV/TG 全部 inline），含封裝與繞線寄生 |
| `B_pre_layout_2.spice` | 134 | 20 | 11 | 13 | 4-bit SAR ADC，另一套 schematic-level |
| `B_postlayout_2.spice` | 607 | 164 | 206 | 208 | 同上，完全攤平 |
| `C_postlayout_2.netlist` | 906 | 412 | 185 | 76 | `SAR_ADC_10B_v2`，TSMC 180nm N18，Calibre xRC v2024.4 全寄生萃取（R + C 含耦合電容），typical corner，LVS CLEAN（0 shorts / 0 opens / 0 mismatches），寄生節點前綴 `_n<uid>_` |

A/B 兩組是標準的 **pre-layout vs post-layout 對照組**：器件數從 24 → 164、電容從 21 → 216，寄生萃取的影響一目了然。C 則是另一個設計（10-bit，180nm），412 個 MOS 是全歸檔單檔最多。

> 這 5 個檔案要不要補進 Notion，或它們是否來自另一批來源，請你確認。

---

## 模擬前必讀

1. **絕大多數檔案不是可直接執行的 deck。**
   50 個檔案裡只有 6 個帶分析指令（`.tran` / `.dc` / `.op`）：`STRONGARM_RAZAVI_65nm_v1.netlist`、`tb_strongarm_n5.sp`、`SAR_ADC_10bit_500MHz` 兩版、以及 `_未列入Notion` 的四個 `.spice`。其餘是純 netlist，需要自備 testbench。

2. **器件模型幾乎都不在檔案裡。**
   netlist 引用的是 `NMOS_7nm_HP`、`PMOS_6nm_HP`、`NMOS_5nm_HP`、`PMOS_SLFin`、`NMOS_NC` 等模型名，但沒有任何 `.model` 定義或 `.lib` 指向。這些名稱是佔位符，必須換成實際 PDK 的模型名。
   例外：`STRONGARM_N_PARALLEL.sp` 自帶 2 張 model 卡；`_未列入Notion` 的四個 `.spice` 自帶 level-1 NMOS/PMOS 卡（`vto=±0.45`, `kp=220u/85u`）。
   `SAR_ADC_10bit_500MHz` 兩版有 `.LIB "models/40nm_cmos.lib" TT`，但該 lib 檔不在此壓縮檔內。

3. **v7 自己承認未經驗證。**
   `SF_ResAmp_5nm7nm_fixed_v7.sp` 檔頭明寫這是 architecture blueprint 而非 production netlist，所有效能數字標記 `[UNVERIFIED-ESTIMATE]`，需經 Spectre / HSPICE 加 PDK 模型驗證。其餘檔案的效能數字（SNDR / FoM / 面積）多半引自原始論文的量測值，不是這些 netlist 模擬出來的——引用時要留意這個區別。

4. **語法方言。**
   多數檔案是通用 SPICE（ngspice / HSPICE / PySpice 可讀）。`.netlist` 副檔名者採 auCdl 格式標頭，實體行仍是標準 SPICE。要跑 Spectre 需 `simulator lang=spice` 包裝。

---

## 資料品質稽核

### 1. `.txt` 與 `.netlist` / `.sp` 是同一份檔案

17 組配對逐位元比對，全部 byte-identical，僅副檔名不同：

```
04: SF_ResAmp_5nm7nm{,_fixed,_fixed_v2,_fixed_v3,_fixed_v4}    .sp ≡ .txt
05: pipelined_SAR_DSM_ADC_ISSCC2021                            .netlist ≡ .txt
06: AnalogAgent_NC_ResAmp_6nm_GAA{,_fixed,_v2..._v6}           .netlist ≡ .txt
07: SAR_ADC_10bit_500MHz                                       .sp ≡ .txt
08: NC_assisted_ResAmp_6nm                                     .netlist ≡ .txt
09: 5G_ADC_SoC_7nm                                             .netlist ≡ .txt
10: Coherent_OPT_ADC_SoC_7nm                                   .netlist ≡ .txt
```

要精簡歸檔，直接刪掉所有 `.txt` 不會損失任何內容——**唯一例外**是 `COMP_STRARM_core_Nparallel_auxgated_6nm.txt`，它沒有配對檔，本身就是該電路的唯一版本。

### 2. Notion 有一筆日期需要補

`SAR_ADC_10bit_500MHz` 在 Notion 記為最後更新 6/12，但 `SAR_ADC_10bit_500MHz_fixed_ver1.sp` 實際存放於 `20260617` 資料夾。其餘 9 筆的初次生成日期與最後更新時間均與檔案位置吻合。

### 3. `20260605netlist.zip` 為冗餘

位於 `04_SF_ResAmp_5nm7nm/`，內容是同資料夾 `fixed` / `v2` / `v3` 的副本，另含 macOS `__MACOSX` 資源分岔檔。保留原樣未解開，可安全刪除。

### 4. 檔名未加日期前綴的理由

原始資料夾攤平後日期資訊會遺失，直覺做法是把日期加進檔名。此處刻意不做，因為 `tb_strongarm_n5.sp` 內含 `.include 'STRONGARM_N_PARALLEL.sp'` 這類相對路徑引用，改名會直接破壞。日期一律由本文件承載。

### 5. 版本鏈的可信度差異

06 的 `_fixed` 版列出 8 項具體修正並附行號（`L187-188`、`L208-209`…），05 的 v3 列出 10 項並說明每項的 LVS/R1 依據——這類版本的修改紀錄可追溯性最高。相對地，04 的 `_fixed` 相對初版只有單位大小寫與少數接點差異，行數完全相同（838 → 838），實質變動遠小於版號暗示的幅度。

---

*本文件由歸檔重整時自動產生，內容取自各 netlist 的檔頭註解與實際器件統計。效能數字轉引自檔頭，未經獨立驗證。*
