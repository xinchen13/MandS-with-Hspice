** module name: 1-bit full adder
** create date: 2024/01/16
** designed by: xinchen

.include xor2.sp

.subckt full_adder a b ci s co Wmin=120n Lmin=40n f=1
X_xor2_1 a    b  net0 xor2
X_xor2_2 net0 ci s    xor2
X_nand2_1 a    b    net1 nand2
X_nand2_2 net0 ci   net2 nand2
X_nand2_3 net1 net2 co   nand2
.ends full_adder