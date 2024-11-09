/*
	Marina Ring, mring@hmc.edu, 10/28/24
	Module to test the AES controller module
	
*/

module testbench_aes_controller();
	logic [127:0] key;
	logic clk, load;
	logic sben, sben_expected, sren, sren_expected, mcen, mcen_expected, outen, outen_expected, done;
	logic [127:0] roundkey, roundkey_expected;
	logic [3:0] debug_state;

	logic [31:0] vectornum, errors;
	logic [259:0] testvectors[10000:0];
	
	aes_controller controller(clk, load, key, sben, sren, mcen, outen, done, roundkey, debug_state);
	
	always 
		begin
			clk = 1; #5; clk = 0; #5;
		end
	
	initial 
		begin
			$readmemh("aes_controller_tv.txt", testvectors); // readmemh ensures that we can write aes_controller in hexadecimal!!!
			vectornum = 0; errors = 0;
			load = 1; #22; load = 0;
		end
	
	always @(posedge clk)
		begin
			#1; {key, sben_expected, sren_expected, mcen_expected, outen_expected, roundkey_expected} = testvectors[vectornum];
		end
		
	always @(negedge clk)
		if (!load) begin // skip during reset
			if (sben_expected != sben || sren_expected != sren || mcen_expected != mcen || outen_expected != outen) begin // check result
				$display("Error: input = %h", {load, key});
				$display(" outputs = %b (%b expected)", {sben, sren, mcen, outen}, {sben_expected, sren_expected, mcen_expected, outen_expected});
				errors = errors + 1;
			end
			if (roundkey_expected != roundkey) begin
				$display("Error: input = %h", {load, key});
				$display(" outputs = %h (%h expected)", {roundkey}, {roundkey_expected});
				errors = errors + 1;
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 260'hx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$stop;
			end
		end
endmodule
