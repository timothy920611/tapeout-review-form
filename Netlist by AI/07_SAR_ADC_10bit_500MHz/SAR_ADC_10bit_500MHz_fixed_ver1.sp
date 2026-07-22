* ============================================================
* Hierarchical SPICE Netlist  --  FIXED_VER1
* 10-bit 500MS/s Asynchronous SAR ADC
* Process  : Generic 40nm CMOS (BSIM3v3)  [placeholder; see FinFET notes]
* VDD      : 0.9V  VSS : 0V   (split into VDD_ANA / VDD_DIG)
* Ref[1]   : Ding et al., IEEE TVLSI 2018
* Ref[2]   : Liu et al. (OpenSAR), ICCAD 2021
* Verifier : FinFET AMS verification pass (fixed_ver1)
* Date     : 2026-06-17
*
* CHANGE LOG (vs original) is listed at the bottom of this file (Section 10).
* Items tagged [CONFIRM] require a cross-check against the golden schematic.
* ============================================================

* ============================================================
* Section 0 : Global Parameters
* ============================================================
.PARAM
+ VDD_NOM   = 0.9
+ VSS_NOM   = 0.0
+ VCM       = 0.45
+ Vfs       = 0.8
+ N_BIT     = 10
+ fs        = 500e6
+ Ts        = 2.0e-9
+ alpha     = 0.25
+ beta      = 0.25

* --- Noise budget (unchanged) ---
+ Cu        = 680e-18
+ CDAC_tot  = 348.2e-15
+ Cs_total  = 700e-15
+ Ch_val    = 322e-15

* --- Timing budget (unchanged) ---
+ Tsh       = 1.0e-9
+ Tcmp_bgt  = 30e-12
+ TDAC_bgt  = 40e-12
+ Tdig_bgt  = 30e-12

* --- MOSFET sizing constants ---
+ Lmin      = 40e-9
+ Wn_min    = 80e-9
+ Wp_min    = 120e-9

* ============================================================
* Section 1 : MOSFET Model Calls (external)
*   Models PMOS_40P / NMOS_40N are provided by the .LIB below.
* ============================================================
.LIB "models/40nm_cmos.lib" TT

* ============================================================
* Section 1b : Standard-cell PLACEHOLDER definitions  [ADDED]
*   These exist only so the deck elaborates and passes a
*   connectivity check. Replace with the foundry stdcell lib
*   (and run LVS) before signoff. Digital behaviour is simplified.
*   Convention for stdcells: signal pins first, supplies LAST
*   (matches every existing X-instance in Sections 5/6).
* ============================================================
.SUBCKT INV_X1 A Y VDD VSS
MP Y A VDD VDD PMOS_40P W=240n L=40n
MN Y A VSS VSS NMOS_40N W=120n L=40n
.ENDS INV_X1

.SUBCKT BUF_X1 A Y VDD VSS
XI1 A net_bi VDD VSS INV_X1
XI2 net_bi Y VDD VSS INV_X1
.ENDS BUF_X1

.SUBCKT BUF_X2 A Y VDD VSS
XI1 A net_bi VDD VSS INV_X1
XI2 net_bi Y VDD VSS INV_X1
.ENDS BUF_X2

* AOI21: Y = NOT(A*B + C)
.SUBCKT AOI21_X1 A B C Y VDD VSS
* pull-up: (A||B) in series with C
MPA VDD A nint VDD PMOS_40P W=240n L=40n
MPB VDD B nint VDD PMOS_40P W=240n L=40n
MPC nint C Y   VDD PMOS_40P W=240n L=40n
* pull-down: (A series B) || C
MNA Y A nab VSS NMOS_40N W=120n L=40n
MNB nab B VSS VSS NMOS_40N W=120n L=40n
MNC Y C VSS VSS NMOS_40N W=120n L=40n
.ENDS AOI21_X1

