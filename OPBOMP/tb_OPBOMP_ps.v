
`timescale 1ns/1ps

module tb_OPBOMP_ps (); /* this is automatically generated */

	reg clk;

	// clock
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	// (*NOTE*) replace reset, clock, others

	reg [383 : 0] x;
	reg   [2 : 0] output_bits;

	OPBOMP inst_OPBOMP (.clk(clk), .x(x), .output_bits(output_bits));

	initial begin
		// do something
		x[383:368] =16'hfffb;
		x[367:352] =16'h0010;
		x[351:336] =16'h0019;
		x[335:320] =16'hfffb;
		x[319:304] =16'hfff3;
		x[303:288] =16'hffeb;
		x[287:272] =16'hfffa;
		x[271:256] =16'hfffc;
		x[255:240] =16'h0000;
		x[239:224] =16'h0000;
		x[223:208] =16'h0004;
		x[207:192] =16'h000f;
		x[191:176] =16'hffec;
		x[175:160] =16'h0002;
		x[159:144] =16'hffeb;
		x[143:128] =16'hfff9;
		x[127:112] =16'h001e;
		x[111:96]  =16'hffef;
		x[95:80]   =16'h000c;
		x[79:64]   =16'h0000;
		x[63:48]   =16'hfff4;
		x[47:32]   =16'h000a;
		x[31:16]   =16'hfff6;
		x[15:0]    =16'h0003;
		repeat(10)@(posedge clk);
		$finish;
	end


endmodule
