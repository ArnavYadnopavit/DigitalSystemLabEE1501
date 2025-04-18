`timescale 1ns/1ps

module even_parity_tb;

    reg [7:0] data;
    wire parity;

    // Instantiate the DUT (Device Under Test)
    EvenParity uut (
        .data(data),
        .parity(parity)
    );

    initial begin
        $dumpfile("even_parity.vcd");
        $dumpvars(0, even_parity_tb);

        $display("Time\tData\t\tParity");
        $monitor("%0t\t%b\t%b", $time, data, parity);

        // Test cases
        data = 8'b00000000; #10; // 0 ones → parity = 0
        data = 8'b00000001; #10; // 1 one  → parity = 1
        data = 8'b00001111; #10; // 4 ones → parity = 0
        data = 8'b10101010; #10; // 4 ones → parity = 0
        data = 8'b11111111; #10; // 8 ones → parity = 0
        data = 8'b11111110; #10; // 7 ones → parity = 1
        data = 8'b10000000; #10; // 1 one  → parity = 1
        data = 8'b11000000; #10; // 2 ones → parity = 0

        $finish;
    end

endmodule

