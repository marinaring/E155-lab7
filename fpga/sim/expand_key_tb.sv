`timescale 10ns/1ns

/////////////////////////////////////////////
// testbench_sub_words
// Tests AES with cases from FIPS-197 appendix
// Tests sub bytes module apart from entire AES process
// Marina Ring, 10/28/2024
// mring@g.hmc.edu
/////////////////////////////////////////////

module testbench_expand_key();
    logic clk;
    logic [31:0] rcon;
    logic [127:0] key, roundkey, expected;
    
    // device under test
    expand_key dut(key, clk, rcon, roundkey);
    
    // test case
    initial begin   
    // Test case from FIPS-197 Appendix A.1, B
    key        <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
    rcon       <= {8'h01, 8'h00, 8'h00, 8'h00};
    expected   <= 128'ha0fafe1788542cb123a339392a6c7605;
    end

    // generate clock signal
    always begin
			clk = 1'b0; #5;
			clk = 1'b1; #5;
		end
        
    initial begin
	#10;
	assert(roundkey == expected) else $error("roundkey = %h, expected = %h", roundkey, expected);
    end

    
endmodule
