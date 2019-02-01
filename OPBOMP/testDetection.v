`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:55:32 05/19/2018
// Design Name:   OPBOMP
// Module Name:   C:/Users/Rodrigo/Desktop/RLS/testDetection.v
// Project Name:  RLS
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

module testDetection;

	// Inputs
	reg [383:0] x;

	// Outputs
	wire [5:0] posmax;

	// Instantiate the Unit Under Test (UUT)
	OPBOMP uut (
		.x(x), 
		.posmax(posmax)
	);

	initial begin
		// Initialize Inputs
		x = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		 x[383:368]=16'hff77;
		 x[367:352]=16'h0078;
		 x[351:336]=16'h002d;
		 x[335:320]=16'hfffc;
		 x[319:304]=16'h0017;
		 x[303:288]=16'hff38;
		 x[287:272]=16'hfff5;
		 x[271:256]=16'h00cd;
		 x[255:240]=16'h000d;
		 x[239:224]=16'h0005;
		 x[223:208]=16'hffa2;
		 x[207:192]=16'hfffc;
		 x[191:176]=16'h001e;
		 x[175:160]=16'h0037;
		 x[159:144]=16'hffd0;
		 x[143:128]=16'hffe2;
		 x[127:112]=16'h0103;
		 x[111:96]=16'hfedf;
		 x[95:80]=16'h011d;
		 x[79:64]=16'h002b;
		 x[63:48]=16'h0080;
		 x[47:32]=16'hff2b;
		 x[31:16]=16'hffb4;
		 x[15:0]=16'hffdc;

	end
      
endmodule

