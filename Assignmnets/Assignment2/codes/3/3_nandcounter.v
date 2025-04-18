`timescale 1ns/1ps
module RippleAdder(input [3:0]a,input [3:0]b,output [3:0] sum,output cout);
genvar i;
wire [4:0] c;
assign c[0]=0;
generate
	for(i=0;i<4;i=i+1)begin 
		bitadder adders(.a(a[i]),.b(b[i]),.sum(sum[i]),.cin(c[i]),.cout(c[i+1]));
	end
endgenerate
assign cout=c[4];
endmodule
module bitadder(input a,input b,input cin,output cout, output sum);
wire ws1;
xorgate w1(ws1,a,b);
xorgate w2(sum,cin,ws1);
wire wc1,wc2,wc3,wc4;
andgate ww1(wc1,a,b);
andgate ww2(wc2,b,cin);
andgate w3(wc3,cin,a);
orgate w4(wc4,wc1,wc2);
orgate w5(cout,wc4,wc3);

endmodule
module xorgate(output o,input a, input b);
wire w1,w2,w3;
nandgate ww1(w1,a,b);
nandgate ww2(w2,a,w1);
nandgate ww3(w3,b,w1);
nandgate ww4(o,w2,w3);
endmodule
module andgate(output o,input a,input b);
wire w1,w2;
nandgate ww1(w1,a,b);
nandgate ww2(w2,a,b);
nandgate ww3(o,w1,w2);
endmodule
module orgate(output o,input a,input b);
wire w1,w2;
nandgate ww1(w1,a,a);
nandgate ww2(w2,b,b);
nandgate ww3(o,w1,w2);
endmodule
module nandgate(output o,input a,input b);
assign #1 o=~(a&b); 
endmodule

