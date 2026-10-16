# AI placement 建議與對照資料

來源為提供者蒐集的 `10_1.zip`、`10_2.zip`，合併回原第一層分類。共5組、15個原始檔，每組保存一份電路netlist、一份AI配置／審查PDF與一份參考文獻PDF。原包子目錄與檔名保留，包括部分名稱尾綴2。

| 子目錄 | 主題 | 來源分包 |
| --- | --- | --- |
| [01_SAR_DSM_7nm 2](01_SAR_DSM_7nm%202/README.md) | SAR＋DSM ADC | `10_1.zip` |
| [02_5G_ADC_SoC_7nm 2](02_5G_ADC_SoC_7nm%202/README.md) | 5G ADC SoC | `10_1.zip` |
| [03_Coherent_OPT_ADC_SoC_7nm](03_Coherent_OPT_ADC_SoC_7nm/README.md) | 光通訊 ADC SoC | `10_1.zip` |
| [04_SF_RESBUF 2](04_SF_RESBUF%202/README.md) | Source-follower殘差傳遞 | `10_2.zip` |
| [05_AnalogAgent_ResAmp](05_AnalogAgent_ResAmp/README.md) | NC輔助殘差放大器 | `10_2.zip` |

這5組對照 Netlist 同樣由 AI 生成，與00分類的相應版本內容相同；生成方式見 [NotebookLM／Claude迭代流程](../00_Netlist_依電路分類/README.md#ai-生成與迭代流程)。

## 怎麼使用

先選主題閱讀子目錄README，再依配置提案、netlist、參考論文的順序對照。netlist可查閱電路階層，PDF用來理解分區、對稱、寄生與routing前置考量。參考文獻未必直接描述整個同名top cell，例如5G SoC資料夾內的論文實際是6nm pipelined SAR ADC。

這批是研究規劃與靜態審查，沒有完整實體版圖、foundry驗證或可投片signoff。部分提案引用ASAP7作規則例子，不能推定已有對應商用7nm／6nm PDK授權或驗證。原PDF中的缺陷與待驗證事項保留，未在備份時修正。

[回到e516總覽](../README.md) · [逐檔來源與校驗清單](../FILE_INVENTORY.csv)
