# Tapeout review 資料交接

本 repository 保存 AI 生成的 Tapeout Review Form、電路 Netlist、輸入資料包及 e516 研究資料，供閱讀、比較與延續研究。論文由資料提供者蒐集；**Netlist 全部由 AI 生成**，審查表則由 ChatGPT、Claude、Gemini 依論文生成正確版與刻意含錯誤版。

## 最近更新

**2026-10-21：計劃書v1～v8已統一分版資料夾。** [版本總覽](e516/09_計劃書/README.md)提供各版文件索引，所有README連結與檔案清單已同步更新。

**2026-10-21：116年度國科會計畫書更新至v8。** [最新檔案與下載](e516/09_計劃書/v8/README.md)已同步至e516，原v7另存供追溯。

- 文獻由50篇增至62篇，新增12篇2025–2026年正式論文，補強性能導引佈局、2nm移植、動態IR drop與電光熱共同設計。
- 更新完整計畫書、24頁CM03、62篇RIS與Excel對照表；需人工修改的內容已用**黃色螢光**標出。
- [M01–M08人工核對清單與修訂重點](e516/09_計劃書/v8/v8_修訂與人工核對_20261021.md)列出主持人資料、授權、先期成果、人力、規格、經費與正式公告的待確認事項。

## 從哪裡開始

| 目錄／檔案 | 用途 | 生成流程／來源 |
| --- | --- | --- |
| [e516](e516/README.md) | 11 個研究分類、論文、報告、計劃書與索引 | 保留原始來源包及逐檔清單 |
| [Tapeout-Review-Form](Tapeout-Review-Form/README.md) | ChatGPT、Claude、Gemini 的審查表案例 | [論文 → 三款 AI → 正確／錯誤版流程圖](Tapeout-Review-Form/README.md#生成流程) |
| [e516／Netlist 依電路分類](e516/00_Netlist_依電路分類/README.md) | 五類電路、testbench 與修訂版本 | [NotebookLM 與 Claude 迭代生成流程圖](e516/00_Netlist_依電路分類/README.md#ai-生成與迭代流程) |
| [input zip](input%20zip/README.md) | 電路、Netlist、JSON 與 manifest 輸入包 | 內含 Netlist 同樣由 AI 生成 |
| `LLM比較(孝軒).url` | 指向既有 Notion 比較頁的捷徑 | 原 repo 連結；頁面內容未在此備份 |
| [HANDOFF_INVENTORY.csv](HANDOFF_INVENTORY.csv) | 現存原始資料的路徑、大小、SHA-256 與實際格式 | 已移除舊分類的重複檔案列 |

## 檔案整理

2026-10-16 比對後移除舊 `Netlist by AI/`：44 個電路／testbench 檔與 e516 版本的 Git blob SHA、SHA-256 均相同；舊 `20260605netlist.zip` 中的 3 個正文檔也逐一核對，內容都已保存在 e516。因此這批重複資料只保留 **e516 分類版本**，舊分類的 11 份 README 一併移除，歷史紀錄仍可由 Git 追溯。

`Tapeout-Review-Form`、`input zip` 與 Notion 捷徑未與 e516 重複，繼續保留。e516 保留各分類的原始內容與來源 ZIP；計劃書依 v1～v8 資料夾管理。各類別的同一案例編號與 Netlist 之間尚無已確認的對應表。

## 文件開啟與使用

部分 `.pdf` 實際為 DOCX、部分 `.docx` 實際為 PDF；另有 macOS AppleDouble 中繼資料。請依清單的 `detected_format` 判斷實際格式，必要時在工作副本上更正副檔名。AppleDouble 不屬於審查表正文。

`Tapeout-Review-Form` 目前有 58 份實際 DOCX、57 份實際 PDF，另有 36 個 AppleDouble 檔；格式數量不等同獨立案例數。每款 AI 約生成 9–10 組正確／錯誤版案例，細節見審查表總覽。

Netlist 的 `pre`／`post`、`fixed`／`vN` 及檔內工具名稱均屬生成內容或既有命名；AI 對照論文的檢查不等同實際模擬、DRC、LVS 或 PEX。使用電路前請核對模型、testbench 與相依檔。可從 [StrongARM 比較器](e516/00_Netlist_依電路分類/01_StrongARM比較器/README.md) 了解相對 `.include` 與基本模擬的限制。

## 維護

新增資料時同步更新對應 README 與清單，保留來源、提示詞、模型版本及修訂紀錄。同名不同內容另存版本；原始文獻、AI 筆記與生成電路的來源分別記錄。`e516/FILE_INVENTORY.csv` 的 `identical_legacy_repository_paths` 僅記錄整理前的歷史重複路徑，不能當作現存檔案連結。
