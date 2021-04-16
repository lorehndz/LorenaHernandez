module sumador3bits(
	input [0:2] in,
	output reg [0:1] out,
);

always @(in)

begin

case(in)

	3'b000: out = 2'b00;
	3'b001: out = 2'b01;
	3'b010: out = 2'b01;
	3'b011: out = 2'b10;
	3'b100: out = 2'b01;
	3'b101: out = 2'b10;
	3'b110: out = 2'b10;
	3'b111: out = 2'b11;
	default: out = 2'b00;
	
endcase

end

endmodule
