`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 12:28:35
// Design Name: 
// Module Name: decoder3to8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder3to8(
    input [2:0] sel, 
    input ena,    // Entradas del decodificador
    output [7:0] out    // Salidas del decodificador
);

  wire na, nb, nc;

  assign na = ~sel[2];
  assign nb = ~sel[1];
  assign nc = ~sel[0];

  assign out[0] = na & nb & nc & ena; // 000
  assign out[1] = na & nb & sel[0]  & ena; // 001
  assign out[2] = na & sel[1]  & nc & ena; // 010
  assign out[3] = na & sel[1]  & sel[0]  & ena; // 011
  assign out[4] = sel[2]  & nb & nc & ena; // 100
  assign out[5] = sel[2]  & nb & sel[0]  & ena; // 101
  assign out[6] = sel[2]  & sel[1]  & nc & ena; // 110
  assign out[7] = sel[2]  & sel[1]  & sel[0]  & ena; // 111

endmodule
