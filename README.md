# Tapeout review 資料交接

本 repository 保存 Tapeout Review Form 範例、AI 電路 netlist、輸入資料包及 e516 研究資料，供學弟妹了解資料內容、追查版本與延續研究。資料由 repository 擁有者從各方面蒐集整理；各文件原作者與產生方式以原文及已知來源紀錄為準。這是資料歸檔庫，沒有網站、套件安裝程序或自動化 CI。

## 從哪裡開始

| 目錄／檔案 | 用途 | 已知來源 |
| --- | --- | --- |
| [e516](e516/README.md) | 11個研究分類與5個外層索引檔，共156個原始檔 | 提供者蒐集整理後上傳的13個ZIP與6個直接附件；保留原包及逐檔來源清單 |
| [Tapeout-Review-Form](Tapeout-Review-Form/README.md) | 依 ChatGPT、Claude、Gemini 分組的審查表文件 | 既有資料夾按模型名稱分類；產生對話、提示詞、確切模型版本與作者未附完整紀錄 |
| [Netlist by AI](Netlist%20by%20AI/README.md) | 10 類類比／混合訊號電路與版本演進 | 既有歸檔說明記載來自 `Netlist_by_AI.zip`，並對照 Notion「Netlsit ver」 |
| [input zip](input%20zip/README.md) | StrongARM、負電容殘差放大器等輸入包 | repo 原有 ZIP，內含 SPICE、JSON 與部分 manifest；確切產生流程待原作者補充 |
| `LLM比較(孝軒).url` | 指向既有 Notion 比較頁的捷徑 | 檔名與連結來自既有 repo；網頁內容與存取權未在此備份 |
| [HANDOFF_INVENTORY.csv](HANDOFF_INVENTORY.csv) | 原始資料的路徑、大小、SHA-256 與實際格式 | 由目前 checkout 逐檔計算；包含新增附件，排除新增 README、來源清單及校驗清單 |

先讀各目錄 README，再依文件編號或電路版本閱讀原檔。`test`／`answer`、`fixed`／`vN` 是既有命名，不能單憑名稱判斷設計是否正確或已驗證。審查表編號與 netlist 目錄編號之間沒有已確認的對應表。

## 文件開啟與已知限制

部分 `.pdf` 實際為 DOCX、部分 `.docx` 實際為 PDF；另有 macOS AppleDouble 中繼資料。為保留備份原貌，未改名、刪除或轉檔。請依清單的 `detected_format` 判斷格式；若軟體拒絕開啟，可複製到 repo 外，再替副本更正副檔名。AppleDouble 不是審查表正文。

既有 `Tapeout-Review-Form` 目錄可讀取 58 份 DOCX、57 份 PDF，另有 36 個 AppleDouble 檔。這些是實際格式統計，不等同 115 份互不重複的案例。e516 另外保存論文、摘要、成果報告與計劃書，範圍見其總覽。文件中的模擬、量測與通過敘述保留自原文，這次歸檔檢查僅確認可讀取，沒有獨立重現其結果。

## 電路使用

參考 [netlist 歸檔說明](Netlist%20by%20AI/README.md)。多數電路缺少真實 PDK、testbench 或量測結果，不能直接作為 tapeout signoff。優先從 [StrongARM N-parallel](Netlist%20by%20AI/03_Strongarm%20n%20parallel/README.md) 理解檔案相依與基本模擬；該例自帶的模型仍只是通用佔位模型。

## 後續交接與更新

每一層實體資料夾都應有 README，至少說明用途、來源、檔案／版本、開啟方法與已知限制。新增備份時保留原始壓縮包與相對路徑；同名不同內容另存版本，避免覆寫。新增原始資料後更新 SHA-256 清單，並記錄來源壓縮檔、整理日期及整理者。

目前來源說明以提供者的「從各方面蒐集整理」說明、repo 原有 README、檔頭及原附分類表為依據；未確認的作者、授權、產生對話、PDK 版本及跨目錄對應關係仍需由資料提供者補齊。文件若標註內部使用，使用與分享前應向資料負責人確認適用範圍。
