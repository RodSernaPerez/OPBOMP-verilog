
`timescale 1ns/1ps

module tb_OPBOMP (); /* this is automatically generated */

	reg clk;

	// clock
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end


	// (*NOTE*) replace reset, clock, others

	parameter SIZE_BLOCKS   = 3;
	parameter N            = 24;
	parameter DATA_WIDTH   = 16;
	parameter NUM_BLOCKS = 32;
	parameter LOG_NUM_BLOCKS = $clog2(NUM_BLOCKS);
    parameter EXPECTED_RESULT=8'b10001011;
    
	reg [N*DATA_WIDTH-1:0] x;
	wire [7:0] bits;

	OPBOMP #(
			.SIZE_BLOCKS(SIZE_BLOCKS),
			.N(N),
			.DATA_WIDTH(DATA_WIDTH),
			.NUM_BLOCKS(NUM_BLOCKS),
			.LOG_NUM_BLOCKS(LOG_NUM_BLOCKS)
		) inst_OPBOMP (
			.x    (x),
			.clk  (clk),
			.output_bits (bits)
		);

	initial begin
		#50
		// do something
		x[383:368]=16'h0003;
		x[367:352]=16'h0007;
		x[351:336]=16'h0014;
		x[335:320]=16'h0012;
		x[319:304]=16'h0003;
		x[303:288]=16'h000a;
		x[287:272]=16'hffe7;
		x[271:256]=16'hffd5;
		x[255:240]=16'hffff;
		x[239:224]=16'hfffa;
		x[223:208]=16'h0006;
		x[207:192]=16'hffff;
		x[191:176]=16'hfffd;
		x[175:160]=16'hfffd;
		x[159:144]=16'hfffb;
		x[143:128]=16'h0008;
		x[127:112]=16'h000e;
		x[111:96]=16'hfff6;
		x[95:80]=16'hfff1;
		x[79:64]=16'hfff2;
		x[63:48]=16'hfff4;
		x[47:32]=16'h0009;
		x[31:16]=16'hffee;
		x[15:0]=16'h000e;


		#100
		if(bits!=8'b11010001)begin
			$display("Not true");
			$finish;
		end

		repeat(10)@(posedge clk);
		$finish;
	end


endmodule
