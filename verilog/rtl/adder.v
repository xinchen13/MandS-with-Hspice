module adder(
    input wire [7:0] data,
    input wire [11:0] psum,
    output wire [11:0] new_psum
);
    wire [11:0] data_sign_extended;
    assign data_sign_extended = {{4{data[7]}}, data};
    // new_psum = psum + sign_extended(data)
    assign new_psum = data_sign_extended + psum; 
endmodule

