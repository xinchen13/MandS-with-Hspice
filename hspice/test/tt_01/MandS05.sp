** module name: MandS
** create date: 2024/01/16
** designed by: xinchen

.title stream feature extractor by group05

.subckt MandS_23F
+ clk resetb start valid
+ data7 data6 data5 data4 data3 data2 data1 data0
+ max7 max6 max5 max4 max3 max2 max1 max0
+ sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0

X_valid_sum_data
+ data0 data1 data2 data3 data4 data5 data6 data7 
+ gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd!
+ valid_sum_data0 valid_sum_data1 valid_sum_data2 valid_sum_data3
+ valid_sum_data4 valid_sum_data5 valid_sum_data6 valid_sum_data7
+ valid
+ mux21_8bit_transgate

X_adder
+ gnd! co
+ valid_sum_data0 valid_sum_data1 valid_sum_data2 valid_sum_data3
+ valid_sum_data4 valid_sum_data5 valid_sum_data6 valid_sum_data7
+ valid_sum_data7 valid_sum_data7 valid_sum_data7 valid_sum_data7
+ sum0 sum1 sum2 sum3 sum4 sum5
+ sum6 sum7 sum8 sum9 sum10 sum11
+ new_psum0 new_psum1 new_psum2 new_psum3 new_psum4 new_psum5
+ new_psum6 new_psum7 new_psum8 new_psum9 new_psum10 new_psum11
+ rc_adder12

X_sum_reg_clear
+ gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd! gnd!
+ new_psum0 new_psum1 new_psum2 new_psum3 new_psum4 new_psum5
+ new_psum6 new_psum7 new_psum8 new_psum9 new_psum10 new_psum11
+ valid_new_psum0 valid_new_psum1 valid_new_psum2 valid_new_psum3 valid_new_psum4 valid_new_psum5
+ valid_new_psum6 valid_new_psum7 valid_new_psum8 valid_new_psum9 valid_new_psum10 valid_new_psum11
+ start
+ mux21_12bit_transgate

X_sum_reg
+ valid_new_psum0 valid_new_psum1 valid_new_psum2 valid_new_psum3 valid_new_psum4 valid_new_psum5
+ valid_new_psum6 valid_new_psum7 valid_new_psum8 valid_new_psum9 valid_new_psum10 valid_new_psum11
+ sum0 sum1 sum2 sum3 sum4 sum5
+ sum6 sum7 sum8 sum9 sum10 sum11
+ clk resetb
+ dff12

X_valid_max_data
+ data0 data1 data2 data3 data4 data5 data6 data7 
+ gnd! gnd! gnd! gnd! gnd! gnd! gnd! vdd!
+ valid_max_data0 valid_max_data1 valid_max_data2 valid_max_data3
+ valid_max_data4 valid_max_data5 valid_max_data6 valid_max_data7
+ valid
+ mux21_8bit_transgate

X_max_comparator
+ valid_max_data0 valid_max_data1 valid_max_data2 valid_max_data3
+ valid_max_data4 valid_max_data5 valid_max_data6 valid_max_data7
+ max0 max1 max2 max3 max4 max5 max6 max7
+ new_pmax0 new_pmax1 new_pmax2 new_pmax3 new_pmax4 new_pmax5 new_pmax6 new_pmax7
+ comparator8

X_max_reg_clear
+ gnd! gnd! gnd! gnd! gnd! gnd! gnd! vdd! 
+ new_pmax0 new_pmax1 new_pmax2 new_pmax3 new_pmax4 new_pmax5 new_pmax6 new_pmax7
+ valid_new_pmax0 valid_new_pmax1 valid_new_pmax2 valid_new_pmax3 
+ valid_new_pmax4 valid_new_pmax5 valid_new_pmax6 valid_new_pmax7
+ start
+ mux21_8bit_transgate

X_max_reg
+ valid_new_pmax0 valid_new_pmax1 valid_new_pmax2 valid_new_pmax3 
+ valid_new_pmax4 valid_new_pmax5 valid_new_pmax6 valid_new_pmax7
+ max0 max1 max2 max3 max4 max5 max6 max7
+ clk resetb
+ dff8

.ends MandS_23F

** --------------------------------^_^-------------------------------- ** 
** inverter
.subckt inv in out Wmin=120n Lmin=40n f=1
X_Mp out in vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn out in gnd! gnd! n11ll_ckt W='Wmin*f' L=Lmin
.ends inv


** transfer gate 
.subckt transgate in out ctr_n ctr_p Wmin=120n Lmin=40n f=1
X_Mn out ctr_n in gnd! n11ll_ckt W='Wmin*f' L=Lmin
X_Mp out ctr_p in vdd! p11ll_ckt W='Wmin*f' L=Lmin
.ends transgate


