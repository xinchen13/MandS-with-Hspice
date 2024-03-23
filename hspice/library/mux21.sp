** module name: mux21
** create date: 2024/01/16
** designed by: xinchen

.include nand2.sp
.include inv.sp

.subckt mux21 in1 in2 sel out Wmin=120n Lmin=40n f=1
X_inv sel sel_inv inv
X_nand2_1  in1  sel_inv net0 nand2
X_nand2_2  in2  sel     net1 nand2
X_nand2_3  net0 net1    out  nand2
.ends mux21

