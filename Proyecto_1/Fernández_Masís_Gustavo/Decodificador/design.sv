`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR_Verificación Funcional de Circuitos Integrados
// Engineer: Gustavo Fernández Masís
// 
// Create Date: 09/08/2018 
// Design Name:  Decodificador de BCD a display de 7 Segmentos
// Module Name:  Decodificador
// Project Name: Proyecto 1_Verificación
// Target Devices: -----
// Tool versions: 1.0
// Description: -----
//
//////////////////////////////////////////////////////////////////////////////////

module Decodificador (in, out);
  input [3:0]in;
 // output AN0;
  output [6:0]out; 
  
  assign out = 
    (in==4'b0000) ? 7'b1000000: //0
    (in==4'b0001) ? 7'b1111001: //1
    (in==4'b0010) ? 7'b0100100: //2
    (in==4'b0011) ? 7'b0110000: //3
    (in==4'b0100) ? 7'b0011001: //4
    (in==4'b0101) ? 7'b0010010: //5
    (in==4'b0110) ? 7'b0000010: //6
    (in==4'b0111) ? 7'b1111000: //7
    (in==4'b1000) ? 7'b0000000: //8
    (in==4'b1001) ? 7'b0011000: //9
    (in==4'b1010) ? 7'b0001000: //A
    (in==4'b1011) ? 7'b0000011: //B
    (in==4'b1100) ? 7'b1000110: //C
    (in==4'b1101) ? 7'b0100001: //D
    (in==4'b1110) ? 7'b0000110: //E
    (in==4'b1111) ? 7'b0001100: 7'b1111111; //F
  
  //assign AN0= 1b'1;
  
endmodule