** module name: 8-bit comparator (signed) test
** create date: 2024/01/19
** designed by: xinchen

.title test
.options list node post=2 probe

** add library section
.protect
.lib '/data2/class/lxy/lxy120/Documents/project2023/
+SMIC40NLL/models/hspice/l0040ll_v1p4_1r.lib' TT
.unprotect

.global vdd! gnd!

.include comparator8.sp
X_comparator8
+ gnd! vdd! gnd! vdd! gnd! vdd! vdd! vdd!
+ vdd! vdd! gnd! vdd! gnd! vdd! vdd! vdd!
+ q0 q1 q2 q3 q4 q5 q6 q7
+ comparator8

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
Vclk clk 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/8-ts' 'tper/4')
Vrstn rstn 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper*7/2-ts' 'tper*7')



** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) 
+ v(q0) v(q1) v(q2) v(q3) v(q4) v(q5) v(q6) v(q7)
.measure tran avg_power avg p(vddgl) from=0 to='tper*15'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END