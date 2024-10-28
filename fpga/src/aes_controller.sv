/*
	Marina Ring, mring@g.hmc.edu, 10/28/2024
	A module implementing a controller for the processing blocks for AES
*/


module aes_controller(
	input logic clk,
	input logic load,
	input logic [127:0] nextkey,
	output logic sben,
	output logic sren,
	output logic mcen,
	output logic ready,
	output logic constant,
	output logic [127:0] key
);

	logic [3:0] state, nextstate;
	
	always_ff @(posedge clk) begin
		if (~reset) begin
			state <= 0;
			counter <= 0;
		end
		else begin
			state <= nextstate;
			counter <= nextcounter;
			key <= nextkey; // not sure if this will be valid
		end
	end
	
	// output logic
	assign sben = (state != 1 and state != 0);
	assign sren = (state != 1 and state != 0);
	assign mcen = (state != 1 and state != 0 and state != 11);
	assign ready = (state == 11 and counter == 2);
	round_constant_decoder(state - 1, counter);

endmodule