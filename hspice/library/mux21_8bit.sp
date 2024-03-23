** module name: 8-bit mux21
** create date: 2024/01/17
** designed by: xinchen

.include mux21.sp

.subckt mux21_8bit
+ a0 a1 a2 a3 a4 a5 a6 a7
+ b0 b1 b2 b3 b4 b5 b6 b7
+ out0 out1 out2 out3 out4 out5 out6 out7
+ sel
+ Wmin=120n Lmin=40n f=1

X_mux21_0 a0 b0 sel out0 mux21
X_mux21_1 a1 b1 sel out1 mux21
X_mux21_2 a2 b2 sel out2 mux21
X_mux21_3 a3 b3 sel out3 mux21
X_mux21_4 a4 b4 sel out4 mux21
X_mux21_5 a5 b5 sel out5 mux21
X_mux21_6 a6 b6 sel out6 mux21
X_mux21_7 a7 b7 sel out7 mux21

.ends mux21_8bit