/* 
	Marina Ring, mring@g.hmc.edu, 10/27/24
	A function that uses the sBox function to substitute for a whole word.
*/

module sub_words(input  logic [127:0] a,
				 input clk, 
                 output logic [127:0] y);
				 
	// should I put an enabled flip flop here?
  sbox_sync w0(a[127:96], clk, y[127:96]);
  sbox_sync w1(a[95:64], clk, y[95:64]);
  sbox_sync w2(a[63:32], clk, y[63:32]);
  sbox_sync w3(a[31:0], clk, y[31:0]);
endmodule