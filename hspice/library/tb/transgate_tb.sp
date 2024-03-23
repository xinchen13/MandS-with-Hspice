** module name: transfer gate test
** create date: 2024/01/16
** designed by: xinchen

.title test
.options list node post=2 probe

** add library section
.protect
.lib '/data2/class/lxy/lxy120/Documents/project2023/
+SMIC40NLL/models/hspice/l0040ll_v1p4_1r.lib' TT
.unprotect

.global vdd! gnd!

.include transgate.sp
.include inv.sp
X_transgate in out ctr_n ctr_p transgate
X_inv ctr_p ctr_n inv

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
Vin in 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)
Vctr_p  ctr_p  0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/4-ts' 'tper/2')

** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) v(in) v(out) v(ctr_n) v(ctr_p)
.measure tran avg_power avg p(vddgl) from=0 to='tper*100'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END