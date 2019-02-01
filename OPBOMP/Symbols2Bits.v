// -----------------------------------------------------------------------------
// Author : Serna Pérez (Rodrigo) rodsernaperez@gmail.com
// File   : Symbols2Bits.v
// Create : 2018-05-31 00:12:28
// Description: extracts the bits from N coefficients of DATA_WIDTH bits each
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps

module Symbols2Bits 
	#(
		parameter N=1, 
		parameter DATA_WIDTH=16
	)(
		input [DATA_WIDTH*N-1:0] x, //Vector of coeficients
		output [N-1:0] output_bits //Decoded bits
    );
	 
	 
	genvar i;

	//Substracts 1.5 of the coefficients and takes the bit of the sign
	generate
		for (i = 0; i < N; i = i + 1) begin: loop2

			comparator2 #(
				.BITS_FOR_POSITION(1), 
				.DATA_WIDTH(DATA_WIDTH)) comparator_with_constant (
				//.a        (vector_of_symbols[i]),
				.a        (x[N*DATA_WIDTH-i*DATA_WIDTH-1:N*DATA_WIDTH-i*DATA_WIDTH-DATA_WIDTH]),
				.b        (16'd192),
				.pos_a    (1'b1),
				.pos_b    (1'b0),
				.pos_max  (output_bits[i]),
				.value_max()
				);
		end
	endgenerate
	


endmodule
