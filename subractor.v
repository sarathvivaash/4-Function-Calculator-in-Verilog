`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2025 18:17:20
// Design Name: 
// Module Name: subractor
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


module subractor( input a, input b, input bin, output diff, output bout);
wire w1,w2,w3,w4,w5;
 xor(w1,a,b);
 xor(diff,bin,w1);
 not(w2,a);
 and(w3,w2,b);
 not(w4,w1);
 and(w5,w4,bin);
 or(bout,w3,w5);
endmodule

module four_bit_subractor(input [3:0]a,input [3:0]b, input bin, output [3:0]diff, output bout);
wire x1,x2,x3;
subractor s0(a[0],b[0],bin,diff[0],x1); 
subractor s1(a[1],b[1],x1,diff[1],x2); 
subractor s2(a[2],b[2],x2,diff[2],x3); 
subractor s3(a[3],b[3],x3,diff[3],bout); 
endmodule


  
