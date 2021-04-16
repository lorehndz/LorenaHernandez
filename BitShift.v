module BitShift (
	input iClk,
	input [13:0]iFrec,
	output [3:0]oU,
	output [3:0]oD,
	output [3:0]oC,
	output [3:0]oUM 
);

reg [15:0]rFrec_Q;
reg [15:0]rFrec_D;

reg [2:0]rState_Q;
reg [2:0]rState_D;

reg [3:0]rShiftCounter_D;
reg [3:0]rShiftCounter_Q;

reg [15:0] rResult_D;
reg [15:0] rResult_Q;


always @ (posedge iClk)
begin
	rFrec_Q <= rFrec_D;
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
	rFrec_D = iFrec;
	end
	rState_D = 2'd1;
end
2'd1: //estado sumar
begin
	if(rFrec_D[15:12] > 4)
	begin
		rFrec_D = rFrec_Q[15:12] + 14'd3; 
	end
	else 	if(rFrec_D[11:8] > 4)
	begin
		rFrec_D = rFrec_Q[11:8] + 14'd3;
	end
	else 	if(rFrec_D[7:4] > 4)
	begin
		rFrec_D = rFrec_Q[7:4] + 14'd3; 
	end
	else 	if(rFrec_D[3:0] > 4)
	begin
		rFrec_D = rFrec_Q[3:0] + 14'd3; 
	end
	else
	begin
		rFrec_D = rFrec_Q;
	end
		rState_D = 2'd2;
end
	
2'd2: //estado shift
	begin
		if(rShiftCounter_Q == 4'd11)
		begin
			rShiftCounter_D = 4'd0;
			rState_D = 2'd3;
		end
		else
		begin
			rFrec_D = {rFrec_Q << 3};
			rState_D = 2'd1;
		end
	rShiftCounter_D = rShiftCounter_Q + 4'd1;
	end

2'd3: //estado terminado
	begin
		rResult_D[15:12] = rFrec_Q[15:12];
		rResult_D[11:8] = rFrec_Q[11:8];
		rResult_D[7:4] = rFrec_Q[7:4];
		rResult_D[3:0] = rFrec_Q[3:0];
		rState_D = 2'd0;
	end
	
default:
	begin
		rState_D = 2'd0;
	end
endcase
end

assign oUM[3:0] = rResult_D[15:12];
assign oC[3:0] = rResult_D[11:8];
assign oD[3:0] = rResult_D[7:4];
assign oU[3:0] = rResult_D[3:0];

endmodule
