`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR_Verificación Funcional de Circuitos Integrados
// Engineer: Gustavo Fernández Masís
// 
// Create Date: 09/08/2018 
// Design Name:  Testbench Contador Up/Down de 8 bits
// Module Name:  Testbench_Contador
// Project Name: Testbench_Proyecto 1_Verificación
// Target Devices: -----
// Tool versions: 2.0
// Description: -----
//
//////////////////////////////////////////////////////////////////////////////////

module Testbench_Contador();
  reg reset, enable, modo_UpDown;
  reg [7:0] salida;
  reg [7:0] check = 0;
  logic clk = 0;
  
  contador DUT (
    .reset(reset),
    .enable(enable),
    .salida(salida),
    .modo_UpDown(modo_UpDown));
  
  always #1 clk = ~clk;
  
  always @(negedge clk or posedge reset)
    
    // Aplicacion de estimulos al Contador en modo descendente y prueba en modo descendente. Se espera que de correcto en todos los casos... 
    
    begin 
      reset = 1; #10;
      reset = 0; #10;
      enable = 1; #10;
      modo_UpDown = 1; #10;
     // modo_UpDown = 0; #5;
      
      if (check != salida)
        $display ("-->Error de diseño! Modo Up/Down. Valor Esperado: %d. Leido: %d", check, salida);
      
      else
        $display ("Correcto Funcionamiento Modo Up/Down. Valor Esperado: %d. Leido: %d", check, salida);
      
      check <= check -1;
      
      if (check == 1)
        $finish;
      
    end
endmodule