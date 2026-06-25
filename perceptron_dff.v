`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 15:48:59
// Design Name: 
// Module Name: perceptron_dff
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


module perceptron_dff (
    input wire clk,         // Input clock signal (used as input logic, not actual clock)
    input wire D,
    input wire Q_prev,
    input wire D_f,
    input wire Q_prev_f,
    output reg Q
);

    // Signed integer calculation
    integer activation;

    always @(*) begin
        // activation = -2*clk + 9*D + 5*Q_prev -3*D_f -1*Q_prev_f - 4
        activation = (-2 * clk) + (9 * D) + (5 * Q_prev) +
                     (-3 * D_f) + (-1 * Q_prev_f) + (-4);

        if (activation >= 0)
            Q = 1;
        else
            Q = 0;
    end

endmodule

