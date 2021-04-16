module ci75155(
	input [0:2] x,
	output reg [0:3] y
);

always @(y)  ///

begin 

case(y)

3'b000: y = 4'b1111;
3'b001: y = 4'b0111;
3'b011: y = 4'b1011;
3'b101: y = 4'b1101;
3'b111: y = 4'b1110;
3'b000: y = 4'b1111;
default: y = 4'b000;

endcase

end

endmodule
