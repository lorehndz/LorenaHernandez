module memoria(
	input iClk,
	output [7:0] oValor
	);
	
	reg [7:0] ex1_memory [3:0];
	
	reg [7:0] rMemory_Q;
	reg [7:0] rMemory_D;
	
	reg [1:0] rCounter_D;
	reg [1:0] rCounter_Q;
	
	assign oValor = rMemory_Q;
	
	initial
	begin
		$readmemh("ex1.mem.txt",ex1_memory);
	end
	
	always @ (posedge iClk)
	begin
		rMemory_Q <= rMemory_D;
		rCounter_Q <= rCounter_D;
	end
	
	always @*
	begin
		rMemory_D = ex1_memory[rCounter_Q];
		rCounter_D = rCounter_Q + 2'd1;
	end
	
	endmodule
	