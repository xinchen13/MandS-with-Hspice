module comparator(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] out
);
    // wire [7:0] sub;
    // assign sub = a + ~b + 1'b1;
    // // out = (a > b) ? a : b
    // assign out = (a[7] != b[7]) ? (a[7] ? b : a) : (sub[7] ? b : a); 
    wire ctrl;
    assign out = ctrl ? a : b;

    assign ctrl = (a[7] != b[7]) ? b[7] : ((a[6:0] > b[6:0]) ? 1'b1 : 1'b0);
endmodule

