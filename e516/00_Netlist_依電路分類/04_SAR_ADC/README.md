# SAR ADC 與前後佈局資料

保存A／B兩組4-bit SAR的pre／post資料、C組10-bit postlayout，以及40nm 10-bit 500MS/s初版與修正版。原表將A／B標為TKU2產生、C標為Calibre xRC抽取，40nm系列標為TKU2 AnalogAgent。

直接備份來源：`00_Netlist_依電路分類.zip`，由repo擁有者蒐集提供；詳細日期、版本及產生方式見上層原附分類表。

## 本層檔案

| 原始檔案 | 大小（bytes） |
| --- | ---: |
| [A_postlayout_1.spice](A_postlayout_1.spice) | 23676 |
| [A_pre_layout_1.spice](A_pre_layout_1.spice) | 3835 |
| [B_postlayout_2.spice](B_postlayout_2.spice) | 24457 |
| [B_pre_layout_2.spice](B_pre_layout_2.spice) | 3795 |
| [C_postlayout_2.netlist](C_postlayout_2.netlist) | 44413 |
| [SAR_ADC_10bit_500MHz.sp](SAR_ADC_10bit_500MHz.sp) | 24534 |
| [SAR_ADC_10bit_500MHz.txt](SAR_ADC_10bit_500MHz.txt) | 24534 |
| [SAR_ADC_10bit_500MHz_fixed_ver1.sp](SAR_ADC_10bit_500MHz_fixed_ver1.sp) | 21082 |

## 使用與限制

A／B postlayout在原附表格中列為「類佈局後、手動估寄生」，不是抽取工具產物；C檔宣稱post-LVS／RC抽取，但沒有附原版圖、抽取log或LVS報告。研究寄生影響時應先辨別來源。

五個A／B／C檔是相對舊repo補入的資料；40nm三檔與舊分類07相同。A／B自帶簡化level-1模型，不能代表實際製程；40nm系列引用的models/40nm_cmos.lib未附。本次只做保存與可讀性檢查。

原檔未改寫，改動與模擬輸出請另存工作副本。檔案SHA-256與相同舊repo路徑可查 [FILE_INVENTORY.csv](../../FILE_INVENTORY.csv)。

[回到電路分類總覽](../README.md) · [回到e516總覽](../../README.md)
