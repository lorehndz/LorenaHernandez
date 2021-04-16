module FF_jk(
	input iJ,
	input iK,
	input iClk,
	output oQ,
	output oQn
);

reg rQ;
reg rQn;

assign oQ = rQ;
assign oQn = rQn;

//b secuencial

always @ (posedge iClk)

begin
	if(iJ == 0 && iK == 0)
	begin
		rQ = rQ;
	end
	else if(iJ == 1 && iK == 0)
	begin
		rQ = 1'd1;
	end
	else if(iJ == 0 && iK == 1)
	begin 
		rQ = 1'd0;
	end
	else if(iJ == 1 && iK == 1)
	begin
		rQ = ~rQ;
	end
end
endmodule 
