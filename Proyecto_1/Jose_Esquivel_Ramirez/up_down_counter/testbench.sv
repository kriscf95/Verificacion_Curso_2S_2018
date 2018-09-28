// Code your testbench here
// or browse Examples
module tb_counter();
  
//Entradas
  reg up_down;
  reg clk;
  reg rst;
  
//Salidas  
  wire [7:0] count;
  
//Para comprobar que el contador funcione
  
  int counter_check = 0;
  
//Instanciacion
  up_down_counter dut(
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
  );
    
//Aplicacion de estimulos
  initial
    begin
      #10;
      clk = 1; #10;
      rst = 1'd1; #10;
      clk = 0; #10;
      clk = 1; #10;
      rst = 1'd0; #10;
      up_down = 1;#10;
      $display("-----CUENTA ASCENDENTE-----");
      while (counter_check <= 255)
        begin
          clk = ~clk; #1;
          if (counter_check != count)
            $display("¡ERROR! Esperado:%d  Leido:%d", counter_check,count);
          else
            $display("¡CORRECTO! Esperado:%d  Leido:%d", counter_check, count);
          #10;
          counter_check++;
          clk = ~clk;#10;
        end
      up_down = 0;
      $display("-----CUENTA DESCENDENTE-----");
      while (counter_check >= 0)
        begin
          clk = ~clk; #1;
          if (counter_check != count)
            $display("¡ERROR! Esperado:%d  Leido:%d", counter_check,count);
          else
            $display("¡CORRECTO! Esperado: %d  Leido: %d", counter_check, count);
          #10;
          counter_check--;
          clk = ~clk; #10;
        end
    end
endmodule
  