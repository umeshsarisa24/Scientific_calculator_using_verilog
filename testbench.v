`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 17:35:08
// Design Name: 
// Module Name: tb
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



module tb;

    // Inputs
    reg [9:0] num;
    reg [9:0] a;
    reg [9:0] b;
    reg [9:0] n;
    reg [9:0] r;
    reg [9:0] num_sqrt;
    reg [3:0] op_code;

    // Outputs
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] seg3;
    wire [6:0] seg4;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .num(num),
        .a(a),
        .b(b),
        .n(n),
        .r(r),
        .num_sqrt(num_sqrt),
        .op_code(op_code),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3),
        .seg4(seg4)
    );

    initial begin
        // Initialize Inputs
        num = 0;
        a = 0;
        b = 0;
        n = 0;
        r = 0;
        num_sqrt = 0;
        op_code = 0;

        // Wait for global reset
        #10;

        // Test Case 1: Factorial
        num = 5;
        op_code = 4'b0000; // Factorial
        #10;
        $display("Factorial: %d! = %d", num, uut.res);

        // Test Case 2: Addition
        a = 10;
        b = 5;
        op_code = 4'b0001; // Addition
        #10;
        $display("Addition: %d + %d = %d", a, b, uut.res);

        // Test Case 3: Subtraction
        a = 15;
        b = 5;
        op_code = 4'b0010; // Subtraction
        #10;
        $display("Subtraction: %d - %d = %d", a, b, uut.res);

        // Test Case 4: Combination (nCr)
        n = 5;
        r = 2;
        op_code = 4'b0011; // Combination
        #10;
        $display("Combination: %dC%d = %d", n, r, uut.res);

        // Test Case 5: Division Quotient
        a = 20;
        b = 4;
        op_code = 4'b0100; // Division Quotient
        #10;
        $display("Division Quotient: %d / %d = %d", a, b, uut.res);

        // Test Case 6: Division Remainder
        a = 20;
        b = 3;
        op_code = 4'b0101; // Division Remainder
        #10;
        $display("Division Remainder: %d %% %d = %d", a, b, uut.res);

        // Test Case 7: Log2
        a = 16;
        op_code = 4'b0110; // Log2
        #10;
        $display("Log2: log2(%d) = %d", a, uut.res);

        // Test Case 8: Multiplication
        a = 3;
        b = 4;
        op_code = 4'b0111; // Multiplication
        #10;
        $display("Multiplication: %d * %d = %d", a, b, uut.res);

        // Test Case 9: Permutation (nPr)
        n = 5;
        r = 2;
        op_code = 4'b1000; // Permutation
        #10;
        $display("Permutation: %dP%d = %d", n, r, uut.res);

        // Test Case 10: Power
        a = 2;
        b = 3;
        op_code = 4'b1001; // Power
        #10;
        $display("Power: %d ^ %d = %d", a, b, uut.res);

        // Test Case 11: Square Root
        num_sqrt = 16;
        op_code = 4'b1010; // Square Root
        #10;
        $display("Square Root: sqrt(%d) = %d", num_sqrt, uut.res);

        // Finish simulation
        $finish;
    end

endmodule