* Positive-edge-triggered D flip-flop (transmission-gate master-slave)
* Ports: CLK D Q QB VDD VSS
.SUBCKT DFF_X1 CLK D Q QB VDD VSS
XINV_CK CLK ckb VDD VSS INV_X1
* --- master latch ---
MP_im dm  CLK D   VDD PMOS_40P W=240n L=40n
MN_im dm  ckb D   VSS NMOS_40N W=120n L=40n
XINV_m1 dm  dmb    VDD VSS INV_X1
XINV_m2 dmb dm_fb  VDD VSS INV_X1
MP_fm dm  ckb dm_fb VDD PMOS_40P W=120n L=40n
MN_fm dm  CLK dm_fb VSS NMOS_40N W=80n  L=40n
* --- slave latch ---
MP_is ds  ckb dmb VDD PMOS_40P W=240n L=40n
MN_is ds  CLK dmb VSS NMOS_40N W=120n L=40n
XINV_s1 ds Q  VDD VSS INV_X1
XINV_s2 Q  QB VDD VSS INV_X1
MP_fs ds  CLK QB VDD PMOS_40P W=120n L=40n
MN_fs ds  ckb QB VSS NMOS_40N W=80n  L=40n
.ENDS DFF_X1

* 11-input NOR (placeholder; series PMOS stack acceptable for connectivity)
.SUBCKT NOR11_X1 A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 Y VDD VSS
* pull-down: parallel NMOS
MN0  Y A0  VSS VSS NMOS_40N W=120n L=40n
MN1  Y A1  VSS VSS NMOS_40N W=120n L=40n
MN2  Y A2  VSS VSS NMOS_40N W=120n L=40n
MN3  Y A3  VSS VSS NMOS_40N W=120n L=40n
MN4  Y A4  VSS VSS NMOS_40N W=120n L=40n
MN5  Y A5  VSS VSS NMOS_40N W=120n L=40n
MN6  Y A6  VSS VSS NMOS_40N W=120n L=40n
MN7  Y A7  VSS VSS NMOS_40N W=120n L=40n
MN8  Y A8  VSS VSS NMOS_40N W=120n L=40n
MN9  Y A9  VSS VSS NMOS_40N W=120n L=40n
MN10 Y A10 VSS VSS NMOS_40N W=120n L=40n
* pull-up: series PMOS
MP0  VDD A0  p1  VDD PMOS_40P W=480n L=40n
MP1  p1  A1  p2  VDD PMOS_40P W=480n L=40n
MP2  p2  A2  p3  VDD PMOS_40P W=480n L=40n
MP3  p3  A3  p4  VDD PMOS_40P W=480n L=40n
MP4  p4  A4  p5  VDD PMOS_40P W=480n L=40n
MP5  p5  A5  p6  VDD PMOS_40P W=480n L=40n
MP6  p6  A6  p7  VDD PMOS_40P W=480n L=40n
MP7  p7  A7  p8  VDD PMOS_40P W=480n L=40n
MP8  p8  A8  p9  VDD PMOS_40P W=480n L=40n
MP9  p9  A9  p10 VDD PMOS_40P W=480n L=40n
MP10 p10 A10 Y   VDD PMOS_40P W=480n L=40n
.ENDS NOR11_X1

* ============================================================
* Section 2 : .SUBCKT BOOTSTRAP_SW
*   Ports [REORDERED]: VDD VSS  VIN VOUT  CLK CLKB
*   (SEM Playbook: VDD,VSS,Analog,Clocks)
* ============================================================
.SUBCKT BOOTSTRAP_SW  VDD VSS  VIN VOUT  CLK CLKB
*
* --- Voltage multiplier (less-critical, fixed sizing) ---
M1  net_a   CLK    VDD    VDD   PMOS_40P  W=200n  L=40n
M2  net_b   CLK    VDD    VDD   PMOS_40P  W=200n  L=40n
M3  net_c   net_b  VDD    VDD   PMOS_40P  W=200n  L=40n
M4  net_d   net_c  net_e  VSS   NMOS_40N  W=160n  L=40n
M5  net_e   CLK    VSS    VSS   NMOS_40N  W=160n  L=40n
M9  net_d   CLKB   VSS    VSS   NMOS_40N  W=160n  L=40n
* [REMOVED] M6/M7/M8 dead branch -> drove only floating net_h. [CONFIRM]
*
* Bootstrap capacitor (holds boosted voltage)
C_boot  net_a  net_d  {20*Cu}
*
* --- Critical devices ---
M10  net_gate  net_a    VDD    VDD   PMOS_40P  W=480n  L=40n
M11  net_gate  net_gate VDD    VDD   PMOS_40P  W=240n  L=40n
M12  VIN       net_gate VOUT   VSS   NMOS_40N  W=560n  L=40n
*
* Optional: keep-alive conductance so boost nodes have a DC path for .OP
Rka_a  net_a   VDD  1e12
Rka_g  net_gate VDD 1e12
.ENDS BOOTSTRAP_SW

