# 原始壓縮包保存

保存本次成功讀取的13份來源ZIP，未改寫原包內容。計劃書原包名與包內檔名保留，repo展開目錄依提供者更正為`09_計劃書`。04與10各用兩個傳輸分包合併回原分類；分包內相對路徑記錄於來源清單。

| 原始ZIP | 展開位置 | 原始檔案數 |
| --- | --- | ---: |
| `00_Netlist_依電路分類.zip` | [展開目錄](../00_Netlist_%E4%BE%9D%E9%9B%BB%E8%B7%AF%E5%88%86%E9%A1%9E/README.md) | 52 |
| `01_動態比較器與StrongARM_Latch.zip` | [展開目錄](../01_%E5%8B%95%E6%85%8B%E6%AF%94%E8%BC%83%E5%99%A8%E8%88%87StrongARM_Latch/README.md) | 11 |
| `02_SAR_ADC架構與電路設計.zip` | [展開目錄](../02_SAR_ADC%E6%9E%B6%E6%A7%8B%E8%88%87%E9%9B%BB%E8%B7%AF%E8%A8%AD%E8%A8%88/README.md) | 8 |
| `03_SAR_ADC自動化佈局與生成工具.zip` | [展開目錄](../03_SAR_ADC%E8%87%AA%E5%8B%95%E5%8C%96%E4%BD%88%E5%B1%80%E8%88%87%E7%94%9F%E6%88%90%E5%B7%A5%E5%85%B7/README.md) | 8 |
| `04_01.zip` | [展開目錄](../04_AI%E6%A9%9F%E5%99%A8%E5%AD%B8%E7%BF%92%E8%BC%94%E5%8A%A9%E8%A8%AD%E8%A8%88/README.md) | 8 |
| `04_02.zip` | [展開目錄](../04_AI%E6%A9%9F%E5%99%A8%E5%AD%B8%E7%BF%92%E8%BC%94%E5%8A%A9%E8%A8%AD%E8%A8%88/README.md) | 4 |
| `05_高速有線傳輸應用_PAM4.zip` | [展開目錄](../05_%E9%AB%98%E9%80%9F%E6%9C%89%E7%B7%9A%E5%82%B3%E8%BC%B8%E6%87%89%E7%94%A8_PAM4/README.md) | 4 |
| `06_先進製程元件與物理設計.zip` | [展開目錄](../06_%E5%85%88%E9%80%B2%E8%A3%BD%E7%A8%8B%E5%85%83%E4%BB%B6%E8%88%87%E7%89%A9%E7%90%86%E8%A8%AD%E8%A8%88/README.md) | 14 |
| `07_4nm layout.zip` | [展開目錄](../07_4nm%20layout/README.md) | 10 |
| `08_結案報告.zip` | [展開目錄](../08_%E7%B5%90%E6%A1%88%E5%A0%B1%E5%91%8A/README.md) | 3 |
| `09_計畫書.zip` | [展開目錄](../09_%E8%A8%88%E5%8A%83%E6%9B%B8/README.md) | 13 |
| `10_1.zip` | [展開目錄](../10_Placement%E5%BB%BA%E8%AD%B0by%20AI/README.md) | 9 |
| `10_2.zip` | [展開目錄](../10_Placement%E5%BB%BA%E8%AD%B0by%20AI/README.md) | 6 |

共150個包內原始檔；ZIP均通過CRC及逐檔位元組一致性檢查。新增README與CSV不在原ZIP內。另收到的5個外層索引檔與RAIL報告直接保存於對應位置，未另行重包ZIP。完整`e516 file.zip`及拆分前04／10大包未直接讀取，以目前分包與直接附件作備份來源。

本目錄執行 `sha256sum -c ARCHIVE_SHA256SUMS.txt` 可核對原包。詳細來源在 [FILE_INVENTORY.csv](../FILE_INVENTORY.csv)：`source_attachment`為來源附件，`archive_entry`為ZIP內原路徑，空值表示直接上傳檔案。請另解壓工作副本，不覆寫來源檔。

[回到e516總覽](../README.md)
