`timescale 1ns/1ps

module tb_converter();
  reg clk, rst;
  reg [3:0] num_in;
  reg [7:0] num_expected;
  wire [7:0] num_out;
  reg [31:0] vectornum, errors;
  reg [11:0] testvectors[100:0]; //arreglo de vectores
  
  converter dut(
    .num_in(num_in),
    .num_out(num_out)
  );
  
  //Clock
  always
    begin
      clk=1; #5; clk=0; #5;//10ns
    end
  

  
  initial begin
    $readmemb("yexpected.tv", testvectors);//lee los vectores del archivo en binario
    vectornum = 0; errors = 0;//Se inicializa
    rst = 1;#27;rst=0;//Aplica el rst y espera 
  end
  
  //Se asignan las entradas y salidas esperadas
  always @(posedge clk)
    begin
      #1; {num_in, num_expected} = testvectors[vectornum];
    end
  
  //Comparacion de salidas con salidas esperadas
  always @(negedge clk)
    if(~rst)  
      begin
        if(num_out !== num_expected)
        begin
          $display("Error: entrada = %b",{num_in});
          $display("  salida = %b (%b esperado)", num_out, num_expected);
          errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if(testvectors[vectornum] === 12'bx)
          begin
            $display("Pruebas realizadas:%d    Errores encontrados:%d" ,vectornum, errors);
            $finish;
          end
      end
endmodule
