`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 10:12:34
// Design Name: 
// Module Name: top_module
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


module top_module(input [9:0] num, input [9:0] a, b, n, r, input [9:0] num_sqrt, input [3:0] op_code,
                  output [6:0] seg1, seg2, seg3, seg4);
    // Internal wires
    wire [11:0] factorial_result, nCr_result, nPr_result;
    wire [11:0] add_sum, sub_diff;
    wire [11:0] quotient, remainder, log2_result, sqrt_result;
    wire [11:0] product, power_result;
    wire [11:0] res;
    wire [15:0] bcd;

    // Instantiate the arithmetic modules
    factorial factorial_inst (.num(num), .result(factorial_result));
    add add_inst (.a(a), .b(b), .sum(add_sum));
    sub sub_inst (.a(a), .b(b), .diff(sub_diff));
    combination combination_inst (.n(n), .r(r), .nCr(nCr_result));
    divide divide_inst (.a(a), .b(b), .quotient(quotient), .remainder(remainder));
    log2_n log2_inst (.num(a), .log2(log2_result));
    multiply multiply_inst (.a(a), .b(b), .product(product));
    permutation permutation_inst (.n(n), .r(r), .nPr(nPr_result));
    power power_inst (.a(a), .b(b), .result(power_result));
    sqrt sqrt_inst (.num(num_sqrt), .root(sqrt_result));

    // Output register
    reg [11:0] result;
    always @(*) begin
        case (op_code)
            4'b0000: result = factorial_result; // Factorial
            4'b0001: result = add_sum; // Addition
            4'b0010: result = sub_diff; // Subtraction
            4'b0011: result = nCr_result; // Combination
            4'b0100: result = quotient; // Division Quotient
            4'b0101: result = remainder; // Division Remainder
            4'b0110: result = log2_result; // Log2
            4'b0111: result = product; // Multiplication
            4'b1000: result = nPr_result; // Permutation
            4'b1001: result = power_result; // Power
            4'b1010: result = sqrt_result; // Square Root
            default: result = 12'b0; // Default case
        endcase
    end
    assign res = result;

    // Convert result to BCD
    result_to_bcd bcd_inst (.res(res), .bcd(bcd));

    // Drive 7-segment displays
    seven ssd1 (.bcd(bcd[15:12]), .seg(seg1));
    seven ssd2 (.bcd(bcd[11:8]), .seg(seg2));
    seven ssd3 (.bcd(bcd[7:4]), .seg(seg3));
    seven ssd4 (.bcd(bcd[3:0]), .seg(seg4));

endmodule

module result_to_bcd(input [11:0] res, output reg [15:0] bcd);
    integer i;

    always @(res) begin
        bcd = 16'b0; // Initialize BCD to zero
        for (i = 11; i >= 0; i = i - 1) begin
            // Shift left by 1
            bcd = {bcd[14:0], res[i]};
            // Add 3 to columns if they are 5 or greater
           if(i!=0)
                if (bcd[3:0] >= 5)
                  bcd[3:0] = bcd[3:0] + 2'b11;
           if(i!=0)
                if (bcd[7:4] >= 5)
                  bcd[7:4] = bcd[7:4] + 2'b11;
           if(i!=0)
                if (bcd[11:8] >= 5)
                  bcd[11:8] = bcd[11:8] + 2'b11;
           if(i!=0)
                if (bcd[15:12] >= 5) 
                  bcd[15:12] = bcd[15:12] + 2'b11;
        end
    end
endmodule

module seven(input [3:0] bcd, output reg [6:0] seg);
    always @(bcd) begin
        case (bcd)
            4'b0000: seg = 7'b1111110;
            4'b0001: seg = 7'b0110000;
            4'b0010: seg = 7'b1101101;
            4'b0011: seg = 7'b1111001;
            4'b0100: seg = 7'b0110011;
            4'b0101: seg = 7'b1011011;
            4'b0110: seg = 7'b1011111;
            4'b0111: seg = 7'b1110000;
            4'b1000: seg = 7'b1111111;
            4'b1001: seg = 7'b1111011;
            default: seg = 7'b0000000;
        endcase
    end
endmodule
