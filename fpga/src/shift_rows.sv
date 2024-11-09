/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	A module to carry out the shifting of rows as part of AES
*/


//   The key and message are 128-bit values packed into an array of 16 bytes as
//   shown below
//        [127:120] [95:88] [63:56] [31:24]     S0,0    S0,1    S0,2    S0,3
//        [119:112] [87:80] [55:48] [23:16]     S1,0    S1,1    S1,2    S1,3
//        [111:104] [79:72] [47:40] [15:8]      S2,0    S2,1    S2,2    S2,3
//        [103:96]  [71:64] [39:32] [7:0]       S3,0    S3,1    S3,2    S3,3

module shift_rows(
	input logic [127:0] a,
	input logic en,
	output logic [127:0] y
);	
	always_comb begin
	if (en == 1) begin
		// first row of array is not shifted
		y[127:120] = a[127:120];
		y[95:88] = a[95:88];
		y[63:56] = a[63:56];
		y[31:24] = a[31:24];
		
		// second row of array is left-shifted by one 
		y[119:112] = a[87:80];
		y[87:80] = a[55:48];
		y[55:48] = a[23:16];
		y[23:16] = a[119:112];
		
		// third row of array is left-shifted by two
		y[111:104] = a[47:40];
		y[79:72] = a[15:8];
		y[47:40] = a[111:104];
		y[15:8] = a[79:72];
		
		// fourth row of array is left-shifted by three
		y[103:96] = a[7:0];
		y[71:64] = a[103:96];
		y[39:32] = a[71:64];
		y[7:0] = a[39:32];
	end
	else begin
		y = a;
	end
	end

endmodule