/* 
	Marina Ring, mring@g.hmc.edu, 10/28/2024
	A module implementing a controller for the processing blocks for AES
*/

module aes_controller_new(
	input logic clk, 
	input logic load, 
	input logic [127:0] key, 
	output logic sben, 
	output logic sren, 
	output logic mcen, 
	output logic outen, 
	output logic done, 
	output logic [127:0] roundkey
);

	logic stayload;
	logic [3:0] state, nextstate, round, nextround;
	logic [8:0] counter; 
	logic [127:0] prevkey;
	
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
			stayload <= 0; // state transitions depend on the load signal staying high for one more clock cycle than it actually does, stayload gets around this
			state <= nextstate;
			round <= nextround;
		end
	end
	
	// next state logic
	aes_controller_nextstate FSM_logic(state, counter, load || stayload, nextstate, nextround);
	
	// output logic
	assign sben = (state != 1) && (state != 0) && (state != 12);
	assign sren = (state != 1) && (state != 0) && (state != 12);
	assign mcen = (state != 1) && (state != 0) && (state != 11);
	assign done = (state == 11 && counter == 3) || (state == 12);
	assign outen = (((counter == 3) && (state != 12)) || (state == 1));
	
endmodule
			