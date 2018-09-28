// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
//Testbench 1 para el decodificador de 4 bit
module tb1();
  
	// Inputs
  reg [31:0] vector, errores;
  	reg [11:0] vectores_prueba[100:0]; //Método de selfchecking Testbench con vectores
  	reg clk, rst; // Variable de Clock y reset
  	reg [3:0] A;
  	reg [7:0] comparacion;
  	
   	// Outputs
  	wire [7:0] B;
  
   	// Instantiate the Unit Under Test (UUT)
  	deco4 uut(.A(A),.B(B)); // uut o dut
               
 	//Clock manual
  	always
    begin
    	clk=1; #5; clk=0; #5;//10ns
    end
  
  	initial begin
 		$readmemb("comparacion.tv", vectores_prueba);
     	//Extrae los vectores de comparacion y los inserta en el registro
    	vector=0; //Numero del vector que esta comparando
      	errores=0; //Cantidad de errores encontrados
    	rst = 1;#30;rst=0;//Reset manual 
  	end
  
  	//Se asignan las entradas y salidas esperadas
  	always @(posedge clk)
    begin
      #5; {A,comparacion} = vectores_prueba[vector];
    end
  
  	//Comparacion de salidas con salidas esperadas
  	always @(negedge clk)
    if(~rst)  
    	begin
          if(B !==comparacion)
        		begin
                  $display("Error en la entrada binaria: %b",{A});
                  $display(" El número es %b y debería ser %b ", B,comparacion);
          		  errores = errores + 1;
        		end
        		vector=vector+1;
        		if(vectores_prueba[vector] === 12'bx)
          			begin
                      $display("Numero de errores:%d" ,errores);
            			$finish;
          			end
      	end

endmodule
  