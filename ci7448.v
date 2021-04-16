module ci7448(
   input [3:0] a,
	output reg [6:0] segmentos
);


///7 declarar clables y registros



// descripcion de circuito

always @(a)  ///
begin 

case (a)
		4'b0000: segmentos = 7'b0111111;
		4'b0001: segmentos = 7'b0000110;
		4'b0010: segmentos = 7'b1011011;
		4'b0011: segmentos = 7'b1001111;
		4'b0100: segmentos = 7'b1100110;
		4'b0101: segmentos = 7'b1101101;
		4'b0110: segmentos = 7'b1111100;
		4'b0111: segmentos = 7'b0000111;
		4'b1000: segmentos = 7'b1111111;
      default : segmentos = 7'b1100111;
endcase 
end
endmodule
