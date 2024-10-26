`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 18:39:41
// Design Name: 
// Module Name: combination
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


module combination(
    input [7:0] n, // Total number of items
    input [7:0] r, // Number of items to choose
    output reg [11:0] nCr // Result of nCr
);

integer i;
reg [11:0] numerator;
reg [11:0] denominator_r;
reg [11:0] denominator_nr;

always @(*) begin
    // Initialize numerator and denominators
    numerator = 1;
    denominator_r = 1;
    denominator_nr = 1;

    // Calculate n!
    for (i = 1; i <= n; i = i + 1)
     begin
        numerator = numerator * i;
    end

    // Calculate r!
    for (i = 1; i <= r; i = i + 1) 
    begin
        denominator_r = denominator_r * i;
    end

    // Calculate (n-r)!
    for (i = 1; i <= (n - r); i = i + 1)
     begin
        denominator_nr = denominator_nr * i;
    end

    // Calculate nCr = n! / (r! * (n-r)!)
    nCr = numerator / (denominator_r * denominator_nr);
end

endmodule