**********************************************************************
* tb_strongarm_n5.sp  -- sanity testbench for STRONGARM_N_PARALLEL
* VDD=1.0V, fclk=3GHz (Tclk=333.3ps), VIC=0.5V, differential sweepable
**********************************************************************
.include 'STRONGARM_N_PARALLEL.sp'

* ---- supplies --------------------------------------------------------
VDD     vdd  0  DC 1.0
VSS     vss  0  DC 0

* ---- 3 GHz clock  (PULSE v1 v2 td tr tf pw per) ----------------------
*  CK=0 during reset (precharge), CK=1 during evaluate/regeneration
VCK     ck   0  PULSE(0 1.0 0 20p 20p 146.65p 333.33p)

* ---- differential input around VIC = 0.5 V ---------------------------
*  .param vdiff -> swap to a sweep to reproduce Siddharth Fig.8(a)
.param vic=0.5  vdiff=5m
VINP    vinp 0  DC 'vic + vdiff/2'
VINN    vinn 0  DC 'vic - vdiff/2'

* ---- DUT -------------------------------------------------------------
XDUT    ck vdd vss vinp vinn voutp voutn  STRONGARM_N_PARALLEL

* ---- output load = Siddharth buffer input cap (14 fF) ----------------
CLP     voutp 0  14f
CLN     voutn 0  14f

* ---- analysis --------------------------------------------------------
.tran 1p 2n
.option post probe
.probe v(ck) v(voutp) v(voutn) v(xdut.np) v(xdut.nq) v(xdut.ntail)

* resolve time: CK rising edge of 2nd cycle -> |Vout| crosses VDD/2
.meas tran t_resolve TRIG v(ck) VAL=0.5 RISE=2
+                    TARG v(voutp) VAL=0.5 CROSS=1
.meas tran vdiff_out FIND v(voutp,voutn) AT=0.5n   $ [CONFIRM] sign vs input

.end
**********************************************************************
