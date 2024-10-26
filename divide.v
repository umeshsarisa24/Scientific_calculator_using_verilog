`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:26:43
// Design Name: 
// Module Name: divide
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


module divide(
    input [9:0] a, // Dividend
    input [9:0] b, // Divisor
    output [11:0] quotient, // Quotient of the division
    output [11:0] remainder // Remainder of the division
);
assign quotient = a / b;
assign remainder = a % b;
endmodule
