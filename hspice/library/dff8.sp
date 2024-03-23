** module name: 8-bit dff
** create date: 2024/01/17
** designed by: xinchen

.include dff.sp

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