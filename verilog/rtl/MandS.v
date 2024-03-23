module MandS(
    input wire clk,
    input wire resetb,
    input wire start,
    input wire valid,
    input wire [7:0] data,  // signed, 2'complement
    output wire [7:0] Max,
    output wire [11:0] Sum
);
    // internal signal
    wire [7:0] valid_new_pmax; 
    wire [11:0] valid_new_psum;
    wire [7:0] valid_max_data; 
    wire [7:0] valid_sum_data; 
    wire [7:0] pmax;
    wire [7:0] new_pmax;
    wire [11:0] psum;
    wire [11:0] new_psum;

    // output
    assign Max = pmax;
    assign Sum = psum;

    assign valid_max_data = valid ? data : 8'b10000000;
    assign valid_sum_data = valid ? data : 8'b0;

    assign valid_new_pmax = start ? 8'b10000000 : new_pmax;
    assign valid_new_psum = start ? 12'b0 : new_psum;

    // comparator
    comparator u_comparator(
        .a(valid_max_data),
        .b(pmax),
        .out(new_pmax)
    );

    // Max (output) register
    asyn_dff #(8) u_max_reg(
        .clk(clk),
        .rst_n(resetb),
        .data_in(valid_new_pmax),
        .data_out(pmax)
    );

    // adder
    adder u_adder(
        .data(valid_sum_data),
        .psum(psum),
        .new_psum(new_psum)
    );

    // Sum (output) register
    asyn_dff #(12) u_sum_reg(
        .clk(clk),
        .rst_n(resetb),
        .data_in(valid_new_psum),
        .data_out(psum)
    );
endmodule
