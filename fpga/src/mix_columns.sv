/////////////////////////////////////////////
// mixcolumns
//   Even funkier action on columns
//   Section 5.1.3, Figure 9
//   Same operation performed on each of four columns
/////////////////////////////////////////////

module mix_columns(input  logic [127:0] a,
				   input  logic en,
                  output logic [127:0] y);

	logic [31:0] c0, c1, c2, c3;	

	mixcolumn mc0(a[127:96], c0);
	mixcolumn mc1(a[95:64],  c1);
	mixcolumn mc2(a[63:32],  c2);
	mixcolumn mc3(a[31:0],   c3);



	always_comb begin
		if (en) begin
			y = {c0, c1, c2, c3};		
	  	end
		else begin
			y = a;
		end
	end
endmodule