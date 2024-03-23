** module name: dff8 test
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

.include dff8.sp
X_dff8
+ d0 vdd! gnd! d3 gnd! d5 d6 vdd!
+ q0 q1 q2 q3 q4 q5 q6 q7
+ clk rstn 
+ dff8

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
Vd0 d0 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/4-ts' 'tper/2')
Vd3 d3 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/8-ts' 'tper/4')
Vd5 d5 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/4-ts' 'tper/2')
Vd6 d6 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/8-ts' 'tper/4')


** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) 
+ v(d0) v(d3) v(d5) v(d6)
+ v(clk) v(rstn) 
+ v(q0) v(q1) v(q2) v(q3) v(q4) v(q5) v(q6) v(q7)
.measure tran avg_power avg p(vddgl) from=0 to='tper*15'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END