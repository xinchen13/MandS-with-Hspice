** module name: mux21_12bit_transgate test
** create date: 2024/01/17
** designed by: xinchen

.title test
.options list node post=2 probe

** add library section
.protect
.lib '/data2/class/lxy/lxy120/Documents/project2023/
+SMIC40NLL/models/hspice/l0040ll_v1p4_1r.lib' TT
.unprotect

.global vdd! gnd!

.include mux21_12bit_transgate.sp
X_mux21_12bit_transgate
+ vdd! vdd! vdd! vdd! vdd! vdd! vdd! vdd! vdd! vdd! vdd! vdd!
+ gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd!
+ out0 out1 out2 out3 out4 out5 out6 out7 out8 out9 out10 out11
+ sel
+ mux21_12bit_transgate

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
Vsel sel 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)



** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) 
+ v(out*)
+ v(sel) 
.measure tran avg_power avg p(vddgl) from=0 to='tper*10'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END