module CompuertaAnd( //TOP MODULE este ees el instanciamiento solo que se hace en el original y no me acorde
	input [2:0]iA,
	input iClk,
	output oSalida
	);
	
	
wire wSalidaAndEntradaOr;
	
//nombre del modulo etiqueta

CompuertaAndd    Micompuerta1(
	.iA       ({iA[1], iA[0]}),     //MSB    LSB
	.iClk     (iClk),
	.oSalida  (wSalidaAndEntradaOr)
);

CompuertaOr       Lacompuertaor(
	.iA    ({wSalidaAndEntradaOr, iA[2]}),
	.iClk  (iClk),
	.oSalida (oSalida)
);

endmodule

