`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 10:12:28
// Design Name: 
// Module Name: topmodule
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


module topmodule(
    input x,y,x_f,y_f,
    output out
    );
    
    wire out1,out2;
    
    perceptron_xnotybar uut1(.x(x),.y(y),.x_f(x_f),.y_f(y_f),.out(out1));  
    
    perceptron_xbary uut2(.x(x),.y(y),.x_f(x_f),.y_f(y_f),.out(out2));
    
    or_xor uut3(.x(out1),.y(out2),.out(out));
    
endmodule
