/*
	Marina Ring, mring@g.hmc.edu, 10/28/2024
	A module implementing a controller for the processing blocks for AES
*/


module aes_controller(
	input logic clk,
	input logic load,
	input logic [127:0] key,
	output logic sben,
	output logic sren,
	output logic mcen,
	output logic outen,
	output logic done,
	output logic [127:0] roundkey,
	output logic [3:0] debug_state // I want to debug state on a pin
);

	logic stayload;
	logic [8:0] counter;
	logic [3:0] state, nextstate, round, nextround;
	logic [127:0] prevkey;
	
	//calculate round key
	expand_key expand(prevkey, round, clk, roundkey);
	
	always_ff @(posedge clk) begin
		if (load) begin
			state <= 0;
			counter <= 0;
			round <= 0;
			prevkey <= key;
			stayload <= load;
		end
		else begin
			// if we enter a new round/state, reset counter and calculate new round key
			if (state != nextstate) begin
				counter <= 0;
				prevkey <= roundkey;
			end 
			// otherwise, keep incrementing counter
			else begin
				counter <= counter + 1;
			end
			
			// update states
			stayload <= 0;
			state <= nextstate;
			round <= nextround;
		end
	end
	
	// next state logic 
	aes_controller_nextstate FSM_logic(state, counter, load || stayload, nextstate, nextround);
	
	// output logic
	assign sben = (state != 1) && (state != 0) && (state != 12); // sub_bytes enable
	assign sren = (state != 1) && (state != 0) && (state != 12); // shift_rows enable
	assign mcen = (state != 1) && (state != 0) && (state != 11); // mix_columns enable
	assign done = (state == 12);	// successfully completed transmission!
	assign outen = (state == 12 && counter == 0); //&& (state != 11); // enable output

	assign debug_state = state;
endmodule