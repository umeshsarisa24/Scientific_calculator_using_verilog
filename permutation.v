`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:36:20
// Design Name: 
// Module Name: permutation
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


module permutation(
    input [7:0] n, // Total number of items
    input [7:0] r, // Number of items to choose
    output reg [11:0] nPr // Result of nPr
);

integer i;
reg [11:0] numerator;
reg [11:0] denominator;

always @(*) begin
    // Initialize numerator and denominator
    numerator = 1;
    denominator = 1;

    // Calculate n!
    for (i = 1; i <= n; i = i + 1)
     begin
        numerator = numerator * i;
    end

    // Calculate (n-r)!
    for (i = 1; i <= (n - r); i = i + 1)
     begin
        denominator = denominator * i;
    end

    // Calculate nPr = n! / (n-r)!
    nPr = numerator / denominator;
end

endmodule
