// Estudiante: Luis Guillermo Alvarado Arias
// Carné : 2013115977

//selfchecking testbench del contador
module tb2();
  
//IN & OUT
	reg up_down;
  	reg clk;
  	reg rst; 
  	wire [7:0] cuenta;
  
  	int cuenta2=0;//Comprobador que cuenta dentro del testbench
  
  contador uut(.clk(clk),.rst(rst),.up_down(up_down),.cuenta(cuenta)); //dut o uut
    
  	initial
    begin
      	#10;
      	clk = 1; #10;
      	rst = 1'd1; #10;
      	clk = 0; #10;
      	clk = 1; #10;
      	rst = 1'd0; #10;
      
      
      //Setup para iniciar
      up_down = 1;#10;//Habilita cuenta hacia arriba
      $display("UP 1");//Prueba para la cuenta de UP hasta 151
      while (cuenta2<=150) // Todas las combinaciones posibles
        	begin
          		clk = ~clk; #1; //Negación del clock para simular paso de 1 a 0
              if (cuenta2!= cuenta) //Compara para verificar entre contadores
                $display("Error encontrado %d =! %d   XXXXXX", cuenta2,cuenta);
          		else
                  $display("Cuenta normal:%d=%d",cuenta2, cuenta);
          		#10;
          		cuenta2=cuenta2+1;
              //Suma 1 al contador dentro del testbench para comparar en la siguiente prueba
          		clk = ~clk;#10;
        	end
  
      	#10;
      	clk = 1; #10;
      	rst = 1'd1; #10;
      	clk = 0; #10;
      	clk = 1; #10;
      	rst = 1'd0; #10;
      	cuenta2=0;
      //RESET A MITAD DE CAMINO
      
      up_down = 1;#10;//Habilita cuenta hacia arriba
      $display("***RESET REALIZADO***");
      $display("UP 2");//Prueba para la cuenta de UP hasta 255 después de un reset
      while (cuenta2<=254) // Todas las combinaciones posibles
        	begin
          		clk = ~clk; #1; //Negación del clock para simular paso de 1 a 0
              if (cuenta2!= cuenta) //Compara para verificar entre contadores
                $display("Error encontrado %d =! %d   XXXXXX", cuenta2,cuenta);
          		else
                  $display("Cuenta normal:%d=%d",cuenta2, cuenta);
          		#10;
          		cuenta2=cuenta2+1;
              //Suma 1 al contador dentro del testbench para comparar en la siguiente prueba
          		clk = ~clk;#10;
        	end
      
      
      up_down = 0; // Habilita la cuenta DOWN
      $display("DOWN");
      while (cuenta2 >= 0)
        begin
          clk = ~clk; #1;
          if (cuenta2!= cuenta)
            $display("Error encontrado %d =! %d   XXXXXX",cuenta2,cuenta);
          else
            $display("Cuenta normal:%d=%d",cuenta2, cuenta);
          #10;
          cuenta2=cuenta2-1;
          clk = ~clk; #10;
        end
    end
endmodule
  