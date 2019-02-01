`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:02 05/23/2018 
// Design Name: 
// Module Name:    offset 
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
module offset#(parameter N=100)(
	output [N-1:0]out);

	assign out[383:368]=16'hfffe;
	assign out[367:352]=16'h0000;
	assign out[351:336]=16'hffff;
	assign out[335:320]=16'hffff;
	assign out[319:304]=16'h0000;
	assign out[303:288]=16'h0001;
	assign out[287:272]=16'h0000;
	assign out[271:256]=16'h0001;
	assign out[255:240]=16'h0000;
	assign out[239:224]=16'h0000;
	assign out[223:208]=16'h0001;
	assign out[207:192]=16'h0002;
	assign out[191:176]=16'hffff;
	assign out[175:160]=16'h0000;
	assign out[159:144]=16'h0000;
	assign out[143:128]=16'h0000;
	assign out[127:112]=16'h0001;
	assign out[111:96]=16'hffff;
	assign out[95:80]=16'hffff;
	assign out[79:64]=16'hffff;
	assign out[63:48]=16'hffff;
	assign out[47:32]=16'h0000;
	assign out[31:16]=16'h0000;
	assign out[15:0]=16'hffff;


endmodule
