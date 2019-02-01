// -----------------------------------------------------------------------------
// Author : Serna Pérez (Rodrigo) rodsernaperez@gmail.com
// File   : OPBOMP.v
// Create : 2018-05-30 23:18:08
// Description: BOMP algorithm for one non-disperse block of size SIZE_BLOCKS, considering a signal of N 
// samples and and NUM_BLOCKS different possible blocks. Each value is implemented with DATA_WIDTH bits.
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps


module OPBOMP 
	#(
		parameter SIZE_BLOCKS   =3, 
		parameter N            =24, 
		parameter DATA_WIDTH   =16, 
		parameter NUM_BLOCKS    =32, 
		parameter LOG_NUM_BLOCKS =$clog2(NUM_BLOCKS)
	)(
	input [N*DATA_WIDTH-1:0] x, //received signal
	input clk, //clock signal, needed for the RAM
	output [SIZE_BLOCKS+LOG_NUM_BLOCKS-1:0] output_bits //decoded bits
	 );
	 
	wire [N*DATA_WIDTH-1:0] x_input,x_middle;
	wire [DATA_WIDTH*N*NUM_BLOCKS-1:0] sumByBlocks; //Matrix to do the projection
	wire [DATA_WIDTH*NUM_BLOCKS-1:0]projections; //Projections on each block
	wire [LOG_NUM_BLOCKS-1:0] posmax; //Position of the maximum projection
	wire [DATA_WIDTH*N*SIZE_BLOCKS-1:0] selectedPseudoinverse; //Output of the RAM
	wire  [N*DATA_WIDTH-1:0] offset; //Offset cancelation constant
	wire  [N*DATA_WIDTH-1:0] signal_without_offset; //Signal after offset removal
	wire [DATA_WIDTH*SIZE_BLOCKS-1:0]estimatedvalues; //Estimated coefficients
	wire [SIZE_BLOCKS-1:0] bits;
	
	FlipFlop #(
		.N(N*DATA_WIDTH)
	) inst_FlipFlop_input_x (
		.clk    (clk),
		.data   (x),
		.enable (1'b1),
		.reset  (1'b1),
		.clear  (1'b0),
		.out    (x_input)
	);
	
		FlipFlop #(
		.N(N*DATA_WIDTH)
	) inst_FlipFlop_middle_x (
		.clk    (clk),
		.data   (signal_without_offset),
		.enable (1'b1),
		.reset  (1'b1),
		.clear  (1'b0),
		.out    (x_middle)
	);

	 
	 
	 // Returns the offset constant
	offset #(.N(N*DATA_WIDTH))offsetvector (
    .out(offset)
    );

	// Cancels the offset
	MatrixAdder #(.M(N),.N(1),.DATA_WIDTH(DATA_WIDTH))offset_elimination (
    .a(x_input), 
    .b(offset), 
    .res(signal_without_offset)
    );

	// Outputs the matrix which does the projection 
	 MatrixSumByMatrix #(.N(DATA_WIDTH*N*NUM_BLOCKS)) sumbyblockmatrix (
    .out(sumByBlocks)
    );

	//Performs the projection
	MatrixMultiplier #(.M(NUM_BLOCKS),.N(N),.O(1))projectionsCalculation (
    .x1(sumByBlocks), 
    .x2(signal_without_offset), 
    .y(projections)
    );
	 
	 // Outputs the position of the maximum projection
	 comparator #(.DATA_WIDTH(DATA_WIDTH),.N(NUM_BLOCKS),.BITS_FOR_POSITION(LOG_NUM_BLOCKS)) comparation (
    .values(projections), 
    .pos_max(posmax)
    );
	 
	 
	 // Keeps all the different pseudoinverses
	 PseudoInverses_RAM PseudoInverses_RAM (
	  .clka(clk), // input clka
	  .addra(posmax), // input [5 : 0] addra
	  .douta(selectedPseudoinverse) // output [1199 : 0] douta
	);
	

	// Estimates the coeficients
	MatrixMultiplier #(.M(SIZE_BLOCKS),.N(N),.O(1))valueestimation (
    .x1(selectedPseudoinverse), 
    .x2(x_middle), 
    .y(estimatedvalues)
    );
	 
	 // Computes the bits from the coeficients
	 Symbols2Bits #(.N(SIZE_BLOCKS),.DATA_WIDTH(DATA_WIDTH))s2b (
    .x(estimatedvalues), 
    .output_bits(bits)
    );

 	FlipFlop #(
		.N(SIZE_BLOCKS+LOG_NUM_BLOCKS)
	) inst_FlipFlop (
		.clk    (clk),
		.data   ({bits,posmax}),
		.enable (1'b1),
		.reset  (1'b1),
		.clear  (1'b0),
		.out    (output_bits)
	);



endmodule