* ============================================================
* Section 3 : .SUBCKT STRONGARM_COMP
*   Ports [REORDERED]: VDD VSS  INP INN OUTP OUTN  CLK_CMP CLKB_CMP
* ============================================================
.SUBCKT STRONGARM_COMP  VDD VSS  INP INN OUTP OUTN  CLK_CMP CLKB_CMP
*
M_tail  net_t1  CLK_CMP  VSS  VSS  NMOS_40N  W=960n  L=80n
M_in_p  net_p1  INP  net_t1  VSS  NMOS_40N  W=1200n  L=40n
M_in_n  net_n1  INN  net_t1  VSS  NMOS_40N  W=1200n  L=40n
M_lp_p  net_p1  net_p1  VDD  VDD  PMOS_40P  W=480n   L=40n
M_lp_n  net_n1  net_n1  VDD  VDD  PMOS_40P  W=480n   L=40n
*
M_rp1  OUTP  OUTN  VDD  VDD  PMOS_40P  W=640n  L=40n
M_rp2  OUTN  OUTP  VDD  VDD  PMOS_40P  W=640n  L=40n
M_rn1  OUTP  OUTN  net_p1  VSS  NMOS_40N  W=640n  L=40n
M_rn2  OUTN  OUTP  net_n1  VSS  NMOS_40N  W=640n  L=40n
M_rst_p  OUTP  CLKB_CMP  VDD  VDD  PMOS_40P  W=320n  L=40n
M_rst_n  OUTN  CLKB_CMP  VDD  VDD  PMOS_40P  W=320n  L=40n
*
M_sr_np  net_qp  OUTN  VDD  VDD  PMOS_40P  W=240n  L=40n
M_sr_nn  net_qp  OUTP  VSS  VSS  NMOS_40N  W=160n  L=40n
M_sr_pp  net_qn  OUTP  VDD  VDD  PMOS_40P  W=240n  L=40n
M_sr_pn  net_qn  OUTN  VSS  VSS  NMOS_40N  W=160n  L=40n
XINVP  net_qp  OUTP  VDD  VSS  INV_X1
XINVN  net_qn  OUTN  VDD  VSS  INV_X1
*
.ENDS STRONGARM_COMP

