** module name: 8-bit comparator (signed)
** create date: 2024/01/19
** designed by: xinchen

.include inv.sp
.include rc_adder8.sp
.include xor2.sp

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