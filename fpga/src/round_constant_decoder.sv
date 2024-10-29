/*
	Marina Ring, mring@g.hmc.edu, 10/28/24
	A module that decodes round number to round constant. Takes in round number (should be state - 1)
*/

module round_constant_decoder(
	input logic [3:0] Nr,
	output logic [31:0] constant
);

	always_comb begin
		case(Nr)
			1: constant = {8'h01, 8'h00, 8'h00, 8'h00};
			2: constant = {8'h02, 8'h00, 8'h00, 8'h00};
			3: constant = {8'h04, 8'h00, 8'h00, 8'h00};
			4: constant = {8'h08, 8'h00, 8'h00, 8'h00};
			5: constant = {8'h10, 8'h00, 8'h00, 8'h00};
			6: constant = {8'h20, 8'h00, 8'h00, 8'h00};
			7: constant = {8'h40, 8'h00, 8'h00, 8'h00};
			8: constant = {8'h80, 8'h00, 8'h00, 8'h00};
			9: constant = {8'h1b, 8'h00, 8'h00, 8'h00};
			10: constant = {8'h36, 8'h00, 8'h00, 8'h00};
			default: constant = 0;
		endcase
	end

endmodule