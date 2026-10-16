# 4nm layout 相關文獻

來源為提供者蒐集後上傳的 `07_4nm layout.zip`，保留原資料夾名稱。實際內容是10份PDF，涵蓋3／4／5nm的高速ADC、取樣介面、PAM4 transmitter、DTCO、CFET、LVS輔助模擬及電容陣列。資料夾名稱不是精確製程分類，這裡沒有GDS／OASIS版圖、DRC／LVS rule deck、PDK或可執行佈局工具。

## 原始文件

| 檔案 |
| --- |
| [3.9_A_1.2V_High-Voltage-Tolerant_Bootstrapped_Analog_Sampler_in_12-bit_SAR_ADC_Using_3nm_GAAs_0.7V_Thin-Gate-Oxide_Transistor.pdf](3.9_A_1.2V_High-Voltage-Tolerant_Bootstrapped_Analog_Sampler_in_12-bit_SAR_ADC_Using_3nm_GAAs_0.7V_Thin-Gate-Oxide_Transistor.pdf) |
| [A_12-bit_10GS_s_Time-Interleaved_SAR_ADC_with_Even_Odd_Channel-Correlated_Absolute_Error-Based_Over-Nyquist_Timing-Skew_Calibration_in_5nm_FinFET.pdf](A_12-bit_10GS_s_Time-Interleaved_SAR_ADC_with_Even_Odd_Channel-Correlated_Absolute_Error-Based_Over-Nyquist_Timing-Skew_Calibration_in_5nm_FinFET.pdf) |
| [A_16GS_s_10b_Time-domain_ADC_using_Pipelined-SAR_TDC_with_Delay_Variability_Compensation_and_Background_Calibration_Achieving_153.8dB_FoM_in_4nm_CMOS.pdf](A_16GS_s_10b_Time-domain_ADC_using_Pipelined-SAR_TDC_with_Delay_Variability_Compensation_and_Background_Calibration_Achieving_153.8dB_FoM_in_4nm_CMOS.pdf) |
| [A_5-nm_60-GS_s_7b_64-Way_Time_Interleaved_Partial_Loop_Unrolled_SAR_ADC_Achieving_35.2dB_SNDR_up_to_32_GHz.pdf](A_5-nm_60-GS_s_7b_64-Way_Time_Interleaved_Partial_Loop_Unrolled_SAR_ADC_Achieving_35.2dB_SNDR_up_to_32_GHz.pdf) |
| [A_72-GS_s_8-Bit_DAC-Based_Wireline_Transmitter_in_4-nm_FinFET_CMOS_for_200_Gb_s_Serial_Links.pdf](A_72-GS_s_8-Bit_DAC-Based_Wireline_Transmitter_in_4-nm_FinFET_CMOS_for_200_Gb_s_Serial_Links.pdf) |
| [A_MEOL_logic_layout_optimization_recommendation_under_3_nm_CFET_architecture_and_beyond.pdf](A_MEOL_logic_layout_optimization_recommendation_under_3_nm_CFET_architecture_and_beyond.pdf) |
| [An_8-bit_56GS_s_64x_Time-Interleaved_ADC_with_Bootstrapped_Sampler_and_Class-AB_Buffer_in_4nm_CMOS.pdf](An_8-bit_56GS_s_64x_Time-Interleaved_ADC_with_Bootstrapped_Sampler_and_Class-AB_Buffer_in_4nm_CMOS.pdf) |
| [Fast_and_Accurate_post-layout_simulation_methodology_using_4nm_LVS_rule_deck.pdf](Fast_and_Accurate_post-layout_simulation_methodology_using_4nm_LVS_rule_deck.pdf) |
| [High_Performance_4nm_FinFET_Platform_4LPE_with_Novel_Advanced_Transistor_Level_DTCO_for_Dual-CPP_HP-HD_Standard_Cells.pdf](High_Performance_4nm_FinFET_Platform_4LPE_with_Novel_Advanced_Transistor_Level_DTCO_for_Dual-CPP_HP-HD_Standard_Cells.pdf) |
| [On Automating Finger-Cap Array Synthesis with Optimal Parasitic Matching for Custom SAR ADC.pdf](On%20Automating%20Finger-Cap%20Array%20Synthesis%20with%20Optimal%20Parasitic%20Matching%20for%20Custom%20SAR%20ADC.pdf) |

## 如何使用

研究ADC可先讀4nm的56GS/s與16GS/s案例，再比較5nm交錯ADC及3nm sampler；研究實體設計可讀4nm DTCO、post-layout simulation、3nm CFET MEOL與finger-cap array。各文章的節點、作者及出版資訊以PDF首頁為準；本組不在原01–06的58份分類統計內。

此目錄是設計方法與文獻參考，不能取代實際4nm設計資料。PDF保留原始內容，校驗值與ZIP內路徑見 [FILE_INVENTORY.csv](../FILE_INVENTORY.csv)。

[回到e516總覽](../README.md)
