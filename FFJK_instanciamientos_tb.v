module FFJK_instanciamientos_tb();

	reg iJ;
	reg iK;
	reg iClk;
	wire oQ;
	wire oQn;
	
	FFJK_instanciamientos moduloff  (
		.iJ   (iJ),
		.iK   (iK),
		.iClk (iClk),
		.oQ    (oQ),
		.oQn  (oQn)
		
		);
		
	initial
	begin
		iJ =0;
		iK = 0;        //estado 1
		#100; //retardo
		iJ =0;
		iK = 1;        //estado 2
		#100; //retardo
		iJ =1;
		iK = 0;        //estado 3
		#100; //retardo
		iJ =1;
		iK = 0;        //estado 4
		#100; //retardo
		
	end
	
	always
	begin
		forever
		begin
			iClk = ~iClk;   //señal de muestreo 
			#50;
		end
	end
	
endmodule
