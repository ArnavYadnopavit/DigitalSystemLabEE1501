module EvenParity(
    input [7:0] data,
    output parity
);
    assign parity = ~^data;
endmodule

