`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 09:18:10
// Design Name: 
// Module Name: perceptron_xbary
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


//module perceptron_xbary(
//    input x,  
//    input y,
//    input x_f,
//    input y_f,
//    output reg out    // Output prediction
//);

//    // Parameters for weights and bias (trained values)
//    parameter real w0 = -0.3;  
//    parameter real w1 = 0.2; 
//    parameter real w2 = 0.0;  
//    parameter real w3 = 0.1;    
//    parameter real bias = -0.2; 

//    // Intermediate variables
//    real weighted_sum;

//    always @(*) begin
//    // Compute the weighted sum
//    assign weighted_sum = (x* w0) + (y * w1) + (x_f * w2) + (y_f * w3) + bias;

//    // Activation function (step function)
//        if (weighted_sum >= 0)
//            out = 1;
//        else
//            out = 0;
            
//    $display("weighted_sum = %f, y= %d", weighted_sum,out);
    
//    end

//endmodule

module perceptron_xbary(
    input x,  
    input y,
    input x_f,
    input y_f,
    output reg out    // Output prediction
);

    // Scaling factor (e.g., scale = 2^8 = 256)
    parameter integer SCALE = 256;
    
    // Scaled parameters for weights and bias
    parameter integer w0 = -77;   // 0.2 * SCALE
    parameter integer w1 = 51; // -0.3 * SCALE
    parameter integer w2 = 0;  // 0.1 * SCALE
    parameter integer w3 = 26;   // 0.0 * SCALE
    parameter integer bias = -51; // 0.2 * SCALE

    // Intermediate variable for weighted sum
    integer weighted_sum;
    
    always @(*) begin
    // Compute the weighted sum
    weighted_sum = (( (x ? w0 : 8'd0) ) +((y ? w1 : 8'd0)) + ((x_f ? w2 : 8'd0)) + ((y_f ? w3 : 8'd0)) + bias);

    // Activation function (step function)
        if (weighted_sum >= 0)
            out = 1;
        else
            out = 0;
            
//    $display("weighted_sum = %f, y= %d", weighted_sum,out);
    
    end

endmodule
