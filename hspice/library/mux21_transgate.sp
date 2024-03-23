** module name: mux21 in tansfer gate
** create date: 2024/01/16
** designed by: xinchen

.include transgate.sp
.include inv.sp

.subckt mux21_transgate in1 in2 sel out Wmin=120n Lmin=40n f=1
X_inv1 sel  sel_inv inv
X_inv2 net0 net1    inv
X_inv3 net1 out     inv f=4
X_transgate1 in1 net0 sel     sel_inv transgate
X_transgate2 in2 net0 sel_inv sel     transgate
.ends mux21_transgate

