module counter #(parameter N = 4)(
	input iClk,
	input	iRst,
	input	iC,
	output oFlag,
	output [N-1:0] oS
);

reg [N-1:0] rCount_D = 3'd0;
reg [N-1:0] rCount_Q = 3'd0;
reg rFlag_D = 1'b0;
reg rFlag_Q = 1'b0;

assign oS = rCount_Q;
assign oFlag = rFlag_Q;

always @ (posedge iClk)
begin
	if(!iRst)
	begin
		rCount_Q <= 4'd0;
		rFlag_Q <= 1'b0;
	end
	else if(iC)
	begin
		rFlag_Q <= rFlag_D;
		rCount_Q <= rCount_D;
	end
	else
	begin
		rCount_Q <= rCount_Q;
		rCount_Q <= rCount_Q;
	end
end

always @ * 
begin
if (rCount_D == 4'd9)
begin
	rCount_D = 4'd0;
	rFlag_D = 1'd1;
end
else
begin
	rCount_D = rCount_Q + 1'd1;
	rFlag_D = 1'd0;
end
end

endmodule
