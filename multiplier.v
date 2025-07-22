`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2025 19:04:11
// Design Name: 
// Module Name: multiplier
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


module eight_bit_adder(input [7:0]a, input [7:0]b, output [7:0]sum);
wire [7:0]carry;
full_adder f0(a[0], b[0], 0, sum[0], carry[0]);
full_adder f1(a[1], b[1], carry[0], sum[1], carry[1]);
full_adder f2(a[2], b[2], carry[1], sum[2], carry[2]);
full_adder f3(a[3], b[3], carry[2], sum[3], carry[3]);
full_adder f4(a[4], b[4], carry[3], sum[4], carry[4]);
full_adder f5(a[5], b[5], carry[4], sum[5], carry[5]);
full_adder f6(a[6], b[6], carry[5], sum[6], carry[6]);
full_adder f7(a[7], b[7], carry[6], sum[7], carry[7]);
endmodule

module multiplier(input [3:0]a, input [3:0]b, output [7:0]product);
wire [3:0]pp0,pp1,pp2,pp3;
wire [7:0]pp0_ext,pp1_shifted,pp2_shifted,pp3_shifted;
wire [7:0]sum1,sum2;

and(pp0[0],a[0],b[0]);
and(pp0[1],a[1],b[0]);
and(pp0[2],a[2],b[0]);
and(pp0[3],a[3],b[0]);
and(pp1[0],a[0],b[1]);
and(pp1[1],a[1],b[1]);
and(pp1[2],a[2],b[1]);
and(pp1[3],a[3],b[1]);
and(pp2[0],a[0],b[2]);
and(pp2[1],a[1],b[2]);
and(pp2[2],a[2],b[2]);
and(pp2[3],a[3],b[2]);
and(pp3[0],a[0],b[3]);
and(pp3[1],a[1],b[3]);
and(pp3[2],a[2],b[3]);
and(pp3[3],a[3],b[3]);

assign pp0_ext = {4'b0000,pp0};          
assign pp1_shifted = {3'b000,pp1,1'b0};     
assign pp2_shifted = {2'b00,pp2,2'b00};    
assign pp3_shifted = {1'b0,pp3,3'b000};   

eight_bit_adder a0(pp0_ext,pp1_shifted,sum1);
eight_bit_adder a1(sum1,pp2_shifted,sum2);
eight_bit_adder a2(sum2,pp3_shifted,product);

endmodule




