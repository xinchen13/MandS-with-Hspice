** module name: 2-bit xor
** create date: 2024/01/16
** designed by: xinchen

.include nand2.sp
.include inv.sp

.subckt xor2 in1 in2 out Wmin=120n Lmin=40n f=1
X_inv1 in1 in1_inv inv
X_inv2 in2 in2_inv inv
X_nand2_1 in1_inv in2  net0 nand2
X_nand2_2 in2_inv in1  net1 nand2
X_nand2_3 net0    net1 out  nand2
.ends xor2