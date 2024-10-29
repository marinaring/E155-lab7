`timescale 10ns/1ns

/////////////////////////////////////////////
// testbench_sub_bytes
// Tests AES with cases from FIPS-197 appendix
// Tests sub bytes module apart from entire AES process
// Marina Ring, 10/28/2024
// mring@g.hmc.edu
/////////////////////////////////////////////

module testbench_sub_bytes();
    logic clk, en;
    logic [127:0] key, roundstart, cyphertext, expected;
    
    // device under test
    sub_words dut(roundstart, clk, en, cyphertext);
    
    // test case
    initial begin   
    // Test case from FIPS-197 Appendix A.1, B
    key        <= 128'h2B7E151628AED2A6ABF7158809CF4F3C;
    roundstart <= 128'h193De3bea0f4e22b9ac68d2ae9f84808;
    expected   <= 128'hD42711AEE0BF98F1B8B45DE51E415230;
    end
    
    // generate clock and load signals
    always begin
			clk = 1'b0; #5;
			clk = 1'b1; #5;
		end
        
    initial begin
      en = 1'b1; #22; en = 1'b0; //Pulse load to start conversion
    end

    // wait until done and then check the result
    always @(posedge clk) begin
      if (en) begin
        if (cyphertext == expected)
            $display("Testbench ran successfully");
        else $display("Error: cyphertext = %h, expected %h",
            cyphertext, expected);
        $stop();
      end
    end
    
endmodule
