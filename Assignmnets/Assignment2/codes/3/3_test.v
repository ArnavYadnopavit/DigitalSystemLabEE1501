`timescale 1ns/1ps

module test_RippleAdder;

reg [3:0]a,b;
wire [3:0] sum;
wire cout;

RippleAdder tisra(.a(a),.b(b),.sum(sum),.cout(cout));

initial begin
        $dumpfile("8bitadder.vcd");
        $dumpvars(0,tisra);
	
        $display("Time\ta\tb\tsum\tcout");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, a,b, sum,cout);
        a=4'b0000;b=4'b0000;#20;
	a=4'b1111;b=4'b1111;#20;
	a=4'b1010;b=4'b1111;#20;
	a=4'b1011;b=4'b1110;#20;
	a=4'b0101;b=4'b1101;#20;

	$finish;
end
endmodule
