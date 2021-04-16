module frec_divider(
	input iClk,
	output ofrec
	);
	
	reg [13:0] rContador_D;
	reg [13:0] rContador_Q;
	
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
	if(rContador_Q == 14'9600)
	begin
		rSignal_D = ~rSignal_D;
		rContador_D = 14'd0;
	end
	else
	begin
		rContador_D = rContador_Q + 1'b1;
	end
end

endmodule
