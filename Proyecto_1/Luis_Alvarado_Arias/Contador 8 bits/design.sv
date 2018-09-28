// Code your design here
//Contador up_down de 8 bits
module contador(cuenta,up_down,clk,rst);
	input up_down; //opcion de UP o DOWN
  	input clk; // Clock
    input rst; // Reset
  output[7:0] cuenta; //salida de la cuenta 
	
  reg[7:0] cuenta;
  
  always @(posedge clk)
    if(rst) 
      	begin
      	cuenta<=8'b0;
    	end 
  	else if (up_down) 
      	begin
      	cuenta<=cuenta+1; // Poner +2 para ver error en testbench
    	end 
  	else begin
      cuenta<=cuenta-1;
    end
  
endmodule