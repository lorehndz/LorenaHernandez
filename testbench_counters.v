`timescale 1ns / 1ps
module testbench_counters();

parameter CLK_PERIOD = 2;

reg Clk_tb;
reg Rst_tb;
reg E_Count_tb;

always #(CLK_PERIOD/2) Clk_tb = ~Clk_tb;

wire [3:0] oC1;
wire [3:0] oC2;
wire [3:0] oC3;
wire [3:0] oC4;

practice3 counter (
	.iClk (Clk_tb),
	.iRst (Rst_tb),
	.E_Count (E_Count_tb),
	.oC1 (oC1),
	.oC2(oC2),
	.oC3(oC3),
	.oC4(oC4)
);

initial
	begin
		Clk_tb = 1'b0;
		#4 Rst_tb = 1'b1;
		E_Count_tb = 1'b0;
		#10 Rst_tb = 1'b0; //16.1ns
		#8 Rst_tb = 1'b1;
		#8 E_Count_tb = 1'b1;
		#50 E_Count_tb = 1'b0;
		#2 E_Count_tb = 1'b1;
		#10 E_Count_tb = 1'b0;
		#2 E_Count_tb = 1'b1;
		#10 E_Count_tb = 1'b0;
		#2 E_Count_tb = 1'b1;
		#10
		#800
		$display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		$stop;
	end
endmodule
