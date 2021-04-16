module Contador_4(
	input iClk,
	output [3:0]oCuenta
);

reg [3:0]rCuenta_D = 4'b0000;
reg [3:0]rCuenta_Q; = 4'b0000;

assign oCuenta = rCuenta_Q;

always @ (posedge iClk)
begin
	rCuenta_Q <= rCuenta_D;
end

always @ *
begin 
	rCuenta_D = rCuenta_Q + 1'd1;
end

endmodule
