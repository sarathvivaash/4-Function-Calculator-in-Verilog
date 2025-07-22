`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 17:50:24
// Design Name: 
// Module Name: arithmetic_unit
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

`timescale 1ns/1ps
module arithmetic_unit (input [3:0]a,input[3:0]b,input [1:0]sel,output [7:0]result);
wire [3:0]add_out,sub_out;
wire [3:0]quotient,remainder;
wire cout, bout;
wire [7:0]mul_out;

ripple_carry_adder ADD(a, b, 1'b0, add_out, cout);
four_bit_subractor SUB(a, b, 1'b0, sub_out, bout);
multiplier MUL(a, b, mul_out);
divider DIV(a, b, quotient, remainder);

assign result = (sel == 2'b00) ? {4'b0000, add_out} :
                (sel == 2'b01) ? {4'b0000, sub_out} :
                (sel == 2'b10) ? mul_out :
                (sel == 2'b11) ? {quotient, remainder} :
                    8'b00000000;

endmodule






