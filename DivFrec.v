module DivFrec(
	input iClk,
	output oDiv
	
	);
	
	
	reg rDiv_D;
	reg rDiv_Q;
	
	reg [25:0] rCount_D;
	reg [25:0] rCount_Q;
	
	assign oDiv = rDiv_Q;
	
	always @(posedge iClk)
	begin
		rDiv_Q <= rDiv_D;
		rCount_Q <= rCount_D;
	end
	
	always @ *
	begin
		if (rCount_Q == 26'd50000000)
		begin
			rDiv_D = 1'b1;
			rCount_D = 25'd0;
		end 
		else
		begin
			rDiv_D = 1'b0;
			rCount_D = rCount_Q + 1'd1;
		end
	end
	
endmodule
