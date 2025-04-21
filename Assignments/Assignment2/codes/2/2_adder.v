module EightBitAdder(input [7:0] a,input [7:0] b,input cin,output [7:0]sum, output cout);
genvar i;
wire [8:0] c;
assign c[0]=cin;
generate
	for(i=0;i<8;i=i+1)begin 
		bitadder adders(.a(a[i]),.b(b[i]),.sum(sum[i]),.cin(c[i]),.cout(c[i+1]));
	end
endgenerate
assign cout=c[8];
endmodule

module bitadder(input a,input b,input cin, output sum,output cout);
assign sum=a^b^cin;
assign cout=a&b|b&cin|cin&a;
endmodule

