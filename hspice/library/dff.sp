** module name: 1-bit D Flip-Flop
** create date: 2024/01/16
** designed by: xinchen

.include inv.sp
.include transgate.sp
.include nand2.sp

.subckt dff d q clk rstn Wmin=120n Lmin=40n f=1
X_inv1 clk clk_inv inv
X_transgate1 d net0 clk_inv clk transgate
X_nand2_1 net0 rstn net1 nand2
X_transgete2 net1 net2 clk clk_inv transgate
X_inv2 net2 q inv
X_inv3 net1 net3 inv
X_transgate3 net3 net0 clk clk_inv transgate
X_nand2_2 rstn q net4 nand2
X_transgate4 net4 net2 clk_inv clk transgate
.ends dff