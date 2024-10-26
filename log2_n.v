`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 09:38:55
// Design Name: 
// Module Name: log2_n
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module log2_n(
    input [9:0] num,
    output reg [11:0] log2
);
    function integer clogb2;
        input [7:0] value;
        integer i;
        begin
            clogb2 = 0;
            for (i = 0; 2**i < value; i = i + 1)
                clogb2 = i + 1;
        end
    endfunction

    always @(*) begin
        log2 = clogb2(num);
    end
endmodule



