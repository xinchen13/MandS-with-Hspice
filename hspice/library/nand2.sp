** module name: 2-input nand 
** create date: 2024/01/16
** designed by: xinchen

.subckt nand2 in1 in2 out Wmin=120n Lmin=40n f=1
X_Mn1 net0 in1 gnd! gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn2 out  in2 net0 gnd! n11ll_ckt W='Wmin*2*f' L=Lmin

X_Mp1 out  in1 vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp2 out  in2 vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
.ends nand2