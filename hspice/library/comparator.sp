** module name: 1-bit comparator (great = a > b ? 1 : 0)
** create date: 2024/01/19
** designed by: xinchen

.include nor2.sp
.include inv.sp

.subckt comparator a b great Wmin=120n Lmin=40n f=1
X_inv a a_inv inv
X_nor2 a_inv b great nor2
.ends comparator