* ============================================================
* Section 4 : .SUBCKT CDAC
*   Ports [REORDERED + ADDED D*_B and PHI_SB; REMOVED DR]:
*     VDD VSS  VIN VREF VCM VOUTP VOUTN
*     D0..D10  D0_B..D10_B  PHI_S PHI_SB
* ============================================================
.SUBCKT CDAC  VDD VSS  VIN VREF VCM VOUTP VOUTN
+             D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 D10
+             D0_B D1_B D2_B D3_B D4_B D5_B D6_B D7_B D8_B D9_B D10_B
+             PHI_S PHI_SB
*
* --- Top-plate sampling switches ---  [REORDERED port mapping]
XSMP  VDD VSS  VIN  VOUTP  PHI_S  PHI_SB  BOOTSTRAP_SW
* Negative side samples VCM (single-ended / pseudo-diff input)
XSMN  VDD VSS  VCM  VOUTN  PHI_S  PHI_SB  BOOTSTRAP_SW
*
* === Positive Capacitor Array ===
C_Rp   VOUTP  VCM    {1*Cu}
C_b0p  VOUTP  bot_b0p  {1*Cu}
C_b1p  VOUTP  bot_b1p  {2*Cu}
C_b2p  VOUTP  bot_b2p  {2*Cu}
C_b3p  VOUTP  bot_b3p  {4*Cu}
C_b4p  VOUTP  bot_b4p  {6*Cu}
C_b5p  VOUTP  bot_b5p  {12*Cu}
C_b6p  VOUTP  bot_b6p  {24*Cu}
C_b7p  VOUTP  bot_b7p  {48*Cu}
C_b8p  VOUTP  bot_b8p  {96*Cu}
C_b9p  VOUTP  bot_b9p  {192*Cu}
C_b10p VOUTP  bot_b10p {384*Cu}
C_attp  VOUTP  VCM    {Ch_val}
*
* === Negative Capacitor Array (mirror) ===
C_Rn   VOUTN  VCM    {1*Cu}
C_b0n  VOUTN  bot_b0n  {1*Cu}
C_b1n  VOUTN  bot_b1n  {2*Cu}
C_b2n  VOUTN  bot_b2n  {2*Cu}
C_b3n  VOUTN  bot_b3n  {4*Cu}
C_b4n  VOUTN  bot_b4n  {6*Cu}
C_b5n  VOUTN  bot_b5n  {12*Cu}
C_b6n  VOUTN  bot_b6n  {24*Cu}
C_b7n  VOUTN  bot_b7n  {48*Cu}
C_b8n  VOUTN  bot_b8n  {96*Cu}
C_b9n  VOUTN  bot_b9n  {192*Cu}
C_b10n VOUTN  bot_b10n {384*Cu}
C_attn  VOUTN  VCM    {Ch_val}
*
* ============================================================
* DAC Bottom-Plate Switches
*   [FIXED] X-prefix -> M-prefix (NMOS_40N is a model, not a subckt)
*   [FIXED] terminal order to D=rail  G=control  S=bot_plate  B=VSS
* ============================================================
* --- Positive array switches ---
MSWB0p_H  VREF  D0     bot_b0p   VSS  NMOS_40N  W=80n   L=40n
MSWB0p_L  VCM   D0_B   bot_b0p   VSS  NMOS_40N  W=80n   L=40n
MSWB1p_H  VREF  D1     bot_b1p   VSS  NMOS_40N  W=100n  L=40n
MSWB1p_L  VCM   D1_B   bot_b1p   VSS  NMOS_40N  W=100n  L=40n
MSWB2p_H  VREF  D2     bot_b2p   VSS  NMOS_40N  W=100n  L=40n
MSWB2p_L  VCM   D2_B   bot_b2p   VSS  NMOS_40N  W=100n  L=40n
MSWB3p_H  VREF  D3     bot_b3p   VSS  NMOS_40N  W=120n  L=40n
MSWB3p_L  VCM   D3_B   bot_b3p   VSS  NMOS_40N  W=120n  L=40n
MSWB4p_H  VREF  D4     bot_b4p   VSS  NMOS_40N  W=160n  L=40n
MSWB4p_L  VCM   D4_B   bot_b4p   VSS  NMOS_40N  W=160n  L=40n
MSWB5p_H  VREF  D5     bot_b5p   VSS  NMOS_40N  W=200n  L=40n
MSWB5p_L  VCM   D5_B   bot_b5p   VSS  NMOS_40N  W=200n  L=40n
MSWB6p_H  VREF  D6     bot_b6p   VSS  NMOS_40N  W=280n  L=40n
MSWB6p_L  VCM   D6_B   bot_b6p   VSS  NMOS_40N  W=280n  L=40n
MSWB7p_H  VREF  D7     bot_b7p   VSS  NMOS_40N  W=360n  L=40n
MSWB7p_L  VCM   D7_B   bot_b7p   VSS  NMOS_40N  W=360n  L=40n
MSWB8p_H  VREF  D8     bot_b8p   VSS  NMOS_40N  W=440n  L=40n
MSWB8p_L  VCM   D8_B   bot_b8p   VSS  NMOS_40N  W=440n  L=40n
MSWB9p_H  VREF  D9     bot_b9p   VSS  NMOS_40N  W=520n  L=40n
MSWB9p_L  VCM   D9_B   bot_b9p   VSS  NMOS_40N  W=520n  L=40n
MSWB10p_H VREF  D10    bot_b10p  VSS  NMOS_40N  W=600n  L=40n
MSWB10p_L VCM   D10_B  bot_b10p  VSS  NMOS_40N  W=600n  L=40n
* --- Negative array switches (complement control sense) ---
MSWB0n_H  VREF  D0_B   bot_b0n   VSS  NMOS_40N  W=80n   L=40n
MSWB0n_L  VCM   D0     bot_b0n   VSS  NMOS_40N  W=80n   L=40n
MSWB1n_H  VREF  D1_B   bot_b1n   VSS  NMOS_40N  W=100n  L=40n
MSWB1n_L  VCM   D1     bot_b1n   VSS  NMOS_40N  W=100n  L=40n
MSWB2n_H  VREF  D2_B   bot_b2n   VSS  NMOS_40N  W=100n  L=40n
MSWB2n_L  VCM   D2     bot_b2n   VSS  NMOS_40N  W=100n  L=40n
MSWB3n_H  VREF  D3_B   bot_b3n   VSS  NMOS_40N  W=120n  L=40n
MSWB3n_L  VCM   D3     bot_b3n   VSS  NMOS_40N  W=120n  L=40n
MSWB4n_H  VREF  D4_B   bot_b4n   VSS  NMOS_40N  W=160n  L=40n
MSWB4n_L  VCM   D4     bot_b4n   VSS  NMOS_40N  W=160n  L=40n
MSWB5n_H  VREF  D5_B   bot_b5n   VSS  NMOS_40N  W=200n  L=40n
MSWB5n_L  VCM   D5     bot_b5n   VSS  NMOS_40N  W=200n  L=40n
MSWB6n_H  VREF  D6_B   bot_b6n   VSS  NMOS_40N  W=280n  L=40n
MSWB6n_L  VCM   D6     bot_b6n   VSS  NMOS_40N  W=280n  L=40n
MSWB7n_H  VREF  D7_B   bot_b7n   VSS  NMOS_40N  W=360n  L=40n
MSWB7n_L  VCM   D7     bot_b7n   VSS  NMOS_40N  W=360n  L=40n
MSWB8n_H  VREF  D8_B   bot_b8n   VSS  NMOS_40N  W=440n  L=40n
MSWB8n_L  VCM   D8     bot_b8n   VSS  NMOS_40N  W=440n  L=40n
MSWB9n_H  VREF  D9_B   bot_b9n   VSS  NMOS_40N  W=520n  L=40n
MSWB9n_L  VCM   D9     bot_b9n   VSS  NMOS_40N  W=520n  L=40n
MSWB10n_H VREF  D10_B  bot_b10n  VSS  NMOS_40N  W=600n  L=40n
MSWB10n_L VCM   D10    bot_b10n  VSS  NMOS_40N  W=600n  L=40n
.ENDS CDAC

