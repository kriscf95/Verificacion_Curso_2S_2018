//Date: 04-09-2018
//Engineer(student): Juan Diego Delgado Vargas
// Design Name: 4 bits Decoder testbench. 
// Module Name: Decoder_TB
// Project Name: Short Project I
// Description: This is a 4 bits decoder testbench with an output adressed to a 7 segments. It verifies the correct function of the outputs given an input, by self-checking technique.  


`timescale 1ns/1ps

module Deco_TB();
    //Variables definition
    reg [3:0] binary_in;
    wire [6:0] decoder_out;
    reg enable;

    //DUV instantiation
    Deco DUV(.binary_in(binary_in), .decoder_out(decoder_out), .enable(enable));
  	
  	initial //Compares the decoder's output with the expected output given some input 
      begin
        enable=1;
        binary_in = 4'b0000; #10; 
        if (decoder_out !== 7'b0111111) 
          begin 
            $display("Failed."); 
          end 
        
        enable=1;
        binary_in = 4'b0001; #10;
        if (decoder_out !== 7'b0000110)
          begin 
            $display("Failed.");
          end
        
        enable=1;
        binary_in = 4'b0010; #10;
        if (decoder_out !== 7'b1011011)
          begin
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b0011; #10;
        if (decoder_out !== 7'b1001111)
          begin 
            $display("Failed.");
          end
        
        enable=1;
        binary_in = 4'b0100; #10;
        if (decoder_out !== 7'b1100110)
          begin 
            $display("Failed.");
          end
        
        enable=1;
        binary_in = 4'b0101; #10; 
        if (decoder_out !== 7'b1101101)
          begin $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b0110; #10; 
        if (decoder_out !== 7'b1111101)
          begin 
            $display("Failed.");
          end
        
        enable=1;
        binary_in = 4'b0111; #10;
        if (decoder_out !== 7'b0000111)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1000; #10; 
        if (decoder_out !== 7'b1111111)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1001; #10; 
        if (decoder_out !== 7'b1100111)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1010; #10; 
        if (decoder_out !== 7'b1110111)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1011; #10;
        if (decoder_out !== 7'b1111100)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1100; #10; 
        if (decoder_out !== 7'b0111001)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1101; #10; 
        if (decoder_out !== 7'b1011110)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1110; #10; 
        if (decoder_out !== 7'b1111001)
          begin 
            $display("Failed."); 
          end
        
        enable=1;
        binary_in = 4'b1111; #10; 
        if (decoder_out !== 7'b1110001)
          begin 
            $display("Failed."); 
          end
        $display("Test completed");
      end

endmodule

 