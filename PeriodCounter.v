module PeriodCounter (
	input iClk,
	input iCE,
	input iSignal,
	output [13:0] oCycles
);

reg [13:0]rCycles_D;
reg [13:0]rCycles_Q;

reg [1:0]rSignal_D;
reg [1:0]rSignal_Q;

reg [3:0]rCount_D;
reg [3:0]rCount_Q;


assign oCycles = rCycles_Q;

always @ (posedge iClk)
begin
	rCycles_Q <= rCycles_D;
	rSignal_Q <= rSignal_D;
	if(rCount_Q < 4)
	begin
		rSignal_D[rCount_D] <= iSignal;
	end
	else
	begin	
		rCount_D = rCount_Q + 4'd1;
	end
end

always @ *
begin
if (rSignal_D)
begin
	if(rCycles_D > 14'd9999)
	begin
		rCycles_D = 14'd10000;
	end
	else
	begin
		rCycles_D = rCycles_Q + 14'd1;
	end
end
else
begin
	rCycles_D = rCycles_Q;
end
end
endmodule
 (
	input iClk,
	input iCE,
	input iSignal,
	output [13:0] oCycles
);

reg [13:0]rCycles_D;
reg [13:0]rCycles_Q;

reg [1:0]rSignal_D;
reg [1:0]rSignal_Q;

reg [3:0]rCount_D;
reg [3:0]rCount_Q;


assign oCycles = rCycles_Q;

always @ (posedge iClk)
begin
	rCycles_Q <= rCycles_D;
	rSignal_Q <= rSignal_D;
	if(rCount_Q < 4)
	begin
		rSignal_D[rCount_D] <= iSignal;
	end
	else
	begin	
		rCount_D = rCount_Q + 4'd1;
	end
end

always @ *
begin
if (rSignal_D)
begin
	if(rCycles_D > 14'd9999)
	begin
		rCycles_D = 14'd10000;
	end
	else
	begin
		rCycles_D = rCycles_Q + 14'd1;
	end
end
else
begin
	rCycles_D = rCycles_Q;
end
end
endmodule
