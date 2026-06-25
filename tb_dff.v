`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 15:48:59
// Design Name: 
// Module Name: tb_dff
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


//module tb_dff;
//    reg clk, D, Q_prev, D_f, Q_prev_f;
//    wire Q;

//    perceptron_dff uut (
//        .clk(clk),
//        .D(D),
//        .Q_prev(Q_prev),
//        .D_f(D_f),
//        .Q_prev_f(Q_prev_f),
//        .Q(Q)
//    );

//    initial begin
//        $display("clk D Q_prev D_f Q_prev_f | Q");
//        $display("-----------------------------");

//        // Loop through representative input combinations
//        clk = 1; D = 1; Q_prev = 0; D_f = 1; Q_prev_f = 0; #10;
//        $display(" %b   %b    %b     %b     %b       | %b", clk, D, Q_prev, D_f, Q_prev_f, Q);

//        clk = 1; D = 1; Q_prev = 0; D_f = 0; Q_prev_f = 0; #10;
//        $display(" %b   %b    %b     %b     %b       | %b", clk, D, Q_prev, D_f, Q_prev_f, Q);

//        clk = 1; D = 0; Q_prev = 1; D_f = 1; Q_prev_f = 1; #10;
//        $display(" %b   %b    %b     %b     %b       | %b", clk, D, Q_prev, D_f, Q_prev_f, Q);

//        clk = 0; D = 1; Q_prev = 1; D_f = 0; Q_prev_f = 0; #10;
//        $display(" %b   %b    %b     %b     %b       | %b", clk, D, Q_prev, D_f, Q_prev_f, Q);
        
         
//        $finish;
//    end
//endmodule

module tb_dff;
    reg clk, D, Q_prev, D_f, Q_prev_f;
    wire Q;

    perceptron_dff uut (
        .clk(clk),
        .D(D),
        .Q_prev(Q_prev),
        .D_f(D_f),
        .Q_prev_f(Q_prev_f),
        .Q(Q)
    );

    task apply_input;
        input clk_in, D_in, Q_prev_in, D_f_in, Q_prev_f_in;
        begin
            clk = clk_in;
            D = D_in;
            Q_prev = Q_prev_in;
            D_f = D_f_in;
            Q_prev_f = Q_prev_f_in;
            #10;
            $display(" %b   %b    %b     %b     %b   | %b", clk, D, Q_prev, D_f, Q_prev_f, Q);
        end
    endtask

    initial begin
        $display("clk D Q_prev D_f Q_prev_f | Q");
        $display("-----------------------------");

        // Row 1: 1 1 x 1 x
        apply_input(1, 1, 0, 1, 0);
        apply_input(1, 1, 1, 1, 1);

        // Row 2: 1 1 x 0 x
        apply_input(1, 1, 0, 0, 0);
        apply_input(1, 1, 1, 0, 1);

        // Row 3: 1 0 x 0 x
        apply_input(1, 0, 0, 0, 0);
        apply_input(1, 0, 1, 0, 1);

        // Row 4: 1 0 x 1 x
        apply_input(1, 0, 0, 1, 0);
        apply_input(1, 0, 1, 1, 1);

        // Row 5: 0 x 1 x 1
        apply_input(0, 0, 1, 0, 1);
        apply_input(0, 1, 1, 1, 1);

        // Row 6: 0 x 1 x 0
        apply_input(0, 0, 1, 0, 0);
        apply_input(0, 1, 1, 1, 0);

        // Row 7: 0 x 0 x 0
        apply_input(0, 0, 0, 0, 0);
        apply_input(0, 1, 0, 1, 0);

        // Row 8: 0 x 0 x 1
        apply_input(0, 0, 0, 0, 1);
        apply_input(0, 1, 0, 1, 1);

        $finish;
    end
endmodule
