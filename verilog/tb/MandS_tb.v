`timescale 1ns / 1ps

module MandS_tb();
    reg clk;
    reg resetb;
    reg start;
    reg valid;
    reg [7:0] data;
    wire [7:0] Max;
    wire [11:0] Sum;

    // generate clk
    always #10 clk = ~clk;

    initial begin
        clk = 1'b1;
        resetb = 1'b0;
        start = 1'b0;
        valid = 1'b0;
        data = 8'b0;
        $display("test running...");
        #40 resetb = 1'b1;
        #20 start = 1'b1;
        #20 start = 1'b0;
            valid = 1'b1;
            data = -5;
        #20 data = -2;
        #20 data = 8'd3;
        #20 data = 8'd1;
        #20 data = 8'd7;
        #20 data = 8'd0;
        #20 data = 8'd1;
        #20 data = -5;
        #20 data = 8'd3;
        #20 valid = 1'b0;
        #60 start = 1'b1;
        #20 start = 1'b0;
            valid = 1'b1;
            data = -1;
        #20 data = 8'd5;
        #20 data = 8'd233;
        #20 valid = 1'b0;
        #50 resetb = 1'b0;
        #40 $finish;
    end


    initial begin
        $dumpfile("sim/dumpfile/wave.vcd");
		$dumpvars(0,MandS_tb);
	end

    MandS u_MandS(
        .clk(clk),
        .resetb(resetb),
        .start(start),
        .valid(valid),
        .data(data),
        .Max(Max),
        .Sum(Sum)
    );
endmodule
