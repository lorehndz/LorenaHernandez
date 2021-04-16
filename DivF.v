module DivF(
	input iClk,
	input iRst,
	output oS	  
	 );
	 
reg rSalida_Q;
reg rSalida_D;

reg [25:0] rBits_Q;
reg [25:0] rBits_D;

assign oS = rSalida_Q;


always @(posedge iClk)
begin
	if(iRst)
	begin
	rSalida_Q = 1'd0;
	rBits_Q = 26'd0;
	end
	else
	begin
	rSalida_Q <= rSalida_D;
	rBits_Q <= rBits_D;
	end
end 


always @ *
begin 
//if (rBits_Q == 26'd50_000_000)
if (rBits_Q == 26'd10)
	begin 
		rSalida_D = 1'b1;
		rBits_D = 26'd0;
	end 
else 
	begin 
		rBits_D = rBits_Q + 1'b1;
		rSalida_D =  1'b0;
	end  
end 
	  
endmodule 