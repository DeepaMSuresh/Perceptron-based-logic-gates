`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2025 19:40:01
// Design Name: 
// Module Name: perceptron_or
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



module perceptron_or (
    input wire x0,  // Input x
    input wire x1,  // Input y
    input wire x2,  // Input x_f
    input wire x3,  // Input y_f
    output reg y    // Output
);

    // Fixed-point scaled weights and bias (scaled by 2^10)
    parameter integer w2 = 187;    // 0.18279215 * 2^10
    parameter integer w3 = 185;    // 0.18104898 * 2^10
    parameter integer w0 = 226;    // 0.22059085 * 2^10
    parameter integer w1 = 228;    // 0.22241916 * 2^10
    parameter integer bias = 287;  // 0.2797646 * 2^10

    // Fixed-point threshold (scaled by 2^10)
    parameter integer threshold = 512;  // 0.5 * 2^10

    // Intermediate weighted sum (integer)
    integer weighted_sum;

    always @(*) begin
        // Compute the weighted sum: w0*x0 + w1*x1 + w2*x2 + w3*x3 + bias
        weighted_sum = (w0 * x0) + (w1 * x1) + (w2 * x2) + (w3 * x3) + bias;

        // Apply the activation function (compare to scaled threshold)
        if (weighted_sum >= threshold)
            y = 1;
        else
            y = 0;

        // Optional debug display (for simulation only, ignored in synthesis)
        $display("weighted_sum = %d, y = %d", weighted_sum, y);
    end

endmodule

