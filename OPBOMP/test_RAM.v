`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:54 06/11/2018
// Design Name:   OPBOMP
// Module Name:   C:/Users/Rodrigo/OPBOMP/test_RAM.v
// Project Name:  OPBOMP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OPBOMP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RAM;

	// Inputs
	reg [383:0] x;
	reg clk;

	// Outputs
	wire [0:0] output_bits;

	// Instantiate the Unit Under Test (UUT)
	OPBOMP uut (
		.x(x), 
		.clk(clk), 
		.output_bits(output_bits)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

