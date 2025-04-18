`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        clk = 0;
        reset = 0;
        enable = 0;

        $monitor("Time=%0t | Reset=%b Enable=%b Count=%b", $time, reset, enable, count);

        #2 reset = 1;
        #10 reset = 0;

        enable = 1;
        #100;

        enable = 0;
        #20;

        enable = 1;
        #40;

        $finish;
    end

endmodule

