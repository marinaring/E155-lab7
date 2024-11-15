/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	This module applies the routine for expanding a round key
*/

//   Equivalently, the values are packed into four words as given
//        [127:96]  [95:64] [63:32] [31:0]      w[0]    w[1]    w[2]    w[3]

module expand_key(
	input logic [127:0] prevkey,
	input logic [3:0] round,
	input logic clk, 
	output logic [127:0] y
);
	logic [31:0] rcon;
	logic [31:0] w3, w4, w5, w6, w7;

	round_constant_decoder decode(round, rcon);
	rot_and_sub_bytes rsb(prevkey[31:0], clk, w3);
	
	always_comb begin
		// the zeroeth round is letting the normal key pass through
		if (round == 0) begin
			y = prevkey;
		end
		else begin
			// w[i] = w[i - Nk] xor rot_and_sub_word(w[i - 1]) xor Rcon(i/Nk) when i is a multiple of Nk
			w4 = prevkey[127:96] ^ w3 ^ rcon;
	
			// w[i] = w[i - Nk] xor w[i - 1]
			w5 = prevkey[95:64] ^ w4;
			w6 = prevkey[63:32] ^ w5;
			w7 = prevkey[31:0] ^ w6;
			y = {w4, w5, w6, w7};
		end
	end

endmodule