`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR_Verificación Funcional de Circuitos Integrados
// Engineer: Gustavo Fernández Masís
// 
// Create Date: 09/08/2018 
// Design Name:  Testbench Decodificador de BCD a display de 7 Segmentos
// Module Name:  Testbench_Decodificador
// Project Name: Proyecto 1_Verificación
// Target Devices: -----
// Tool versions: 1.0
// Description: -----
//
//////////////////////////////////////////////////////////////////////////////////

module Testbench_Decodificador();
  reg clk, reset;
  reg [3:0]in;
  reg [6:0] Out_expected;
  wire [6:0]out;
  reg [31:0] vectornum, errors;
  reg [11:0] testvectors[100:0];
  
 
  integer i;
  
  //Instacia del modulo bajo prueba
  Decodificador DUT(
    .in(in),
    .out(out)
  );
  
 
  // Genera reloj con un periodo de 10 ns
  initial clk = 0;
  always #5 clk = ~clk;
  
  
  // Inicio del Test y carga del vectores
  
  initial // Se ejecutará al inicio una vez
    begin
      $readmemb("expected_Out.tv", testvectors); // Lectura del vector
      vectornum = 0; errors = 0; // Inicialización
      reset = 1; #27; reset = 0; // Aplica un reset y espera 27ns
    end
  
  
  //Asignación de entradas y salidas esperadas
  always @(posedge clk)
    begin
      #1; {in, Out_expected} = testvectors[vectornum];
    end

  
  
  //Aplicación de estímulos en la entradas y comparacion de salidas con salidas esperadas
  always @(negedge clk)
    if(~reset)  
      begin
        if(out !== Out_expected)
        begin
          $display("Error: inputs = %b",{in});
          $display(" outputs = %b (%b exp)", out, Out_expected);
          errors = errors + 1;
        end
        
        //Incrementa el arreglo y lee el sigiente vector
        vectornum = vectornum + 1;
        
        if(testvectors[vectornum] === 12'bx)
          begin
            $display("RESULTADOS DE LA SIMULACION");
            $display("--> Numero de pruebas completadas: %d",vectornum);
            $display("--> Errores detectados: %d", errors);
            $finish;
          end
      end 
  
endmodule
