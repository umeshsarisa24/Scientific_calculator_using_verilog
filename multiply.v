`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:24:08
// Design Name: 
// Module Name: multiply
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


module multiply (
    input [9:0] a, // First 8-bit decimal number
    input [9:0] b, // Second 8-bit decimal number
    output [11:0] product // 16-bit result to accommodate the product
);

assign product = a * b;

endmodule
