`timescale 10ns/1ns

/////////////////////////////////////////////
// testbench_shift_rows
// Tests AES with cases from FIPS-197 appendix
// Tests shift rows module apart from entire AES process
// Marina Ring, 10/28/2024
// mring@g.hmc.edu
/////////////////////////////////////////////

module testbench_shift_rows();
    logic clk, en;
    logic [127:0] roundstart, cyphertext, expected;
    
    // device under test
    shift_rows dut(roundstart, en, cyphertext);
    
    // test case
    initial begin   
    // Test case from FIPS-197 Appendix A.1, B
    roundstart <= 128'hD42711AEE0BF98F1B8B45DE51E415230;
    expected   <= 128'hD4bf5d30e0b452aeb84111f11e2798e5;
    end
    
    // generate clock signal
    always begin
			clk = 1'b0; #5;
			clk = 1'b1; #5;
		end
        
    initial begin
      	en = 1'b1; #22; // test with enabled on
	assert(cyphertext == expected) else $error("ENABLED: cyphertext = %h, expected = %h", cyphertext, expected);
	en = 1'b0; expected = roundstart; #10; // test with enabled off
	assert(cyphertext == expected) else $error("NOT ENABLED: cyphertext = %h, expected = %h", cyphertext, roundstart);
    end

    
endmodule
