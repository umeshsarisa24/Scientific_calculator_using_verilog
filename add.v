`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:14:47
// Design Name: 
// Module Name: add
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


module add(
    input [9:0] a, // First 8-bit decimal number
    input [9:0] b, // Second 8-bit decimal number
    output [11:0] sum // 9-bit result to accommodate overflow
);

assign sum = a + b;
endmodule