** 1-bit D Flip-Flop
.subckt dff d q clk rstn Wmin=120n Lmin=40n f=1
X_inv1 clk clk_inv inv
X_transgate1 d net0 clk_inv clk transgate
X_nand2_1 net0 rstn net1 nand2
X_transgete2 net1 net2 clk clk_inv transgate
X_inv2 net2 q inv
X_inv3 net1 net3 inv
X_transgate3 net3 net0 clk clk_inv transgate
X_nand2_2 rstn q net4 nand2
X_transgate4 net4 net2 clk_inv clk transgate
.ends dff


** 2-input nand
.subckt nand2 in1 in2 out Wmin=120n Lmin=40n f=1
X_Mn1 net0 in1 gnd! gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn2 out  in2 net0 gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp1 out  in1 vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp2 out  in2 vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
.ends nand2

** 2-bit xor
.subckt xor2 in1 in2 out Wmin=120n Lmin=40n f=1
X_inv1 in1 in1_inv inv
X_inv2 in2 in2_inv inv
X_nand2_1 in1_inv in2  net0 nand2
X_nand2_2 in2_inv in1  net1 nand2
X_nand2_3 net0    net1 out  nand2
.ends xor2


** mux21 by tansfer gate (out = sel ? in1 : in2)
.subckt mux21_transgate in1 in2 sel out Wmin=120n Lmin=40n f=1
X_inv1 sel  sel_inv inv f=4
X_inv2 sel_inv sel_buf inv f=16
** X_inv2 net0 net1    inv
** X_inv3 net1 out     inv f=4
X_transgate1 in1 out sel_buf sel_inv transgate
X_transgate2 in2 out sel_inv sel_buf transgate
.ends mux21_transgate


** 8-bit mux21 in tansfer gate (out[7:0] = sel ? a[7:0] : b[7:0])
.subckt mux21_8bit_transgate 
+ a0 a1 a2 a3 a4 a5 a6 a7
+ b0 b1 b2 b3 b4 b5 b6 b7
+ out0 out1 out2 out3 out4 out5 out6 out7
+ sel
+ Wmin=120n Lmin=40n f=1
X_mux21_transgate0 a0 b0 sel out0 mux21_transgate
X_mux21_transgate1 a1 b1 sel out1 mux21_transgate
X_mux21_transgate2 a2 b2 sel out2 mux21_transgate
X_mux21_transgate3 a3 b3 sel out3 mux21_transgate
X_mux21_transgate4 a4 b4 sel out4 mux21_transgate
X_mux21_transgate5 a5 b5 sel out5 mux21_transgate
X_mux21_transgate6 a6 b6 sel out6 mux21_transgate
X_mux21_transgate7 a7 b7 sel out7 mux21_transgate
.ends mux21_8bit_transgate


** 12-bit mux21 in tansfer gate (out[11:0] = sel ? a[11:0] : b[11:0])
.subckt mux21_12bit_transgate 
+ a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11
+ b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11
+ out0 out1 out2 out3 out4 out5 out6 out7 out8 out9 out10 out11
+ sel
+ Wmin=120n Lmin=40n f=1
X_mux21_transgate0 a0 b0 sel out0 mux21_transgate
X_mux21_transgate1 a1 b1 sel out1 mux21_transgate
X_mux21_transgate2 a2 b2 sel out2 mux21_transgate
X_mux21_transgate3 a3 b3 sel out3 mux21_transgate
X_mux21_transgate4 a4 b4 sel out4 mux21_transgate
X_mux21_transgate5 a5 b5 sel out5 mux21_transgate
X_mux21_transgate6 a6 b6 sel out6 mux21_transgate
X_mux21_transgate7 a7 b7 sel out7 mux21_transgate
X_mux21_transgate8 a8 b8 sel out8 mux21_transgate
X_mux21_transgate9 a9 b9 sel out9 mux21_transgate
X_mux21_transgate10 a10 b10 sel out10 mux21_transgate
X_mux21_transgate11 a11 b11 sel out11 mux21_transgate
.ends mux21_12bit_transgate


** 8-bit dff
.subckt dff8
+ d0 d1 d2 d3 d4 d5 d6 d7
+ q0 q1 q2 q3 q4 q5 q6 q7
+ clk rstn 
+ Wmin=120n Lmin=40n f=1
X_dff8_0 d0 q0 clk rstn dff
X_dff8_1 d1 q1 clk rstn dff
X_dff8_2 d2 q2 clk rstn dff
X_dff8_3 d3 q3 clk rstn dff
X_dff8_4 d4 q4 clk rstn dff
X_dff8_5 d5 q5 clk rstn dff
X_dff8_6 d6 q6 clk rstn dff
X_dff8_7 d7 q7 clk rstn dff
.ends dff8

** 12-bit dff
.subckt dff12
+ d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11
+ q0 q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11
+ clk rstn 
+ Wmin=120n Lmin=40n f=1
X_dff12_0 d0 q0 clk rstn dff
X_dff12_1 d1 q1 clk rstn dff
X_dff12_2 d2 q2 clk rstn dff
X_dff12_3 d3 q3 clk rstn dff
X_dff12_4 d4 q4 clk rstn dff
X_dff12_5 d5 q5 clk rstn dff
X_dff12_6 d6 q6 clk rstn dff
X_dff12_7 d7 q7 clk rstn dff
X_dff12_8 d8 q8 clk rstn dff
X_dff12_9 d9 q9 clk rstn dff
X_dff12_10 d10 q10 clk rstn dff
X_dff12_11 d11 q11 clk rstn dff
.ends dff12

