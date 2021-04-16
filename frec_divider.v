module frec_divider(
	input iClk,
	output oS
	);
	
	reg [25:0] rContador_d;
	reg [25:0] rContador_q;
	
	reg rSignal_d;
	reg rSignal_q;
	
	assign oS = rSignal_q;
	
	always @(posedge iClk)
	begin
		rSignal_q <= rSignal_d;
		rContador_q <= rContador_d;
	end
	
	always @*
	begin
		rContador_d = rContador_q + 1'b1;
	if(rContador_q == 26'd25_000_000)
	begin
		rSignal_d = ~rSignal_d;
		rContador_d = 26'd0;
	end
	else
	begin
		rContador_d = rContador_q + 1'b1;
		//rSignal_d = 1'b0;
	end
end
endmodule
