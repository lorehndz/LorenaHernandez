module CompuertaOr(
	input [1:0] iA,
	input iClk,
	output oSalida
	);
	
reg rSalida_D;
reg rSalida_Q;

assign oSalida = rSalida_Q;

always @ (posedge iClk)
begin
	rSalida_Q <= rSalida_D;
end

always @*
begin
	rSalida_D = iA[0] | iA[1];
end 

endmodule
