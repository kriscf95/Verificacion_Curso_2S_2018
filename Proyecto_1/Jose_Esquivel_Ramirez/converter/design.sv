`timescale 1ns/1ps

module converter(
  num_in,
  num_out
);
  
  input[3:0] num_in;
  output reg [7:0] num_out;
  always @*
    case (num_in)
		4'b0000://0
			num_out = 8'b00000000;
		4'b0001://1
			num_out = 8'b00000001;
		4'b0010://2
			num_out = 8'b00000010; 
		4'b0011://3
			num_out = 8'b00000011;
		4'b0100://4
			num_out = 8'b00000100;
		4'b0101://5
			num_out = 8'b00000101;  
		4'b0110://6
			num_out = 8'b00000110;
		4'b0111://7
			num_out = 8'b00000111;
		4'b1000://8
			num_out = 8'b00001000;
		4'b1001://9
			num_out = 8'b00001001;
		4'b1010://10
			num_out = 8'b00010000; 
		4'b1011://11
			num_out = 8'b00010001;
		4'b1100://12
			num_out = 8'b00010010;
		4'b1101://13
			num_out = 8'b00010011;
		4'b1110://14
			num_out = 8'b00010100;
		4'b1111://15
			num_out = 8'b00010101;
endcase
 
endmodule