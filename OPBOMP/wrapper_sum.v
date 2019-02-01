`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:48 06/11/2018 
// Design Name: 
// Module Name:    wrapper_sum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wrapper_sum(
input [15:0] a,b,
output [15:0] s);

adder_16bits your_instance_name (
  .a(a), // input [15 : 0] a
  .b(b), // input [15 : 0] b
  .s(s) // output [15 : 0] s
);

endmodule
