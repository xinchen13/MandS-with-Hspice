** module name: 12-bit mux21 in tansfer gate
** create date: 2024/01/17
** designed by: xinchen

.include mux21_transgate.sp

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