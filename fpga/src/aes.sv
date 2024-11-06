/////////////////////////////////////////////
// aes
//   Top level module with SPI interface and SPI core
/////////////////////////////////////////////

module aes(input  logic sck, 
           input  logic sdi,
           output logic sdo,
           input  logic load,
           output logic done, 
		   output logic [3:0] debug_state);
                    
    logic [127:0] key, plaintext, cyphertext;
	logic clk;
	
	HSOSC #(.CLKHF_DIV(2'b01)) 
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
            
    aes_spi spi(sck, sdi, sdo, done, key, plaintext, cyphertext);   
    aes_core core(clk, load, key, plaintext, done, cyphertext, debug_state);
endmodule