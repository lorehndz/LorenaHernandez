module TopModule(
	input iClk,
	input iSignal,
	input iRst,
	output [3:0]oUnidades
	output [6:0] oS1,
	output [6:0] oS2,
	output [6:0] oS3,
	output [6:0] oS4
);

wire wDivFrec;
wire wCleanSignal;
wire [15:0]wFrec;

wire [3:0]wU;
wire [3:0]wD;
wire [3:0]wC;
wire [3:0]wUM;

Debouncing Debouncing_Module(
.iClk (iClk),
.iSignal (iSignal),
.oS (wCleanSignal)
);

DivF FrecDiv(
.iClk (iClk),
.iRst (iRst),
.oS (wDivFrec)
);

PeriodCounter TCounter(
.iClk (iClk),
.iCE (wDivFrec),
.iSignal (wCleanSignal),
.oCycles (oUnidades)
);

BitShift bitshift(
.iClk (iClk),
.iFrec (wFrec),
.oU (wU),
.oD (wD),
.oC (wC),
.oUM (wUM)
);

BCD Unidades(
.iClk (iClk),
.iE (wU),
.oS (oS1)
);

BCD Decenas(
.iClk (iClk),
.iE (wD),
.oS (oS2)
);

BCD Centenas(
.iClk (iClk),
.iE (wC),
.oS (oS3)
);

BCDMillares(
.iClk (iClk),
.iE (wUM),
.oS (oS4)
);

endmodule 