** 1-bit full adder
.subckt full_adder a b ci s co Wmin=120n Lmin=40n f=1
X_xor2_1 a    b  net0 xor2
X_xor2_2 net0 ci s    xor2
X_nand2_1 a    b    net1 nand2
X_nand2_2 net0 ci   net2 nand2
X_nand2_3 net1 net2 co   nand2
.ends full_adder

** 12-bit ripple carry full adder
.subckt rc_adder12
+ ci co
+ a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11
+ b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11
+ sum0 sum1 sum2 sum3 sum4 sum5 sum6 sum7 sum8 sum9 sum10 sum11
+ Wmin=120n Lmin=40n f=1
X_full_adder0 a0 b0 ci sum0 c0 full_adder
X_full_adder1 a1 b1 c0 sum1 c1 full_adder
X_full_adder2 a2 b2 c1 sum2 c2 full_adder
X_full_adder3 a3 b3 c2 sum3 c3 full_adder
X_full_adder4 a4 b4 c3 sum4 c4 full_adder
X_full_adder5 a5 b5 c4 sum5 c5 full_adder
X_full_adder6 a6 b6 c5 sum6 c6 full_adder
X_full_adder7 a7 b7 c6 sum7 c7 full_adder
X_full_adder8 a8 b8 c7 sum8 c8 full_adder
X_full_adder9 a9 b9 c8 sum9 c9 full_adder
X_full_adder10 a10 b10 c9 sum10 c10 full_adder
X_full_adder11 a11 b11 c10 sum11 co full_adder
.ends rc_adder12

** 8-bit ripple carry full adder
.subckt rc_adder8
+ ci co
+ a0 a1 a2 a3 a4 a5 a6 a7 
+ b0 b1 b2 b3 b4 b5 b6 b7 
+ sum0 sum1 sum2 sum3 sum4 sum5 sum6 sum7
+ Wmin=120n Lmin=40n f=1
X_full_adder0 a0 b0 ci sum0 c0 full_adder
X_full_adder1 a1 b1 c0 sum1 c1 full_adder
X_full_adder2 a2 b2 c1 sum2 c2 full_adder
X_full_adder3 a3 b3 c2 sum3 c3 full_adder
X_full_adder4 a4 b4 c3 sum4 c4 full_adder
X_full_adder5 a5 b5 c4 sum5 c5 full_adder
X_full_adder6 a6 b6 c5 sum6 c6 full_adder
X_full_adder7 a7 b7 c6 sum7 co full_adder
.ends rc_adder8

** buffer
.subckt buffer in out  Wmin=120n Lmin=40n f=1
X_inv1 in nin inv
X_inv2 nin out inv f=4
.ends buffer


** 8-bit comparator (signed)
.subckt comparator8
+ a0 a1 a2 a3 a4 a5 a6 a7
+ b0 b1 b2 b3 b4 b5 b6 b7
+ out0 out1 out2 out3 out4 out5 out6 out7
+ Wmin=120n Lmin=40n f=1
X_inv0 b0 b0_inv inv
X_inv1 b1 b1_inv inv
X_inv2 b2 b2_inv inv
X_inv3 b3 b3_inv inv
X_inv4 b4 b4_inv inv
X_inv5 b5 b5_inv inv
X_inv6 b6 b6_inv inv
X_inv7 b7 b7_inv inv
X_adder
+ vdd! co
+ a0 a1 a2 a3 a4 a5 a6 a7
+ b0_inv b1_inv b2_inv b3_inv b4_inv b5_inv b6_inv b7_inv
+ sub0 sub1 sub2 sub3 sub4 sub5 sub6 sub7 
+ rc_adder8
X_mux21_8_1
+ b0 b1 b2 b3 b4 b5 b6 b7
+ a0 a1 a2 a3 a4 a5 a6 a7
+ out1_0 out1_1 out1_2 out1_3 out1_4 out1_5 out1_6 out1_7
+ a7
+ mux21_8bit_transgate
X_mux21_8_2
+ b0 b1 b2 b3 b4 b5 b6 b7
+ a0 a1 a2 a3 a4 a5 a6 a7
+ out2_0 out2_1 out2_2 out2_3 out2_4 out2_5 out2_6 out2_7
+ sub7
+ mux21_8bit_transgate
X_xor2 a7 b7 ctrl xor2
X_mux21_8_3
+ out1_0 out1_1 out1_2 out1_3 out1_4 out1_5 out1_6 out1_7
+ out2_0 out2_1 out2_2 out2_3 out2_4 out2_5 out2_6 out2_7
+ out0 out1 out2 out3 out4 out5 out6 out7
+ ctrl
+ mux21_8bit_transgate
.ends comparator8