`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 09:45:09
// Design Name: 
// Module Name: factorial
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


module factorial(
    input [9:0] num,
    output reg [11:0] result
);
    integer i;
    always @(*) begin
        result = 1;
        for (i = 1; i <= num; i = i + 1) begin
            result = result * i;
        end
    end
endmodule

