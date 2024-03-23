** module name: 2-input nor
** create date: 2024/01/16
** designed by: xinchen

.subckt nor2 in1 in2 out Wmin=120n Lmin=40n f=1
X_Mn1 out  in1 gnd! gnd! n11ll_ckt W='Wmin*1*f' L=Lmin
X_Mn2 out  in2 gnd! gnd! n11ll_ckt W='Wmin*1*f' L=Lmin

X_Mp1 out in1 net0 vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mp2 net0 in2 vdd! vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
.ends nor2