* ============================================================
* Section 5 : .SUBCKT SAR_LOGIC  (behavioural placeholder)
*   Ports [REORDERED]: VDD VSS  CLK_EXT PHI_S PHI_SB
*     COMP_OUTP COMP_OUTN  D0..D10  D0_B..D10_B  EOC
*   NOTE: digital functionality is a placeholder; replace with
*         synthesized async SAR logic before signoff. [CONFIRM]
* ============================================================
.SUBCKT SAR_LOGIC  VDD VSS  CLK_EXT PHI_S PHI_SB
+                  COMP_OUTP COMP_OUTN
+                  D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 D10
+                  D0_B D1_B D2_B D3_B D4_B D5_B D6_B D7_B D8_B D9_B D10_B
+                  EOC

* --- Phase generator ---
XDFF_PHI  CLK_EXT  VDD  net_phiQ  net_phiQB  VDD  VSS  DFF_X1
XINV_PHI  net_phiQ  PHI_S  VDD  VSS  INV_X1
XINV_PHIS  PHI_S  PHI_SB  VDD  VSS  INV_X1

* --- Async internal clock ---
XBUF_COUT  COMP_OUTP  net_cvalid  VDD  VSS  BUF_X2
XINV_CASYNC  net_cvalid  net_casync_b  VDD  VSS  INV_X1

