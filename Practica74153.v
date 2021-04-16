module Practica74153
   (
	input iC0,
	input iC1,
	input iC2,
	input iC3,
	input iA,
	input iB,
	output oY
	);

	
	
assign oY=((iC0&~iA&~iB)|(iA&~iB&iC1)|(~iA&iC2&iB)|(iC3&iA&iB));
endmodule	
	