module BCD (
input iClk,
input[3:0]iE,
output [6:0]oS
);

reg [6:0]rSalida_Q;
reg [6:0]rSalida_D;

assign oS = rSalida_Q;

always @ (posedge iClk)
begin
		rSalida_Q <= rSalida_D;
end

// bloque combinacional
always @ *
	case (iE)
								 // abcdefg
	4'b0000 : rSalida_D = 7'b1000000;//0
	4'b0001 : rSalida_D = 7'b1111001;//1
	4'b0010 : rSalida_D = 7'b0100100;//2
	4'b0011 : rSalida_D = 7'b0110000;//3
	4'b0100 : rSalida_D = 7'b0011001;//4
	4'b0101 : rSalida_D = 7'b0010010;//5
	4'b0110 : rSalida_D = 7'b0000010;//6
	4'b0111 : rSalida_D = 7'b1111000;//7
	4'b1000 : rSalida_D = 7'b0000000;//8
	4'b1001 : rSalida_D = 7'b0011000;//9
	default: rSalida_D = 7'b1000000;

endcase
endmodule 