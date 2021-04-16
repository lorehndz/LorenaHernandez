module practice3(
	input iClk,
	input iRst,
	output [6:0] oS1,
	output [6:0] oS2,
	output [6:0] oS3,
	output [6:0] oS4
);

wire frec_div;
wire wFlag1;
wire wFlag2;
wire wFlag3;
wire [3:0] oC1;
wire [3:0] oC2;
wire [3:0] oC3;
wire [3:0] oC4;


frec_divider Module1(
.iClk (iClk),
.oS (frec_div),
);


counter #(.N(4)) Unidades( 
.iClk (iClk),
.iRst (iRst),
.iC (frec_div),
.oS (oC1),
.oFlag (wFlag1)
);


counter #(.N(4)) Decenas( 
.iClk (iClk),
.iRst (iRst),
.iC (wFlag1),
.oFlag (wFlag2),
.oS (oC2)
);


counter #(.N(4)) Centenas( 
.iClk (iClk),
.iRst (iRst),
.iC (wFlag2),
.oFlag (wFlag3),
.oS (oC3)
);


counter #(.N(4)) Millares( 
.iClk (iClk),
.iRst (iRst),
.iC (wFlag3),
.oS (oC4)
);

BCD #(.N(7)) DUnidades(
.iE (oC1),
.iClk (iClk),
.oS (oS1)
);

BCD #(.N(7)) DDecenas(
.iE (oC2),
.iClk (iClk),
.oS (oS2)
);

BCD #(.N(7)) DCentenas(
.iE (oC3),
.iClk (iClk),
.oS (oS3)
);

BCD #(.N(7)) DMillares(
.iE (oC4),
.iClk (iClk),
.oS (oS4)
);
endmodule
