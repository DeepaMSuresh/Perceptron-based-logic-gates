`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 09:09:15
// Design Name: 
// Module Name: fa_nn
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


module fa_nn(
    input a,a_f,
    input b,b_f,
    input cin,
    output sum,
    output cy
    );
    
    wire s1,c1,c2;
    
    topmodule uut1(a,b,a_f,b_f,s1,c1);
    ha_nn uut2(cin,s1,sum,c2);
    or_nn uut3(c1,c2,cy);
    
endmodule
