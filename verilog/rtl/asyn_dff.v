module asyn_dff # (
    parameter WIDTH = 8 ) 
(
    input wire clk,
    input wire rst_n,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);
    // DFF with asynchronous rst_n, 
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= 0;
        end
        else begin
            data_out <= data_in;
        end
     end
endmodule

