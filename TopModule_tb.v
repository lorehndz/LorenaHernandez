module TopModule_tb();

reg iClk;
reg iSignal;
wire oUnidades;

integer seed = 3;

MagicModule  uut(
.iClk            (iClk),
.iSignal        (iSignal),
.oUnidades    (oUnidades)
);

initial
begin
  repeat (20)
  begin
		// Cero Estable
		iClk = 0;
		iSignal = 0;
		#400;
		// Ruido
		repeat (10)
		begin
			 iSignal = $random(seed)%2;
			 $display("iSignal %d",iSignal);
			 #20;
		end
		// Uno Estable
		iSignal = 1;
		#400;
  end
end

always
begin
  forever
  begin
		iClk = ~iClk;
		#20;
  end
end

endmodule
