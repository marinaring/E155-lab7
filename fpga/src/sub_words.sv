/* 
	Marina Ring, mring@g.hmc.edu, 10/27/24
	A function that uses the sBox function to substitute for a whole word.
*/

module sub_words(input  logic [127:0] a,
				 input clk, 
                 output logic [127:0] y);
				 
	sub_bytes w0(a[127:96], clk, y[127:96]);
	sub_bytes w1(a[95:64], clk, y[95:64]);
	sub_bytes w2(a[63:32], clk, y[63:32]);
	sub_bytes w3(a[31:0], clk, y[31:0]);
endmodule