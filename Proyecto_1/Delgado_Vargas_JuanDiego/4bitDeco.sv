//Date: 04-09-2018
//Engineer(student): Juan Diego Delgado Vargas
// Design Name: 4 bits Decoder. 
// Module Name: 4BDeco
// Project Name: Short Project I
// Description: This is a 4 bits decoder with an output adressed to an 7 segments. It gives a 7 bit combination serie given by an input.     

`timescale 1ns/1ps

  module Deco(
  binary_in, //  4 bit binary input
  decoder_out, //  16-bit  out
  enable        //  Enable for the decoder
  );
  //**********Inputs**********
  input [3:0] binary_in  ;
  input  enable ;
  //**********Outputs********
  output [6:0] decoder_out ;
  //********Internal variables**********  
  reg [6:0] decoder_out;
  
  always @ (enable or binary_in)
  begin
    decoder_out = 0;
    if (enable) begin //Enable high, begin the case condition
      case (binary_in) 
        4'b0000 : decoder_out = 7'b0111111; //0
        4'b0001 : decoder_out = 7'b0000110;//1
        4'b0010 : decoder_out = 7'b1011011;//2
        4'b0011 : decoder_out = 7'b1001111;//3
        4'b0100 : decoder_out = 7'b1100110;//4
        4'b0101 : decoder_out = 7'b1101101;//5
        4'b0110 : decoder_out = 7'b1111101;//6
        4'b0111 : decoder_out = 7'b0000111;//7
        4'b1000 : decoder_out = 7'b1111111;//8
        4'b1001 : decoder_out = 7'b1100111;//9
        4'b1010 : decoder_out = 7'b1110111;//A
        4'b1011 : decoder_out = 7'b1111100;//B
        4'b1100 : decoder_out = 7'b0111001;//C
        4'b1101 : decoder_out = 7'b1011110;//D
        4'b1110 : decoder_out = 7'b1111001;//E
        4'b1111 : decoder_out = 7'b1110001;//F
      endcase
    end
  end
  
  endmodule