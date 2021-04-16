module Multi4al(
	input [3:0] iData,
	input [1:0] iSelector,
	output oSalida

);

reg rSalida;

assign oSalida = rSalida;

always @ *
begin
	if(iSelector == 2'b00)
	begin
		rSalida = iData[0];
	end
	else if(iSelector == 2'b01)
	begin 
		rSalida = iData[1];
	end
	else if(iSelector == 2'b10)
	begin
		rSalida = iData[2];
	end
	else
	begin
		rSalida = iData[3];
	end
end


endmodule
