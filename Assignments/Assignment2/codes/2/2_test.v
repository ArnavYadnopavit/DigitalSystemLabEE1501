`timescale 1ns/1ps

module test_8bitadder;

reg [7:0]a,b;
reg cin;
wire [7:0] sum;
wire cout;

EightBitAdder dusra(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
        $dumpfile("8bitadder.vcd");
        $dumpvars(0,test_8bitadder);
	
        $display("Time\ta\tb\tcin\tsum\tcout");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, a,b,cin,sum,cout);
        a=8'b00000000;b=8'b00000000;cin=1'b1;#10;
	a=8'b11111111;b=8'b11111111;cin=1'b0;#10;
	a=8'b10101010;b=8'b11111111;cin=1'b1;#10;
	a=8'b10111011;b=8'b10101110;cin=1'b0;#10;
	a=8'b11010101;b=8'b10011101;cin=1'b1;#10;

	$finish;
end
endmodule
