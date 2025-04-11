module counter(
        input clk,input reset,input enable,output reg  [3:0]count
);

always @(posedge clk) begin
        if (reset)
                count<=4'b0000;
        if (enable)
                casez(count)
                        4'bzzz0:begin count[0]<=1;end
                        4'bzz01:begin count[1:0]<=2'b10;end
                        4'bz011:begin count[2:0]<=3'b100;end
                        4'b0111:begin count[3:0]<=4'b1000;end
                        4'b1111:begin count[3:0]<=4'b0000;end
                endcase
end
endmodule
