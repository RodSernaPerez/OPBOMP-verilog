`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:46:09 06/11/2018
// Design Name:   Wrapper_RAM
// Module Name:   C:/Users/Rodrigo/OPBOMP/testRAM.v
// Project Name:  OPBOMP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Wrapper_RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testRAM;

	// Inputs
	reg clka;
	reg [4:0] addra;

	// Outputs
	wire [1151:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Wrapper_RAM uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

