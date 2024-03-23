.title test
.options list node post=2 probe

** add library section
.protect
.lib '/data2/class/lxy/lxy120/Documents/project2023/
+SMIC40NLL/models/hspice/l0040ll_v1p4_1r.lib' TT
.unprotect

.global vdd! gnd!

.include inv.sp
X_inv1 in nin INV_SYQ
X_inv2 nin out INV_SYQ f=4

** add output load
.param cl=20f
Cload out 0 c=cl

** add power supply
.param pwsp=1.0
Vddgl vdd! 0 dc=pwsp
Vddgnd gnd! 0 dc=0

** add simulation
.param fclk=200k tper='1/fclk'
.param ts=10p
Vclk in 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)

** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) v(in) v(nin) v(out)
.measure tran avg_power avg p(vddgl) from=0 to='tper*100'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END