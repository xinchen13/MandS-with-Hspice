** module name: dff test
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

.include dff.sp
X_dff d q clk rstn dff

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
Vd d 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)
Vclk clk 0 pulse(0 pwsp 'tper-ts/2+30p' ts ts 'tper/8-ts' 'tper/4')
Vrstn rstn 0 pulse(0 pwsp 'tper-ts/2' ts ts 'tper*7/2-ts' 'tper*7')

** add simulation command
.tran 1n 'tper*101'
.op

.probe tran v(vdd!) v(gnd!) v(d) v(q) v(clk) v(rstn)
.measure tran avg_power avg p(vddgl) from=0 to='tper*100'

.alter
.param fclk=2Meg
.param pwsp=1.1V

.END