module frec_divider(
	input iClk,
	output ofrec
	);
	
	reg [25:0] rContador_D;
	reg [25:0] rContador_Q;
	
	reg rSignal_D;
	reg rSignal_Q;
	
	assign oS = rSignal_Q;
	
	always @(posedge iClk)
	begin
		rSignal_Q <= rSignal_D;
		rContador_Q <= rContador_D;
	end
	
	always @*
	begin
		rContador_D = rContador_Q + 1'b1;
	if(rContador_Q == 26'd25_000_000)
	begin
		rSignal_D = ~rSignal_D;
		rContador_D = 26'd0;
	end
	else
	begin
		rContador_D = rContador_Q + 1'b1;
		//rSignal_D = 1'b0;
	end
end

endmodule
