`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:59 06/11/2018 
// Design Name: 
// Module Name:    wrapper_mult 
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
module wrapper_mult(
input [15:0] a,b,
output  [15:0] p
    );

multiplication_16bits your_instance_name (
  .a(a), // input [15 : 0] a
  .b(b), // input [15 : 0] b
  .p(p) // output [31 : 0] p
);
endmodule
