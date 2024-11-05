/*
	Marina Ring, mring@g.hmc.edu, 10/28/2024
	A module that contains all of the combinational logic to determine the next state of our controller
*/

module aes_controller_nextstate(
	input logic [3:0] state,
	input logic [8:0] counter,
	input logic load,
	output logic [3:0] nextstate,
	output logic [3:0] nextround
);

	always_comb begin
		case(state) 
			// if new data is loaded, then we want to move to state 1
			0: begin
				nextstate = (load) ? 1 : 0; 
				nextround = 0;
			   end
			
			// state 1 (round 0) we don't need any delay because we are only loading in our key which is a path that does not go through registers
			1: begin
				nextstate = 2;
				nextround = 1;
			   end
			
			// for states 2-11 we need a 3 clock cycle delay because of the sequential logic in sbox_sync (used in sub_bytes and expand_key)
			2: 	begin 
					if (counter == 1) begin
						nextstate = 3;
						nextround = 2;
					end
					else begin
						nextstate = 2;
						nextround = 1;
					end
				end 
			3: 	begin 
					if (counter == 1) begin
						nextstate = 4;
						nextround = 3;
					end
					else begin
						nextstate = 3;
						nextround = 2;
					end
				end 
			4: 	begin 
					if (counter == 1) begin
						nextstate = 5;
						nextround = 4;
					end
					else begin
						nextstate = 4;
						nextround = 3;
					end
				end 
			5: 	begin 
					if (counter == 1) begin
						nextstate = 6;
						nextround = 5;
					end
					else begin
						nextstate = 5;
						nextround = 4;
					end
				end 
			6: 	begin 
					if (counter == 1) begin
						nextstate = 7;
						nextround = 6;
					end
					else begin
						nextstate = 6;
						nextround = 5;
					end
				end 
			7: 	begin 
					if (counter == 1) begin
						nextstate = 8;
						nextround = 7;
					end
					else begin
						nextstate = 7;
						nextround = 6;
					end
				end  
			8: 	begin 
					if (counter == 1) begin
						nextstate = 9;
						nextround = 8;
					end
					else begin
						nextstate = 8;
						nextround = 7;
					end
				end 
			9: 	begin 
					if (counter == 1) begin
						nextstate = 10;
						nextround = 9;
					end
					else begin
						nextstate = 9;
						nextround = 8;
					end
				end 
			10: begin 
					if (counter == 1) begin
						nextstate = 11;
						nextround = 10;
					end
					else begin
						nextstate = 10;
						nextround = 9;
					end
				end 
			11: begin 
					if (counter == 1) begin
						nextstate = 12;
						nextround = 0;
					end
					else begin
						nextstate = 11;
						nextround = 10;
					end
				end 
				
			12: begin
					if (counter == '1) begin
						nextstate = 0; 
						nextround = 0;
					end 
					else begin
						nextstate = 12;
						nextround = 0;
					end	
				end		
			default: 
				begin 
					nextstate = 0;
					nextround = 0;
				end
		endcase
	end


endmodule