* --- Bit-enable shift register (one-hot, D10 first) ---
XDFF_B10  net_casync_b  PHI_SB     net_en10  net_en10B  VDD  VSS  DFF_X1
XDFF_B9   net_casync_b  net_en10B  net_en9   net_en9B   VDD  VSS  DFF_X1
XDFF_B8   net_casync_b  net_en9B   net_en8   net_en8B   VDD  VSS  DFF_X1
XDFF_B7   net_casync_b  net_en8B   net_en7   net_en7B   VDD  VSS  DFF_X1
XDFF_B6   net_casync_b  net_en7B   net_en6   net_en6B   VDD  VSS  DFF_X1
XDFF_B5   net_casync_b  net_en6B   net_en5   net_en5B   VDD  VSS  DFF_X1
XDFF_B4   net_casync_b  net_en5B   net_en4   net_en4B   VDD  VSS  DFF_X1
XDFF_B3   net_casync_b  net_en4B   net_en3   net_en3B   VDD  VSS  DFF_X1
XDFF_B2   net_casync_b  net_en3B   net_en2   net_en2B   VDD  VSS  DFF_X1
XDFF_B1   net_casync_b  net_en2B   net_en1   net_en1B   VDD  VSS  DFF_X1
XDFF_B0   net_casync_b  net_en1B   net_en0   net_en0B   VDD  VSS  DFF_X1

* --- Bit decision latches ---
*   [FIXED] AOI21 C-input (hold term) was floating -> tied to VSS
*   so each AOI acts as NAND(COMP_OUTP, en[i]). [CONFIRM hold logic]
XAOI_D10  COMP_OUTP  net_en10  VSS  net_d10_set  VDD  VSS  AOI21_X1
XDFF_D10  net_casync_b  net_d10_set  D10  D10_B  VDD  VSS  DFF_X1
XAOI_D9   COMP_OUTP  net_en9   VSS  net_d9_set   VDD  VSS  AOI21_X1
XDFF_D9   net_casync_b  net_d9_set   D9   D9_B   VDD  VSS  DFF_X1
XAOI_D8   COMP_OUTP  net_en8   VSS  net_d8_set   VDD  VSS  AOI21_X1
XDFF_D8   net_casync_b  net_d8_set   D8   D8_B   VDD  VSS  DFF_X1
XAOI_D7   COMP_OUTP  net_en7   VSS  net_d7_set   VDD  VSS  AOI21_X1
XDFF_D7   net_casync_b  net_d7_set   D7   D7_B   VDD  VSS  DFF_X1
XAOI_D6   COMP_OUTP  net_en6   VSS  net_d6_set   VDD  VSS  AOI21_X1
XDFF_D6   net_casync_b  net_d6_set   D6   D6_B   VDD  VSS  DFF_X1
XAOI_D5   COMP_OUTP  net_en5   VSS  net_d5_set   VDD  VSS  AOI21_X1
XDFF_D5   net_casync_b  net_d5_set   D5   D5_B   VDD  VSS  DFF_X1
XAOI_D4   COMP_OUTP  net_en4   VSS  net_d4_set   VDD  VSS  AOI21_X1
XDFF_D4   net_casync_b  net_d4_set   D4   D4_B   VDD  VSS  DFF_X1
XAOI_D3   COMP_OUTP  net_en3   VSS  net_d3_set   VDD  VSS  AOI21_X1
XDFF_D3   net_casync_b  net_d3_set   D3   D3_B   VDD  VSS  DFF_X1
XAOI_D2   COMP_OUTP  net_en2   VSS  net_d2_set   VDD  VSS  AOI21_X1
XDFF_D2   net_casync_b  net_d2_set   D2   D2_B   VDD  VSS  DFF_X1
XAOI_D1   COMP_OUTP  net_en1   VSS  net_d1_set   VDD  VSS  AOI21_X1
XDFF_D1   net_casync_b  net_d1_set   D1   D1_B   VDD  VSS  DFF_X1
XAOI_D0   COMP_OUTP  net_en0   VSS  net_d0_set   VDD  VSS  AOI21_X1
XDFF_D0   net_casync_b  net_d0_set   D0   D0_B   VDD  VSS  DFF_X1

