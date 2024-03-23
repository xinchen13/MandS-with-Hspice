** module name: 12-bit dff
** create date: 2024/01/17
** designed by: xinchen

.include dff.sp

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