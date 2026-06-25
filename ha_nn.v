`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 09:09:15
// Design Name: 
// Module Name: ha_nn
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


module ha_nn(
    input a,
    input b,
    output sum,
    output cy
    );
    
    xor_nn uut1(a,b,sum);
    and_nn uut2(cy,a,b);
    
endmodule
