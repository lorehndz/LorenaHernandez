 module FF_jk_tb();
 
	reg iJ;
	reg iK;
	reg iClk = 1'b0;
	wire oQ;
	wire oQn;
	
	//testbench
	
	FF_jk uut(
		.iJ  (iJ),
		.iK  (iK),
		.iClk  (iClk),
		.oQ  (oQ),
		.oQn  (oQn),
	);
	
	initial 
	begin   //estan en cero y despues de 100tiempos cambiaron a 1 (entradas)
		iJ = 0;
		iK = 0;
		#100;
		iJ = 1;
		iK = 0;
		#100;
		iJ = 0;
		iK = 1;
		#100;
		iJ = 1;
		iK = 1;
		#100;
		
	end
	
	always
	begin
		forever
		begin
			iClk = ~iClk;
			#50;
		end
	end
		
	
endmodule 