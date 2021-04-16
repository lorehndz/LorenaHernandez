module BCD#(parameter N = 7) (
input iClk,
input[3:0]iE,
output [6:0]oS
);

reg [6:0]rSalida_Q;
reg [6:0]rSalida_S;

assign oS = rSalida_Q;

always @ (posedge iClk)
begin
		rSalida_Q <= rSalida_S;
end


// bloque combinacional
always @ *
	case (iE)
								 // abcdefg
	4'b0000 : rSalida_S = 7'b0000001;//0
	4'b0001 : rSalida_S = 7'b1001111;//1
	4'b0010 : rSalida_S = 7'b0010010;//2
	4'b0011 : rSalida_S = 7'b0000110;//3
	4'b0100 : rSalida_S = 7'b1001100;//4
	4'b0101 : rSalida_S = 7'b0100100;//5
	4'b0110 : rSalida_S = 7'b1100000;//6
	4'b0111 : rSalida_S = 7'b0001111;//7
	4'b1000 : rSalida_S = 7'b0000000;//8
	4'b1001 : rSalida_S = 7'b0001100;//9
	default: rSalida_S = 7'b1111110;

endcase

endmodule