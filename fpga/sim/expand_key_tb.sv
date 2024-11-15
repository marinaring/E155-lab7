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
    logic [3:0] round;
    logic [31:0] rcon;
    logic [127:0] key, roundkey, expected;
    
    // device under test
    expand_key dut(key, round, clk, roundkey);
    
    // test case
    initial begin   
    // Test case from FIPS-197 Appendix A.1, B
    key        <= 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
    round      <= 1;
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
