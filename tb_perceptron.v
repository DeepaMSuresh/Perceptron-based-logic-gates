`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 08:44:25
// Design Name: 
// Module Name: tb_perceptron
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


module tb_perceptron();
    reg x,y,x_f,y_f;  
    wire out;       

   and_perceptron uut (.x0(x),.x1(y),.x2(x_f),.x3(y_f),.y(out));
    
    initial begin
       x=0;y=0;x_f=0;y_f=0; #10;
	   x=0;y=0;x_f=1;y_f=0; #10;
       x=0;y=0;x_f=0;y_f=1; #10;
       x=0;y=1;x_f=0;y_f=1; #10;
       x=0;y=1;x_f=1;y_f=1; #10;
       x=0;y=1;x_f=0;y_f=0; #10;
       x=1;y=0;x_f=1;y_f=0; #10;
       x=1;y=0;x_f=0;y_f=0; #10;
       x=1;y=0;x_f=1;y_f=1; #10;
       x=1;y=1;x_f=1;y_f=1; #10;
       x=1;y=1;x_f=0;y_f=1; #10;
       x=1;y=1;x_f=1;y_f=0; #10;
       
       #10 $finish;
       
       end
       
       endmodule

