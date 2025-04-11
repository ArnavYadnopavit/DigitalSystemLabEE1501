`timescale 1ns/1ps

module encoder_tb;

    reg [3:0] in;
    wire [1:0] out;
    wire valid;

    // Instantiate the encoder module
    encoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        $dumpfile("encoder.vcd");
        $dumpvars(0, encoder_tb);

        $display("Time\tin\tout\tvalid");
        $monitor("%0t\t%b\t%b\t%b", $time, in, out, valid);

        // Test all combinations from 4'b0000 to 4'b1111
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b0101; #10;
        in = 4'b0110; #10;
        in = 4'b0111; #10;
        in = 4'b1000; #10;
        in = 4'b1001; #10;
        in = 4'b1010; #10;
        in = 4'b1011; #10;
        in = 4'b1100; #10;
        in = 4'b1101; #10;
        in = 4'b1110; #10;
        in = 4'b1111; #10;

        $finish;
    end

endmodule

