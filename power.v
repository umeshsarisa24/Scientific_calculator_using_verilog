`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:49:29
// Design Name: 
// Module Name: power
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


module power(
    input [9:0] a, // Base
    input [9:0] b, // Exponent
    output reg [11:0] result // Result of a^b
);
integer i;
    always @(*) begin
        result = 1;
        for (i = 0; i < b; i = i + 1) begin
            result = result * a;
        end
    end
endmodule