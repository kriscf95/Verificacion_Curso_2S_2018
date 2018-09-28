`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR_Verificación Funcional de Circuitos Integrados
// Engineer: Gustavo Fernández Masís
// 
// Create Date: 09/08/2018 
// Design Name:  Contador Up/Down de 8 bits
// Module Name:  Contador_UpDown
// Project Name: Proyecto 1_Verificación
// Target Devices: -----
// Tool versions: 2.0
// Description: -----
//
//////////////////////////////////////////////////////////////////////////////////


module contador(clk, reset, enable, salida, modo_UpDown);
  input wire clk, reset, enable, modo_UpDown;
  output reg [7:0] salida;
  
  
  always @(posedge clk or negedge reset) 
    begin 
      if(reset)
        salida = 8'b0;
      
      else if (enable)
        begin 
          if (modo_UpDown)
            salida = salida - 1;
          else
            salida = salida + 1;
        end
      else salida = 8'b0;
    end 
endmodule