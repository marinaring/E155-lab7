/*
	Marina Ring, mring@g.hmc.edu, 10/28/2024
	A module that contains all of the combinational logic to determine the next state of our controller
*/

module aes_controller_nextstate(
	input logic [3:0] state,
	input logic [2:0] counter,
	input logic load,
	output logic [2:0] nextcounter,
	output logic [3:0] nextstate
);

	always_comb begin
		case(state) 
			// if new data is loaded, then we want to move to state 1
			0: (load) ? 1 : 0; 
			
			// state 1 (round 0) we don't need any delay because we are only loading in our key which is a path that does not go through registers
			1: nextstate = 2;
			
			// for states 2-11 we need a 2 clock cycle delay because of the sequential logic in sbox_sync (used in sub_bytes and expand_key)
			2: 	begin 
					if (counter == 2) begin
						nextstate = 3;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 2;
					end
				end 
			3: 	begin 
					if (counter == 2) begin
						nextstate = 4;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 3;
					end
				end 
			4: 	begin 
					if (counter == 2) begin
						nextstate = 5;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 4;
					end
				end 
			5: 	begin 
					if (counter == 2) begin
						nextstate = 6;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 5;
					end
				end 
			6: 	begin 
					if (counter == 7) begin
						nextstate = 3;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 6;
					end
				end 
			7: 	begin 
					if (counter == 2) begin
						nextstate = 8;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 7;
					end
				end  
			8: 	begin 
					if (counter == 2) begin
						nextstate = 9;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 8;
					end
				end 
			9: 	begin 
					if (counter == 2) begin
						nextstate = 10;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 9;
					end
				end 
			10: begin 
					if (counter == 2) begin
						nextstate = 11;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 10;
					end
				end 
			11: begin 
					if (counter == 2) begin
						nextstate = 0;
						nextcounter = 0;
					end
					else begin
						nextcounter = counter + 1;
						nextstate = 11;
					end
				end 
				
			default: nextstate = 0;
		endcase
	end


endmodule