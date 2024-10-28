/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	This module applies the routine for expanding a round key
*/

//   Equivalently, the values are packed into four words as given
//        [127:96]  [95:64] [63:32] [31:0]      w[0]    w[1]    w[2]    w[3]

module expand_key(
	input logic [127:0] key,
	input logic clk, 
	output logic [127:0] y
);
	// w[i] = w[i - Nk] xor rot_and_sub_word(w[i - 1]) xor Rcon(i/Nk);
	logic [127:0] rot_key;

	rot_and_sub_bytes(key[127:96], clk, 

endmodule