* --- EOC generation ---
XNOR_EOC  net_en10  net_en9  net_en8  net_en7  net_en6
+         net_en5   net_en4  net_en3  net_en2  net_en1  net_en0
+         EOC  VDD  VSS  NOR11_X1
.ENDS SAR_LOGIC

* ============================================================
* Section 6 : .SUBCKT SAR_ADC_TOP
*   Ports [REORDERED + SPLIT SUPPLY]:
*     VDD_ANA VDD_DIG VSS  VIN VREF  CLK_EXT  DOUT9..DOUT0 EOC
* ============================================================
.SUBCKT SAR_ADC_TOP  VDD_ANA VDD_DIG VSS  VIN VREF  CLK_EXT
+                    DOUT9 DOUT8 DOUT7 DOUT6 DOUT5
+                    DOUT4 DOUT3 DOUT2 DOUT1 DOUT0 EOC

* Internal common-mode reference
VCMO      VCM_INT  VSS  DC 0.45
* [REMOVED] internal VREF_SRC: VREF is a port driven externally (no double-drive)

* Instance 1: SAR Logic (digital domain)
XSAR_LOGIC  VDD_DIG VSS  CLK_EXT  phi_s  phi_sb
+           comp_outp  comp_outn
+           d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
+           d0b d1b d2b d3b d4b d5b d6b d7b d8b d9b d10b
+           EOC
+           SAR_LOGIC

* Instance 2: Differential CDAC (analog domain)
*   [FIXED] now receives complementary bits and PHI_SB
XCDAC  VDD_ANA VSS  VIN  VREF  VCM_INT  dac_top_p  dac_top_n
+      d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
+      d0b d1b d2b d3b d4b d5b d6b d7b d8b d9b d10b
+      phi_s  phi_sb
+      CDAC

* Instance 3: Strong-arm comparator (analog domain)
XCOMP  VDD_ANA VSS  dac_top_p  dac_top_n
+      comp_outp  comp_outn
+      clk_cmp  clk_cmpb
+      STRONGARM_COMP

* Comparator clock (digital buffers)
XBUF_CLKCMP  phi_sb  clk_cmp  VDD_DIG VSS  BUF_X2
XINV_CLKCMPB  clk_cmp  clk_cmpb  VDD_DIG VSS  INV_X1

* Output buffers (D10=MSB -> DOUT9 ... D1 -> DOUT0; 1-bit redundancy mode)
XBUF_Q9   d10  DOUT9  VDD_DIG VSS  BUF_X1
XBUF_Q8   d9   DOUT8  VDD_DIG VSS  BUF_X1
XBUF_Q7   d8   DOUT7  VDD_DIG VSS  BUF_X1
XBUF_Q6   d7   DOUT6  VDD_DIG VSS  BUF_X1
XBUF_Q5   d6   DOUT5  VDD_DIG VSS  BUF_X1
XBUF_Q4   d5   DOUT4  VDD_DIG VSS  BUF_X1
XBUF_Q3   d4   DOUT3  VDD_DIG VSS  BUF_X1
XBUF_Q2   d3   DOUT2  VDD_DIG VSS  BUF_X1
XBUF_Q1   d2   DOUT1  VDD_DIG VSS  BUF_X1
XBUF_Q0   d1   DOUT0  VDD_DIG VSS  BUF_X1

* Decoupling (per domain)
C_dec_vdda  VDD_ANA  VSS  500f
C_dec_vddd  VDD_DIG  VSS  500f
C_dec_vref  VREF     VSS  200f
C_dec_vcm   VCM_INT  VSS  200f
.ENDS SAR_ADC_TOP

* ============================================================
* Section 7 : Testbench
* ============================================================
.TITLE 10-bit 500MS/s SAR ADC Testbench (fixed_ver1)

* Split supplies (set VDD_ANA=0.78 for FinFET port; 0.9 kept for 40nm)
VDDA_TB   VDD_ANA_TB  VSS_TB  DC 0.9
VDDD_TB   VDD_DIG_TB  VSS_TB  DC 0.9
VREF_TB   VREF_TB     VSS_TB  DC 0.9
VGND      VSS_TB      0       DC 0

