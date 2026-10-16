# 輸入資料壓縮包

保存 repo 原有的五份電路輸入 ZIP，供後續電路、佈局或資料處理研究使用。以下內容由 ZIP 目錄與內附 manifest 確認；確切產生工具、作者、產生時間及完整操作流程尚未記錄。檔名中的技術節點是原命名，並未在這次備份中做製程驗證。

| 壓縮包 | 主要內容 | 正文檔案數 |
| --- | --- | ---: |
| `input_strongarm_latch_130N.zip` | StrongARM latch：`.sp`、pre/post `.spice`、constraints JSON、pairs JSON | 5 |
| `input_NCRA_betacomp_6nm.zip` | `ncra_inv_ota`、`dyn_nc` 兩組電路及 `_manifest.txt` | 13 |
| `input_NC_ResAmp_6nm_GAA.zip` | `nc_resamp_inv_ota` 電路、pre/post netlist 與 JSON | 6 |
| `input_NC_ResAmp_6nm_GAA_v2.zip` | `fvf_err_ota`、`nc_resamp_inv_ota`、`dyn_nc_inv` 與 `_v2_manifest.txt` | 19 |
| `input_NC_ResAmp_6nm_GAA_v3.zip` | 同類三組電路與 `_v3_manifest.txt` | 19 |

表內數量排除目錄及 macOS 中繼資料。這五份 ZIP 已通過 CRC 完整性檢查；另有一份歷史 ZIP 位於 netlist 的 04 目錄。

## 使用方法

先列出內容，例如 `unzip -l 'input_NC_ResAmp_6nm_GAA_v3.zip'`。解壓縮到 repo 外的獨立工作目錄，保留包內相對路徑，先讀 manifest 再讀電路及 JSON。`pre`／`post` 沿用原檔命名，實際抽取流程與模型仍需原作者說明；JSON 的欄位定義應以內容與原使用工具為準。

版本比較請同時檢查 manifest、SPICE 與 JSON，不要用 v3 覆寫 v2 或初版。若日後將包內資料正式展開到 repo，展開出的每層資料夾也需補 README，並記錄來自哪一個 ZIP。

[回到 repository 總覽](../README.md)
