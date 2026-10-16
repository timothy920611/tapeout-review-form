# StrongARM N=5 parallel-path testbench

Razavi latch 加 Siddharth TCAS-II 2020 的 N=5 output booster；testbench 設定 VDD=1V、時脈約3GHz。

## 來源與版本

依[上層既有歸檔說明](../README.md)，本組由 `Netlist_by_AI.zip` 重整而來，並依 Notion「Netlsit ver」條目分類。原始日期資料夾記錄：20260626。上述來源是既有說明與檔頭紀錄，未另行取得原始生成對話或確認製作者。

`STRONGARM_N_PARALLEL.sp` 定義電路與通用 LEVEL=54 模型；`tb_strongarm_n5.sp` 提供激勵、負載、暫態分析與量測。

## 使用前確認

兩檔必須同層；testbench 使用相對 `.include`。通用模型僅供基本連接檢查，不能驗證 65nm 製程或3GHz時序。

保留檔名與相對路徑，另建工作副本進行修改或執行；輸出與波形建議存放 repo 外。先核對 `.include`／`.lib`、subcircuit、模型名稱、激勵與分析指令。版本後綴表示保存的修改順序，不保證最新版已通過功能或製程驗證。

[回到 netlist 總覽](../README.md) · [回到 repository 總覽](../../README.md)

## 已執行的基本模擬

在這次雲端環境中使用 ngspice 44.2，自本資料夾執行：

```bash
ngspice -b -o /tmp/strongarm.log tb_strongarm_n5.sp
```

若使用已設定的雲端環境，先將 `/workspace/.onboarding/bin` 加入 `PATH`；其他機器需自行安裝 ngspice。這些工具與路徑屬環境設定，沒有包入此資料庫。

暫態分析完成2ns、2085筆資料；另以原始波形確認時脈0–1V且輸出為有限值。約0.5ns時 VOUTP−VOUTN 約為0.113V。這只驗證基本模擬執行，沒有確認完整邏輯擺幅或製程性能。

原有量測存在兩項已知問題：`vdiff_out` 的 `v(voutp,voutn)` 在此ngspice執行方式找不到對應向量；`t_resolve` 選到早於觸發的交越，得到負延遲。因此量測沒有全部通過，退出碼0也不能視為通過。原始testbench保持不變，後續研究需另外修正與驗證量測定義。
