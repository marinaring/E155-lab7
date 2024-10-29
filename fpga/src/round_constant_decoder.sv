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
			1: constant = {'h01, 'h00, 'h00, 'h00};
			2: constant = {'h02, 'h00, 'h00, 'h00};
			3: constant = {'h04, 'h00, 'h00, 'h00};
			4: constant = {'h08, 'h00, 'h00, 'h00};
			5: constant = {'h10, 'h00, 'h00, 'h00};
			6: constant = {'h20, 'h00, 'h00, 'h00};
			7: constant = {'h40, 'h00, 'h00, 'h00};
			8: constant = {'h80, 'h00, 'h00, 'h00};
			9: constant = {'h1b, 'h00, 'h00, 'h00};
			10: constant = {'h36, 'h00, 'h00, 'h00};
			default: constant = 0;
		endcase
	end

endmodule