module Debouncing(
     input iClk,
	  input iSignal,
	  output oS 
	  );
	  
reg rState_Q; 
reg rState_D;

reg [3:0]rSignal_D;
reg [3:0]rSignal_Q;

reg [2:0]Count_Q = 4'd0;
reg [2:0]Count_D = 4'd0;
	
assign oS = rState_Q;	

always @ (posedge iClk)
begin
	rState_Q <= rState_D;
	
	if(Count_Q < 4)
	begin
		rSignal_D[Count_D] <= iSignal;
	end
	else
	begin
		Count_D = 4'd0;
	end
	Count_D = Count_Q + 4'd1;
	
	rSignal_Q <= rSignal_D;
end  
	  
always @ *
 
if (rSignal_Q == 4'd0)
   begin
		rState_D = 1'd0;
   end 
else if (rSignal_Q == 4'd15)
	begin
		rState_D = 1'd1;
	end 
	else
	begin 
		rState_D = rState_Q; 
	end 
endmodule 
