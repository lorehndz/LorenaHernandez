module ci74153(
         input [6:0] all_in,
			output reg [0:0] y_out
);

always @(all_in)  ///
begin 

case(all_in)

7'bxxxxxx1: y_out = 1'b0;
7'b000xxx0: y_out = 1'b0;
7'b001xxx0: y_out = 1'b1;
7'b01x0xx0: y_out = 1'b0;
7'b01x1xx0: y_out = 1'b1;
7'b10xx0x0: y_out = 1'b0;
7'b10xx1x0: y_out = 1'b1;
7'b11xxx00: y_out = 1'b0;
default: y_out = 1'b1;

endcase

end


endmodule
