module Memorias(
	input iClk,
	output [7:0]data_out
);

reg [7:0]ROM [0:31];

reg [7:0]rData_D;
reg [7:0]rData_Q;

reg [4:0]rCounter_D;
reg [4:0]rCounter_Q;

assign data_out = rData_Q;

	initial
	begin
	  $readmemh("hexdata.mem.txt", ROM);
	end

	always @ (posedge iClk)
	begin
		rCounter_Q <= rCounter_D;
		rData_Q <= rData_D;		
	end

	always @ *
	begin
		rData_D = ROM[rCounter_Q];
		if(rCounter_Q > 5'd31)
		rCounter_D = 5'd31;
		else
		rCounter_D = rCounter_Q + 4'd1;
	end

endmodule 