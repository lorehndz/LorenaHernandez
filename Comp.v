module Comp (
	input iClk,
	input iRst,
	input [7:0]mem_value,
	input [7:0]iSW,
	output [3:0]oRU,
	output [3:0]oRD
);

reg [3:0]rDU_D;
reg [3:0]rDU_Q;

reg [3:0]rDD_D;
reg [3:0]rDD_Q;

assign oRU = rDU_Q;
assign oRD = rDD_Q;


always @ *
begin
rDU_Q <= rDU_D;
rDD_Q <= rDD_D;
end

always @ (posedge iClk)
begin

if(~iRst)
begin
	rDU_D = 4'd0;
	rDD_D = 4'd0;
end
	
if(mem_value == iSW)
begin
rDU_D = rDU_Q + 4'd1;
	if  (rDU_Q > 4'd9)
	begin
	rDU_D = 4'd0; 
	rDD_D = rDD_Q + 4'd1;
	end
end

end
endmodule 