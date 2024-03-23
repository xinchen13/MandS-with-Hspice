** module name: 8-bit ripple carry adder test
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

.include rc_adder8.sp
X_rc_adder8
+ vdd! co
+ vdd! vdd! vdd! gnd! gnd! vdd! gnd! vdd!
+ vdd! gnd! vdd! gnd! vdd! gnd! vdd! gnd!
+ sum0 sum1 sum2 sum3 sum4 sum5 sum6 sum7
+ rc_adder8

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


** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) 
+ v(sum*) v(co)
.measure tran avg_power avg p(vddgl) from=0 to='tper*15'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END