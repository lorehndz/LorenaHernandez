module practice5(
	input iClk,
	input iRst,
	input [7:0]iSW,
	output [6:0]oS1,
	output [6:0]oS2
);

wire [7:0]mem_value;
wire [3:0]unidades;
wire [3:0]decenas;


Memorias ROM_memory(
.iClk (iClk),
.data_out (mem_value)
);

Comp comparator(
.iClk (iClk),
.iRst (iRst),
.mem_value (mem_value),
.iSW (iSW),
.oRU(unidades),
.oRD(decenas)
);

BCD Unidades(
.iE (decenas),
.iClk (iClk),
.oS (oS1)
);

BCD Decenas(
.iE (unidades),
.iClk (iClk),
.oS (oS2)
);

endmodule
