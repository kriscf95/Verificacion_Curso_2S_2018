//Date: 04-09-2018
//Engineer(student): Juan Diego Delgado Vargas
// Design Name: Up/Down 8 bit counter. 
// Module Name: testbench.sv
// Project Name: Short Project I
// Description: This is an 8 bit up and down counter with a synchronous active high reset. When up_down signal is high, it will counts towards up, with a low signal, it will counts towards down. 

`timescale 1ns/1ps 
module up_down_counter    (
  out      ,  // Output of the counter
  up_down  ,  // up and down control 
  clk      ,  // clock input
  reset       // reset input
  );
  //----------Output Ports--------------
  output [7:0] out;
  //------------Input Ports-------------- 
  input up_down, clk, reset;
  //------------Internal Variables--------
  reg [7:0] out;
  //-------------Code Starts Here-------
  always @(posedge clk)
    if (reset) begin // Active high reset
    out <= 8'b0 ;
    end else if (up_down) begin //up_down high, starts counting towards up
    out <= out + 1;
  end else begin //up_down low, starts starts counting towards down
    out <= out - 1;
  end
  endmodule
