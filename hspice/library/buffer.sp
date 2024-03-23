** module name: buffer
** create date: 2024/01/17
** designed by: xinchen

.include inv.sp

.subckt buffer in out  Wmin=120n Lmin=40n f=1
X_inv1 in nin inv
X_inv2 nin out inv f=4
.ends buffer