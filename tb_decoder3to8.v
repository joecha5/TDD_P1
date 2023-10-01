`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2023 12:02:47
// Design Name: 
// Module Name: tb_decoder3to8
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


module tb_decoder3to8;

  reg [2:0] sel;
  reg ena;
  wire [7:0] out;

  // Instancia del módulo a probar
  decoder3to8 uut (
    .sel(sel),
    .ena(ena),
    .out(out)
  );

  initial begin
    // Deshabilitar el decodificador
    ena = 0;
    sel = 3'b000;
    #10;
    
    // Habilitar el decodificador con entrada válida
    ena = 1;
    sel = 3'b000; // Número válido
    #10;
    
    sel = 3'b010; // Número válido
    #10;
    
    sel = 3'b111; // Número válido
    #10;
    
    // Probar con alta impedancia
    sel = 3'bzzz; // Alta impedancia
    #10;
    
    // Probar con valores esquina
    ena = 0;
    sel = 3'b000; // Valor esquina (ena deshabilitado)
    #10;
    
    ena = 1;
    sel = 3'b111; // Valor esquina (ena habilitado)
    #10;
    
    // Finalizar la simulación
    $stop;
  end

  initial begin
    $monitor("Time: %0dns, ena: %b, sel: %b, out: %b", $time, ena, sel, out);
  end

endmodule
