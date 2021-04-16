module Counter(
input iClk,
output [3:0]oSalida1,
output [3:0]oSalida2
);

reg [3:0]rSalida_D1 = 4'd0;
reg [3:0]rSalida_Q1;

reg [3:0]rSalida_D2 = 4'd0;
reg [3:0]rSalida_Q2;


assign oSalida1 = rSalida_Q1;
assign oSalida2 = rSalida_Q2;

always @ (posedge iClk)
begin
	rSalida_Q1 <= rSalida_D1;
	rSalida_Q2 <= rSalida_D2;
end

always @ *
begin
if(rSalida_D1 >= 4'd0 && rSalida_D1 < 4'd10)
	begin
	rSalida_D1 = rSalida_D1 + 4'd1;
	if(rSalida_D1 > 4'd9)
		begin
		rSalida_D2 = rSalida_D2 + 4'd1;
		rSalida_D1 = 4'd0;
		if (rSalida_D1 > 4'd9 && rSalida_D2 == 4'd9)
			begin
			rSalida_D1 = 4'd0;
			rSalida_D2 = 4'd0;
			end
		end
	end
end

endmodule 