// -----------------------------------------------------------------------------
// Author : Serna Pérez (Rodrigo) rodsernaperez@gmail.com
// File   : tb_Symbols2Bits.sv
// Create : 2018-06-01 20:23:54
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps

module tb_Symbols2Bits (); /* this is automatically generated */


	parameter N          = 1;
	parameter DATA_WIDTH = 16;

	parameter BORDER	= 16'd192;

	reg [DATA_WIDTH*N-1:0] x;
	wire            [N-1:0] output_bits;

	Symbols2Bits #(.N(N), .DATA_WIDTH(DATA_WIDTH)) inst_Symbols2Bits (.x(x), .output_bits(output_bits));

	initial begin
		// do something
		#20
		x=16'd0;
		#10
		if(output_bits != 0) begin
			$display("First test failed");
			$finish;
		end
		x=-16'd200;
		#10
		if(output_bits != 0) begin
			$display("Second test failed");
			$finish;
		end
		x=16'd200;
		#10
		if(output_bits != 1) begin
			$display("Third test failed");
			$finish;
		end


		$finish;
	end

endmodule
