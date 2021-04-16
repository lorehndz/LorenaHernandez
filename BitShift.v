module BitShift (
	input iClk,
	input [7:0]iOccurrences,
	output [3:0]oU,
	output [3:0]oD
);

reg [7:0]rRepeat_D;
reg [7:0]rRepeat_Q;

reg [2:0]rState_D;
reg [2:0]rState_Q;

reg [2:0]rShiftCounter_D;
reg [2:0]rShiftCounter_Q;

reg [7:0] rResult_D;
reg [7:0] rResult_Q;


always @ (posedge iClk)
begin
	rRepeat_D <= rRepeat_Q;
	rState_Q <= rState_D;
	rShiftCounter_Q <= rShiftCounter_D;
	rResult_Q <= rResult_D;
end

always @ *
begin

case(rState_Q)

2'd0: //estado inicial asignar datos
begin
	begin
	rRepeat_D = iOccurrences;
	end
	rState_D = 2'd1;
end
2'd1: //estado sumar
begin
	if(rRepeat_Q[7:4] > 4)
	begin
		rRepeat_D = rRepeat_Q[7:4] + 14'd3; 
	end
	else 	if(rRepeat_Q[3:0] > 4)
	begin
		rRepeat_D = rRepeat_Q[3:0] + 14'd3;
	end
		rState_D = 2'd2;
end
	
2'd2: //estado shift
	begin
		if(rShiftCounter_Q == 3'd5)
		begin
			rShiftCounter_D = 3'd0;
			rState_D = 2'd3;
		end
		else
		begin
			rRepeat_D = {rRepeat_Q << 3};
			rState_D = 2'd1;
		end
	rShiftCounter_D = rShiftCounter_Q + 3'd1;
	end

2'd3: //estado terminado
	begin
		rResult_D[7:4] = rRepeat_Q[7:4];
		rResult_D[3:0] = rRepeat_Q[3:0];
		rState_D = 2'd0;
	end
	
default:
	begin
		rState_D = 2'd0;
	end
endcase
end

assign oD[3:0] = rResult_D[7:4];
assign oU[3:0] = rResult_D[3:0];

endmodule
