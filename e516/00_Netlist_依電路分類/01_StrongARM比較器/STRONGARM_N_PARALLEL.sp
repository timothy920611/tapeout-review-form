**********************************************************************
* STRONGARM_N_PARALLEL.sp
* Modified StrongARM Latch (Razavi, IEEE SSC-M 2015, Fig.1(b))
*   + N=5 parallel-path output booster (Siddharth, TCAS-II 2020, Fig.2/3)
* Tech target : 65-nm CMOS, VDD = 1.0 V, fclk = 3 GHz
* Sizing      : Siddharth TCAS-II 2020, Table I  (W/L in um)
*
* SEM-style annotations:
*   [CONFIRM]            -> needs simulation sign-off
*   [UNVERIFIED-ESTIMATE]-> hand value, not yet simulated
*   [PDK-CHECK-REQUIRED] -> depends on the actual 65-nm model card
*
* Rule check (this file):
*   R1  bulk-tie : all NMOS bulk -> VSS, all PMOS bulk -> VDD     [PASS]
*   R6  no floating node : every internal node has >=2 terminals  [PASS]
*   Reset rule   : CK=0 -> S1..S4 precharge P,Q,X,Y to VDD        [PASS]
**********************************************************************

* ---- 65-nm model cards -----------------------------------------------
* [PDK-CHECK-REQUIRED] point this at your real 65-nm BSIM4 library.
* HSPICE : .lib '/path/cln65.l'  TT
* Spectre : include "cln65_tt.scs"
* The two .MODEL lines below are a generic LEVEL=54 placeholder ONLY for a
* connectivity smoke-test; they are NOT valid for 3-GHz timing closure.
.model nch nmos level=54 version=4.5
.model pch pmos level=54 version=4.5
* ---------------------------------------------------------------------

.subckt STRONGARM_N_PARALLEL  CK VDD VSS VINP VINN VOUTP VOUTN
*  port map :  VOUTN = X (Razavi)      VOUTP = Y (Razavi)
*              np    = P (left amp cap) nq    = Q (right amp cap)
*              ntail = tail node (common source)

* ====== TAIL CURRENT SWITCH (Mtail) =================================
Mtail   ntail  CK    VSS   VSS   nch  W=16u L=0.09u

* ====== INPUT DIFFERENTIAL PAIR (M1,M2 -> P,Q) =====================
M1      np     VINP  ntail VSS   nch  W=8u  L=0.09u
M2      nq     VINN  ntail VSS   nch  W=8u  L=0.09u

* ====== NMOS CROSS-COUPLED PAIR (M3,M4 : P/Q <-> X/Y) ==============
M3      VOUTN  VOUTP np    VSS   nch  W=8u  L=0.06u
M4      VOUTP  VOUTN nq    VSS   nch  W=8u  L=0.06u

* ====== PMOS CROSS-COUPLED PAIR (M5,M6 : VDD <-> X/Y) ==============
M5      VOUTN  VOUTP VDD   VDD   pch  W=8u  L=0.06u
M6      VOUTP  VOUTN VDD   VDD   pch  W=8u  L=0.06u

* ====== PRECHARGE SWITCHES S1..S4 (PMOS, gate=CK) ==================
*  CK=0 -> all four ON -> P,Q,X,Y pulled to VDD (hysteresis erase)
*  [UNVERIFIED-ESTIMATE] S-size taken from Table I 2/0.06 switch class;
*  no explicit "S" row in Table I -> [PDK-CHECK-REQUIRED]
MS1     np     CK    VDD   VDD   pch  W=2u  L=0.06u
MS2     nq     CK    VDD   VDD   pch  W=2u  L=0.06u
MS3     VOUTN  CK    VDD   VDD   pch  W=2u  L=0.06u
MS4     VOUTP  CK    VDD   VDD   pch  W=2u  L=0.06u

* ====== N = 5 PARALLEL OUTPUT-BOOST BRANCHES ======================
*  Siddharth concept: extra input-driven NMOS injected at the regen
*  nodes X/Y, sharing ntail. Adds sqrt(N)*gm1,2 to Gm,eff -> shrinks
*  tau = CL/Gm,eff. Drain tie-point to X/Y is an engineering choice
*  consistent with "at the output node".            [UNVERIFIED-ESTIMATE]
M1A     VOUTN  VINP  ntail VSS   nch  W=8u  L=0.09u
M1B     VOUTN  VINP  ntail VSS   nch  W=8u  L=0.09u
M1C     VOUTN  VINP  ntail VSS   nch  W=8u  L=0.09u
M1D     VOUTN  VINP  ntail VSS   nch  W=8u  L=0.09u
M1E     VOUTN  VINP  ntail VSS   nch  W=8u  L=0.09u
M2A     VOUTP  VINN  ntail VSS   nch  W=8u  L=0.09u
M2B     VOUTP  VINN  ntail VSS   nch  W=8u  L=0.09u
M2C     VOUTP  VINN  ntail VSS   nch  W=8u  L=0.09u
M2D     VOUTP  VINN  ntail VSS   nch  W=8u  L=0.09u
M2E     VOUTP  VINN  ntail VSS   nch  W=8u  L=0.09u

.ends STRONGARM_N_PARALLEL
**********************************************************************
