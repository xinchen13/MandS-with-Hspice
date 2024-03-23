** module name: transfer gate
** create date: 2024/01/16
** designed by: xinchen

.subckt transgate in out ctr_n ctr_p Wmin=120n Lmin=40n f=1
X_Mn out ctr_n in gnd! n11ll_ckt W='Wmin*f' L=Lmin
X_Mp out ctr_p in vdd! p11ll_ckt W='Wmin*f' L=Lmin
.ends transgate