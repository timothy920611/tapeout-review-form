# Netlist 依電路分類

來源為提供者上傳的同名ZIP，由提供者從各方面蒐集整理。原附 `README.txt` 與 `Netlist_電路分類表.md` 記錄AI生成、文獻參考、版本與設計階段，這次按原路徑完整展開，未改動電路內容。

## 內容索引

| 分類 | 原始檔案數 | 用途 |
| --- | ---: | --- |
| [01_StrongARM比較器](01_StrongARM比較器/README.md) | 4 | StrongARM拓樸、平行放電路徑與testbench |
| [02_殘差放大器_Residue_Amplifier](02_殘差放大器_Residue_Amplifier/README.md) | 29 | NC／GAA及source-follower殘差放大器的版本鏈 |
| [03_Pipelined_SAR_DSM_ADC](03_Pipelined_SAR_DSM_ADC/README.md) | 4 | SAR＋增量DSM ADC與修正版 |
| [04_SAR_ADC](04_SAR_ADC/README.md) | 8 | SAR ADC、pre-layout與post-layout資料 |
| [05_ADC_SoC系統整合](05_ADC_SoC系統整合/README.md) | 4 | 5G與光通訊ADC SoC架構 |

另有原附 `README.txt`、[Netlist_電路分類表.md](Netlist_電路分類表.md) 與 `Netlist_電路分類表.xlsx`。原清單以32個「設計」條目列版本及testbench，不代表32個獨立且驗證完成的電路。49個電路／testbench檔中有18個 `.txt`，其中 `COMP_STRARM_core_Nparallel_auxgated_6nm.txt` 是唯一版本，其餘17份與相應SPICE檔完全相同，均保留原貌。

## 與 repo 舊分類的關係

本目錄44個電路檔與舊 [Netlist by AI](../../Netlist%20by%20AI/README.md) 的內容完全相同，但這裡依五種電路類型分組。04分類還補入舊說明提到的 `A_pre_layout_1.spice`、`A_postlayout_1.spice`、`B_pre_layout_2.spice`、`B_postlayout_2.spice`、`C_postlayout_2.netlist`。舊分類保留不動；原ZIP明載略過重複的 `20260605netlist.zip`，該歷史包仍在舊04分類。

## 開啟與驗證

`.sp`、`.spice`、`.netlist` 與電路用 `.txt` 皆可用文字編輯器閱讀；分類表可用Markdown閱讀器及Excel／LibreOffice開啟。執行前核對模型與testbench，尤其40nm模型庫與先進節點PDK未包含於此包。

原附分類表的「已抽取」「LVS clean」等狀態來自原資料標示，本次未取得抽取log、版圖或LVS報告重驗。pre／post檔名不保證是實際工具抽取；04分類特別區分手動估計與原檔宣稱的抽取。

[回到 e516 總覽](../README.md)
