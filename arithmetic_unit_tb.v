`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 18:31:25
// Design Name: 
// Module Name: arithmetic_unit_tb
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

module arithmetic_unit_tb;
reg [3:0]a,b;
reg [1:0]sel;
wire [7:0]result;

arithmetic_unit dut (.a(a),.b(b),.sel(sel),.result(result));

    initial begin
        // Dump waveforms
        $dumpfile("arithmetic_unit.vcd");
        $dumpvars(0, arithmetic_unit_tb);

        $display("Time\t sel\t a\t b\t result\t (Q,R if division)");
        $monitor("%0dns\t sel=%b\t a=%d\t b=%d\t result=%b", $time, sel, a, b, result);

        // Test 1: Adder
        a = 4'd5; b = 4'd3; sel = 2'b00;
        #100;

        // Test 2: Subtractor
        a = 4'd9; b = 4'd4; sel = 2'b01;
        #100;

        // Test 3: Multiplier
        a = 4'd7; b = 4'd2; sel = 2'b10;
        #100;

        // Test 4: Divider (4-stage pipeline needs more delay)
        a = 4'd6; b = 4'd3; sel = 2'b11;
        #400;  // Wait for all divider stages to complete

        // You can add more test cases here if needed

        $finish;
    end

endmodule


