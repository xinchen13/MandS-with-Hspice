** module name: 12-bit ripple carry adder
** create date: 2024/01/17
** designed by: xinchen

.include full_adder.sp

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