`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:21:16
// Design Name: 
// Module Name: sub
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


module sub(
    input [9:0] a, // First 8-bit decimal number
    input [9:0] b, // Second 8-bit decimal number
    output [11:0] diff // 9-bit result for subtraction to accommodate underflow
);

assign diff = a - b;

endmodule