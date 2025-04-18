`timescale 1ns/1ps

module test_conv;
reg [31:0] x_in,h_in;
wire [63:0] y_out;

convolution uut(.x_in(x_in),.h_in(h_in),.y_out(y_out));
initial begin
        $dumpfile("conv.vcd");
        $dumpvars(0,test_conv);

        $display("Time\tx_in\th_in\ty_out");
        $monitor("%0dns\t%b\t%b\t%b", $time, x_in,h_in, y_out);

	x_in = 32'h00000000;h_in = 32'h00000000;#10;
	x_in = 32'hFFFFFFFF;h_in = 32'hFFFFFFFF;#10;
        x_in = 32'h12345678;h_in = 32'h87654321; #10;
	x_in = 32'h10000000;h_in = 32'h12345678; #10;
	x_in = 32'h12345678;h_in = 32'h10000000; #10;  
        $finish;
    end

endmodule


