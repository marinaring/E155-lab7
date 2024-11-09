/* 
	Marina Ring, mring@g.hmc.edu, 10/27/24
	A function that uses the sBox function to substitute for a whole word.
*/

module sub_words(input  logic [127:0] a,
			     input logic en,
				 input logic clk, 
                 output logic [127:0] y);
				 
	logic [31:0] w0, w1, w2, w3; 

	// perform substitution
	sub_bytes word0(a[127:96], clk, w0);
	sub_bytes word1(a[95:64], clk, w1);
	sub_bytes word2(a[63:32], clk, w2);
	sub_bytes word3(a[31:0], clk, w3);
	
	always_comb begin    
		if (en) begin
			y = {w0, w1, w2, w3};
		end
		else begin
			y = a;
		end
	end
	
endmodule