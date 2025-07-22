`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2025 13:47:55
// Design Name: 
// Module Name: full_adder
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


module full_adder(input a,input b,input cin,output sum,output cout);
wire w1,w2,w3,w4;
xor(w1,a,b);
xor(sum,cin,w1);
and(w2,a,b);
and(w3,b,cin);
and(w4,cin,a);
or(cout,w4,w3,w2);
endmodule

module ripple_carry_adder( input [3:0]a, input [3:0]b, input cin, output [3:0]sum, output cout);
wire x1,x2,x3;
full_adder fa0(a[0],b[0],cin,sum[0],x1);
full_adder fa1(a[1],b[1],x1,sum[1],x2);
full_adder fa2(a[2],b[2],x2,sum[2],x3);
full_adder fa3(a[3],b[3],x3,sum[3],cout);
endmodule
