module Decodificador (
input iClk,
input iT,
output [13:0]oFrec
);

reg rFrec_D;
reg rFrec_Q;

assign oFrec = rFrec_Q;

always @ (posedge iClk)
begin
	rFrec_Q <= rFrec_D;
end

always @ *
begin
	rFrec_D = 1/iT;
	
if (rFrec_D > 14'd9999)
	begin
	rFrec_D = 14'd10000;
	end
else
	begin
	rFrec_D = rFrec_Q;
	end
	
end

endmodule
