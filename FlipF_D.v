module FlipF_D(
	input iClk,
	input iD
	input iReset,
	input iEnable,
	output reg oQ
);


//secuencial- crear FF
always @(posedge iClk)
begin
	if(iReset == 1)
		oQ = 0;
	else if (iEnable == 1)
		oQ = iD;
	
end

endmodule
