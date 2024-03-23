** module name: MandS testbench
** create date: 2024/01/17
** designed by: xinchen

.title MandS testbench
.options list node post=2 probe
.temp 25

** add library section
.protect
.lib '/data2/class/lxy/lxy120/Documents/project2023/
+SMIC40NLL/models/hspice/l0040ll_v1p4_1r.lib' SS
.unprotect


** device under test
.include MandS05.sp  
X_MandS
+ clk resetb start valid 							
+ data7 data6 data5 data4 data3 data2 data1 data0 
+ max7 max6 max5 max4 max3 max2 max1 max0  
+ sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0	
+ MandS_23F

** power supply
.global vdd! gnd! vdd_drv! gnd_drv!
.param pwsp=1.0
Vddgl vdd! 0 dc=pwsp
Vddgnd gnd! 0 dc=0
Vddgl_drv	vdd_drv! 	0	dc=pwsp
Vddgnd_drv	gnd_drv!   0   dc=0


** input driver
.subckt driver in out Wmin=120n Lmin=40n f=1
X_Mp1 nin in vdd_drv! vdd_drv! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn1 nin in gnd_drv! gnd_drv! n11ll_ckt W='Wmin*f' L=Lmin
X_Mp2 out nin vdd_drv! vdd_drv! p11ll_ckt W='Wmin*8*f' L=Lmin
X_Mn2 out nin gnd_drv! gnd_drv! n11ll_ckt W='Wmin*4*f' L=Lmin
.ends driver

** input driver 
X_buffer1	clk_	clk 	driver
X_buffer2	resetb_ resetb 	driver
X_buffer3	start_ 	start 	driver
X_buffer4	valid_ 	valid 	driver
X_buffer5	data_7 	data7 	driver
X_buffer6	data_6 	data6 	driver
X_buffer7	data_5 	data5 	driver
X_buffer8	data_4 	data4 	driver
X_buffer9	data_3 	data3 	driver
X_buffer10	data_2 	data2 	driver
X_buffer11	data_1 	data1 	driver
X_buffer12	data_0 	data0 	driver

** output load
.param cl=25f
Csum11	sum11	0	c=cl
Csum10	sum10	0	c=cl
Csum9	sum9	0	c=cl
Csum8	sum8	0	c=cl
Csum7	sum7	0	c=cl
Csum6	sum6	0	c=cl
Csum5	sum5	0	c=cl
Csum4	sum4	0	c=cl
Csum3	sum3	0	c=cl
Csum2	sum2	0	c=cl
Csum1	sum1	0	c=cl
Csum0	sum0	0	c=cl

Cmax7	max7	0	c=cl
Cmax6	max6	0	c=cl
Cmax5	max5	0	c=cl
Cmax4	max4	0	c=cl
Cmax3	max3	0	c=cl
Cmax2	max2	0	c=cl
Cmax1	max1	0	c=cl
Cmax0	max0	0	c=cl

** add stimulition 
.param fclk=320k tper='1/fclk'
.param ts=10p
.VEC './simu.vec'

Vclk clk_ 	  0	pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)
Vrst resetb_  0	pulse(pwsp 0 50p ts ts 'tper' 10)

** add simulation command
.tran 1n 'tper*95'
.op
.probe tran v(vdd!) v(gnd!) 
+ v(clk) v(resetb) v(start) v(valid) 
+ v(data*) v(sum*) v(max*)

.measure tran avg_power avg p(vddgl) from=0 to='tper*90'

.alter
.param fclk=320k
.param pwsp=0.48V

.alter
.param fclk=320k
.param pwsp=0.45V

.alter
.param fclk=320k
.param pwsp=0.42V

.alter
.param fclk=320k
.param pwsp=0.39V

.alter
.param fclk=320k
.param pwsp=0.36V

.alter
.param fclk=320k
.param pwsp=0.33V

.alter
.param fclk=320k
.param pwsp=0.3V

.alter
.param fclk=0.8g
.param pwsp=0.96V

.alter
.param fclk=0.8g
.param pwsp=0.95V

.alter
.param fclk=0.8g
.param pwsp=0.94V

.end