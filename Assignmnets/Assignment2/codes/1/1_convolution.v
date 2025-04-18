module convolution(input  [31:0] x_in,input  [31:0] h_in,output reg [63:0] y_out);
    integer i,j;
    reg [3:0] x [7:0];
    reg [3:0] h [7:0];
    reg [7:0] temp_y [15:0];
    always @(*) begin
        for (i=0;i<8;i=i+1) begin
            x[i]=x_in[i*4 +: 4];
            h[i]=h_in[i*4 +: 4];
        end
        for (i=0;i<16;i++)
            temp_y[i]=0;
        for (i=0;i<16;i=i+1) begin
            for (j=0;j<8;j=j+1) begin
                if (i>=j&&(i-j)<8) begin
                    temp_y[i]=temp_y[i]+x[i-j]*h[j];
                end
            end
        end
        for (i=0;i<16;i=i+1)
            y_out[i*4 +: 4]=temp_y[i][3:0];
    end
endmodule

