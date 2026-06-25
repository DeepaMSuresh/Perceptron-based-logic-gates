`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 09:40:54
// Design Name: 
// Module Name: or_xor
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


module or_xor(
    input x,y,  // 2 input features: x = out1, y = out2
    output reg out    // Output prediction
);

// Scaling factor
    parameter integer SCALE = 256;

    // Scaled parameters for weights and bias
    parameter integer w0 = 26;  // 0.1 * SCALE
    parameter integer w1 = 26;  // 0.1 * SCALE
    parameter integer bias = -26; // -0.1 * SCALE

    // Intermediate variable for weighted sum
    //reg signed [31:0] weighted_sum;
    integer weighted_sum;

    always @(*) begin
    // Compute the linear sum
    weighted_sum = (( (x ? w0 : 8'd0) ) +((y ? w1 : 8'd0)) + bias);

    // Activation function (step function)
    
        if (weighted_sum == 0)
            out = 1;
        else
            out = 0;
            
     $display("weighted_sum = %d, out= %d", weighted_sum,out);
    end

endmodule

