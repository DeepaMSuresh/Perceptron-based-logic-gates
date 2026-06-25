`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 15:23:35
// Design Name: 
// Module Name: and_perceptron
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


module and_perceptron (
    input x0, // x 
    input x1, // y 
    input x2, // x_f 
    input x3, // y_f 
    output reg y   
);

    // Trained weights 
     
    parameter  w0 =  8'b01001100;  
    parameter  w1 =  8'b00110101;
    parameter  w2 =  8'b11010101;  
    parameter  w3 =  8'b00010111;  

  

    // Trained bias 
 	 parameter bias = 8'b00110000;

    // Threshold 
parameter threshold = 8'b10000000;

    // Intermediate weighted sum
    reg [7:0] weighted_sum;

    always @(*) begin
        // Compute the weighted sum: w0*x0 + w1*x1 + w2*x2 + w3*x3 + bias
        weighted_sum = (w0 * x0) + (w1 * x1) + (w2 * x2) + (w3 * x3) + bias;

        // Apply the activation function
        if (weighted_sum >= threshold)
            y = 1;
        else
            y = 0;
  
      $display("weighted_sum = %b, y= %d", weighted_sum,y);
      
    end

endmodule
