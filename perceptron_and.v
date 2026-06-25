`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2025 10:09:42
// Design Name: 
// Module Name: perceptron_and
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



//module perceptron_and (
//    input x0, // x 
//    input x1, // y 
//    input x2, // x_f 
//    input x3, // y_f 
//    //output reg weighted_sum,
//    output reg y   
//);
////0.31110162 0.28378359 0.19186892 0.25707144
//    // Trained weights 
//    parameter real w2 = -0.17477466;  
//    parameter real w3 =  0.0870835;   
//    parameter real w0 =  0.29986525;  
//    parameter real w1 =  0.2084323;

//    // Trained bias 
//    parameter real bias = 0.18644234191519582;

//    // Threshold 
//    parameter real threshold = 0.5;

//    // Intermediate weighted sum
//    real weighted_sum;

//    always @(*) begin
//        // Compute the weighted sum: w0*x0 + w1*x1 + w2*x2 + w3*x3 + bias
//        weighted_sum = (w0 * x0) + (w1 * x1) + (w2 * x2) + (w3 * x3) + bias;

//        // Apply the activation function
//        if (weighted_sum >= threshold)
//            y = 1;
//        else
//            y = 0;
     
//      $display("weighted_sum = %f, y= %d", weighted_sum,y);
//    end

//endmodule

module perceptron_and (
    input wire x0,  // Input x
    input wire x1,  // Input y
    input wire x2,  // Input x_f
    input wire x3,  // Input y_f
    output reg y    // Output
);
    // Fixed-point scaled weights and bias (scaled by 2^10)
    parameter integer w2 = -179;    // -0.17477466 * 2^10
    parameter integer w3 = 89;     //  0.0870835  * 2^10
    parameter integer w0 = 307;    //  0.29986525 * 2^10
    parameter integer w1 = 213;    //  0.2084323  * 2^10
    parameter integer bias = 191;  //  0.18644234191519582 * 2^10

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



