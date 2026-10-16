# Tapeout Review Form 文件

保存全客製 IC tapeout 審查表相關文件，供比較填寫方式、檢查電路模擬／佈局／驗證項目與後續教學使用。正文涵蓋電路概述、PVT、post-layout、power line、DRC／LVS 等內容。

## 分類與來源

| 子目錄 | 分類依據 |
| --- | --- |
| [ChatGPT](ChatGPT/README.md) | 既有資料夾與檔名標示 ChatGPT |
| [Claude](Claude/README.md) | 既有資料夾與檔名標示 Claude |
| [Gemini](Gemini/README.md) | 既有資料夾與檔名標示 Gemini |

分類沿用原 repo；未附完整提示詞、對話、確切模型版本、製作人與產生時間。審查表內容不能單獨證明實際完成 tapeout 或量測。部分文件內文版本與檔名不一致，應以正文逐案核對；`test` 與 `answer` 的正式評分用途尚無統一說明。

## 閱讀方式

先選模型目錄，再按檔名中的案例編號閱讀。各模型的同一編號不保證是同一個電路；不同副檔名也不保證內容相同。每個子目錄 README 記錄實際檔案格式統計。

部分副檔名錯置，請使用根目錄 [檔案清單](../HANDOFF_INVENTORY.csv) 的 `detected_format`；保留原檔，在外部副本上修正副檔名。AppleDouble 檔屬 macOS 中繼資料，不能當作 Word 或 PDF 正文開啟。
