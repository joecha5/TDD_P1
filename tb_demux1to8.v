`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2023 12:19:37
// Design Name: 
// Module Name: tb_demux1to8
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


module tb_demux1to8;

  reg clk;
  reg enable;
  reg [2:0] sel;
  reg din;
  wire [7:0] douts;

  // Instancia del módulo a probar
  demux1to8 uut (
    .clk(clk),
    .enable(enable),
    .sel(sel),
    .din(din),
    .douts(douts)
  );

  // Generador de reloj
  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    enable = 0;
    sel = 3'b000;
    din = 0;
    
    // Números válidos
    #10 enable = 1;
    sel = 3'b000; // Número válido
    #10 sel = 3'b010; // Número válido
    #10 sel = 3'b111; // Número válido
    
    // Números inválidos
    #10 sel = 3'bzzz; // Número inválido (alta impedancia)
    #10 sel = 3'bxxx; // Número inválido (estado desconocido)
    #10 sel = 3'b101 & 3'b010; // Número inválido (operación bit a bit no definida)
    
    // Alta impedancia
    #10 enable = 1;
    sel = 3'bzzz; // Alta impedancia
    
    // Valores esquina
    #10 enable = 0; // Valor esquina (enable deshabilitado)
    sel = 3'b000;
    #10 enable = 1; // Valor esquina (enable habilitado)
    sel = 3'b111;
    
    // Finalizar la simulación
    #10 $stop;
  end

  initial begin
    $monitor("Time: %0dns, enable: %b, sel: %b, din: %b, douts: %b", $time, enable, sel, din, douts);
  end

endmodule
