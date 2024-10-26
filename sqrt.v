`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 08:39:44
// Design Name: 
// Module Name: sqrt
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


module sqrt(
    input [9:0] num,
    output reg [11:0] root
);
    reg [11:0] x;
    reg [11:0] x_next;
    integer i;

    always @(*) begin
        x = num;
        for (i = 0; i < 10; i = i + 1) begin
            x_next = (x + num / x) >> 1;
            x = x_next;
        end
        root = x[11:0];
    end
endmodule

