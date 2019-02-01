`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:56 06/11/2018 
// Design Name: 
// Module Name:    Wrapper_RAM 
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
module Wrapper_RAM(
  input clka, // input clka
  input [4:0]addra, // input [4 : 0] addra
  output [1151:0]douta // output [1151 : 0] douta
    );

PseudoInverses_RAM your_instance_name (
  .clka(clka), // input clka
  .addra(addra), // input [4 : 0] addra
  .douta(douta) // output [1151 : 0] douta
);
endmodule
