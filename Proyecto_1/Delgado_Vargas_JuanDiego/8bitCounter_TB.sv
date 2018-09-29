//Date: 04-09-2018
//Engineer(student): Juan Diego Delgado Vargas
// Design Name: Up/Down 8 bit counter. 
// Module Name: testbench.sv
// Project Name: Short Project I
// Description: Verifies the correct function of the 8 bit up and down counter by self-checking technique. 

`timescale 1ns/1ps 

module up_down_counter_TB();
  
  reg clk,reset,up_down;
  reg [7:0] out_expected;//Output given a certain input
  wire [7:0] out_p;
  
  //DUV instantiation
  up_down_counter DUV(
    .clk(clk),
    .up_down(up_down),
    .reset(reset),
    .out(out_p)
  );
  
  //Clock generator
   always
     begin
       clk=1; #5; clk=0; #5;
     end
       
   //Variables inizialization
  initial
    begin
      up_down=1;out_expected = 8'b11111111;
      reset = 1; #1; reset = 0;
    end
  
  always @(posedge clk)
    if(up_down==1)
      if(out_p==8'b11111111)
        begin
          up_down = 0; 
          out_expected = 8'b11111110;
        end
      else
        begin //starts counting towards up
          out_expected=out_expected+8'b1;
        end
    else
      begin
        out_expected=out_expected-8'b1;
        if(out_p==8'b0000000) //starts counting towards down
          begin
            $display("Test completed");
            $finish;
          end
        
      end
        
  always @(negedge clk)
    if(~reset)
      begin //Compares the outputs
        if(out_p == out_expected)
          begin //Display the outputs
            $display("Up_Down = %b",{up_down});
            $display("Counter's output= %b",{out_p});
            $display("Output Expected=%b",{out_expected});
          end
        else 
          begin //Displays an error, if there is one
            $display("ERROR = %b",{out_p});
            $display(" Out_Expected = %b",{out_expected});
            $finish;
          end
      end
    
endmodule 

  