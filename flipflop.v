module flipflop(
	input [0:1] i,
	output reg [0:1] o
);

always @(i)

begin
case(i)

2'b00: o = 2'bxx;
2'b01: o = 2'b01;
2'b10: o = 2'b10;
2'b11: o = 2'bxx;
default: o = 2'b00;

endcase

end

endmodule
