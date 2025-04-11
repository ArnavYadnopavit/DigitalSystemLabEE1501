`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    // Instantiate your counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period

    initial begin
        // VCD for waveform viewing (optional)
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        // Initial values
        clk = 0;
        reset = 0;
        enable = 0;

        // Display count
        $monitor("Time=%0t | Reset=%b Enable=%b Count=%b", $time, reset, enable, count);

        // Apply reset
        #2 reset = 1;
        #10 reset = 0;

        // Enable counting
        enable = 1;

        // Let it run for a few clock cycles
        #100;

        // Disable counting
        enable = 0;
        #20;

        // Enable again
        enable = 1;
        #40;

        // Finish simulation
        $finish;
    end

endmodule