* Differential input (pseudo-diff: negative side samples VCM internally)
*   [FIXED] fin set to coherent prime bin 1913/4096 for 4096-pt FFT
*   fin = 1913/4096 * 500MHz = 233.52MHz (near-Nyquist, coherent)
VIN_TB    VIN_TB  VSS_TB  DC 0.45
+                         AC 1
+                         SIN(0.45 0.4 233.52MEG 0 0 0)

* Clock: 500MHz, 50% duty
VCLK_TB   CLK_TB  VSS_TB  PULSE(0 0.9 0 20p 20p 1n 2n)

* DUT  [REORDERED + split supply]
XDUT  VDD_ANA_TB  VDD_DIG_TB  VSS_TB  VIN_TB  VREF_TB  CLK_TB
+     DOUT9 DOUT8 DOUT7 DOUT6 DOUT5
+     DOUT4 DOUT3 DOUT2 DOUT1 DOUT0 EOC_OUT
+     SAR_ADC_TOP

* ============================================================
* Simulation controls
* ============================================================
* Convergence aid for bootstrap boost nodes (cap/gate-only nodes)
.OPTIONS GMIN=1e-12 RELTOL=1e-3

* Transient: 4096 samples * 2ns = 8.192us
.TRAN  10p  8.192u  0  10p
.OP

* [FIXED] Removed .DC INL/DNL sweep: a clocked async SAR cannot be
*   characterised by a static .DC sweep. Use a transient ramp/sine
*   + code histogram for INL/DNL instead.
* .DC  VIN_TB  0  0.9  875u

* [FIXED] Removed .NOISE at digital output (DOUT0): not physically
*   meaningful. Evaluate input-referred noise at the comparator input
*   (dac_top_p/dac_top_n) in a dedicated comparator testbench.
* .NOISE V(DOUT0) VIN_TB DEC 100 1MEG 250MEG

* Save key signals
.SAVE  V(VIN_TB) V(CLK_TB) V(dac_top_p) V(dac_top_n)
.SAVE  V(comp_outp) V(comp_outn)
.SAVE  V(DOUT9) V(DOUT8) V(DOUT7) V(DOUT6) V(DOUT5)
.SAVE  V(DOUT4) V(DOUT3) V(DOUT2) V(DOUT1) V(DOUT0)
.SAVE  V(EOC_OUT) V(phi_s)

.MEASURE  TRAN  Tconv_meas  TRIG V(phi_s) VAL=0.45 FALL=1
+                           TARG V(EOC_OUT) VAL=0.45 RISE=1

* ============================================================
* Section 10 : CHANGE LOG (fixed_ver1 vs original)
* ------------------------------------------------------------
* [Fatal] CDAC: added ports D0_B..D10_B and PHI_SB; routed from
*         SAR_LOGIC at top (resolves 12 floating control gates).
* [Fatal] CDAC: removed unused DR port and top-level drdum net.
* [Fatal] CDAC switches: 'X' prefix -> 'M' (NMOS_40N is a model);
*         fixed D-G-S order to (rail, control, bot_plate).
* [Fatal] BOOTSTRAP_SW: removed dead M6/M7/M8 branch -> killed
*         floating net_h (also net_f/net_g). [CONFIRM vs schematic]
* [Fatal] Added stdcell placeholder .SUBCKTs: INV/BUF_X1/BUF_X2/
*         DFF_X1/AOI21_X1/NOR11_X1 (deck now elaborates).
* [High ] SAR_ADC_TOP: removed internal VREF_SRC (port double-drive).
* [High ] SAR_LOGIC: AOI21 floating C-input tied to VSS (11 nodes).
* [Med  ] Pin ordering: all custom subckts -> VDD,VSS,Analog,Clocks.
* [Med  ] Supply split: VDD_ANA (bootstrap/comp/CDAC) vs VDD_DIG
*         (SAR logic + buffers); per-domain decap.
* [Flow ] Testbench: coherent fin (233.52MHz); removed .DC INL and
*         .NOISE-on-digital; added GMIN for boost-node convergence;
*         added Rka keep-alive in BOOTSTRAP_SW.
* ============================================================
.END
