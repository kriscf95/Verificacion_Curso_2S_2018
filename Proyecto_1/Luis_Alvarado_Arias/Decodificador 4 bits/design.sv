//   ESTUDIANTE: LUIS GUILLERMO ALVARADO ARIAS
//   CARNÉ: 2013115977



// En system verilog ( TOOL --> VCS de Synopsys)
//1) Contador de 8 bits: UP/DOWN		-Reset
// Decodificador de binario (4bits) a un display de 7 segmentos (BCD) 
// DEJAR design.sv siempre como el TOP
//Self-checking Testbench
// $finish
  
`timescale 1ns/1ps //Poner para definir tiempos

module deco4(A,B);
	//Definición de entradas y salidas
	input[3:0] A; //4 bits en binario
  	output reg [7:0] B; //8 bits, 4 bits para cada numero decimal
  	always @*
    case (A)
		4'b0000:B = 8'b00000000;//0
		4'b0001:B = 8'b00000001;//1
		4'b0010:B = 8'b00000010;//2 
		4'b0011:B = 8'b00000011;//3
		4'b0100:B = 8'b00000100;//4
		4'b0101:B = 8'b00000101;//5
		4'b0110:B = 8'b00000110;//6
		4'b0111:B = 8'b00000111;//7
		4'b1000:B = 8'b00001000;//8
		4'b1001:B = 8'b00001001;//9
		4'b1010:B = 8'b00010000;//10
		4'b1011:B = 8'b00010001;//11
		4'b1100:B = 8'b00010010;//12
		4'b1101:B = 8'b00010011;//13
		4'b1110:B = 8'b00010100;//14
		4'b1111:B = 8'b00010101;//15
    endcase
    //Para decodificar a 7 segmentos  
    //4'b0000 : b <= 7'b1111110;//0
    //4'b0001 : b <= 7'b0110000;//1
    //4'b0010 : b <= 7'b1101101;//
    //4'b0011 : b <= 7'b1111001;//3
    //4'b0100 : b <= 7'b0110011;//4
    //4'b0101 : b = 7'b1011011;//5
    //4'b0110 : b = 7'b1011111;//6
    //4'b0111 : b = 7'b1110000;//7
    //4'b1000 : b = 7'b1111111;//8
    //4'b1001 : b = 7'b1111011;//9 
    //4'b1010 : b = 7'b0000000;//A
    //4'b1011 : b = 7'b0000000;//B
    //4'b1100 : b = 7'b0000000;//C
    //4'b1101 : b = 7'b0000000;//D
    //4'b1110 : b = 7'b0000000;//E
    //4'b1111 : b = 7'b0000000;//F
//Para decodificar a 7 segmentos por algebra de Boole        
// assign y[0]=(~a)|(c)&(~b)|~(b|d);  
// assign y[1]=(~b)|(~c)&(~d)|(c)&(d); 
//  assign y[2]=(b)|(~c)|(d); 
// assign y[3]=(~b)&(~d)|(b)&(~c)&(d)|(c)&(~d)|(~a)&(~b)&(c); 
//  assign y[4]=(~b)&(~d)|(c)&(~d);
// assign y[5]=(a)|(b)&(~c)|(~c)&(~d)|(~a)&(b)&(~d); 
// assign y[6]=(a)|(b)&(~c)|(c)&(~b)|(c)&(~d);
endmodule
  
  
 
