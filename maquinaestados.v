module maquinaestados(
	input iClk,
	input iRestart,
	input iPause,
	output [1:0] oValorEstado
	);
	
	reg [1:0]rValorEstado_D;
	reg [1:0]rValorEstado_Q;
	
	reg [1:0]rEstado_D;
	reg [1:0]rEstado_Q;
	
	always @(posedge iClk)
	begin
		rValorEstado_Q <= rValorEstado_D;
	end
	
	always @*
	begin
		case (rEstado_Q)
		2'd0: //primer estado
		begin 
			if (!iRestart and !Pause)
			begin
				rEstado_D = 2'd1;
			end
			else
			begin
			
			end
			rValorEstado_D = 2'd0;
			
		end
	   2'd1://segundo estado
		begin
			if (!iRestart and !Pause)
			begin
				rEstado_D = 2'd2;
			end
			else if (iRestart)
			begin
				rEstado_D = 2'd0;
			end
		end
		2'd2: //tercer estado
		begin
			if(iPause)
			begin
				rEstado_D = 2'd0;
			end
			else
			begin
				rEstado_D = rEstado_Q;
			end
			rValorEstado_D = 2'd2;
		end
		default:
		begin
			rEstado_D = 2'd0;
			rValorEstado_D = 2'd0;
		end
		endcase
	end
	
	
	end
	
	
	endmodule
	