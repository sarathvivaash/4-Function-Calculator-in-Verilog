`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 22:40:57
// Design Name: 
// Module Name: divider
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


module one_stage_divider (input [3:0]dividend,input [3:0]divisor,input [3:0]prev_remainder,input [3:0]prev_quotient,output [3:0] new_quotient,output [3:0] new_remainder);
wire [3:0] shifted_rem, sub_out;
wire qbit;

assign shifted_rem = {prev_remainder[2:0], dividend[3]};
assign sub_out = shifted_rem - divisor;
assign qbit = (shifted_rem < divisor);
assign new_remainder = qbit ? shifted_rem : sub_out;
assign new_quotient = {prev_quotient[2:0], ~qbit};

endmodule


module divider (input [3:0]a,input [3:0]b,output [3:0]quotient,output [3:0]remainder);
wire [3:0] q1, q2, q3;
wire [3:0] r1, r2, r3;

 one_stage_divider DIV0(.dividend({a[3],3'b000}),.divisor(b),.prev_remainder(4'b0000),.prev_quotient(4'b0000),.new_quotient(q1),.new_remainder(r1));

 one_stage_divider DIV1(.dividend({a[2], 3'b000}),.divisor(b),.prev_remainder(r1),.prev_quotient(q1),.new_quotient(q2),.new_remainder(r2));

 one_stage_divider DIV2(.dividend({a[1], 3'b000}),.divisor(b),.prev_remainder(r2),.prev_quotient(q2),.new_quotient(q3),.new_remainder(r3));

 one_stage_divider DIV3(.dividend({a[0], 3'b000}),.divisor(b),.prev_remainder(r3),.prev_quotient(q3),.new_quotient(quotient),.new_remainder(remainder));

endmodule

