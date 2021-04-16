module Counter_Jhnson(
	input iClk,
	output [3:0]oSalida

);

 reg [3:0]rCount_D;
 reg [3:0]rCount_Q;
 reg rPulso_D = 1'b0;
 reg rPulso_Q;
 
 assign oSalida = rCount_Q;
 
 always @ (posedge iClk)
 begin 
	rPulso_Q <= rPulso_D;
	rCount_Q <= rCount_D;
 end
 
always @ *
begin 
		rPulso_D = rPulso_Q + 1'd1;
		
		if( rPulso_Q == 4'd0 )
		begin
			rCount_D = 4'b0000;
		end
		else if( rPulso_Q == 4'd1 )
		begin 
			rCount_D = 4'b1000;
		end
		else if( rPulso_Q == 4'd2 )
		begin 
			rCount_D = 4'b1100;
		end
		else if( rPulso_Q == 4'd3 )
		begin 
			rCount_D = 4'b1110;
		end
		else if( rPulso_Q == 4'd4 )
		begin 
			rCount_D = 4'b1111;
		end
		else if( rPulso_Q == 4'd5 )
		begin 
			rCount_D = 4'b0111;
		end
		else if( rPulso_Q == 4'd6 )
		begin 
			rCount_D = 4'b0011;
		end
		else if( rPulso_Q == 4'd7 )
		begin 
			rCount_D = 4'b0001;
		end
		
	end
	

endmodule	
		
		