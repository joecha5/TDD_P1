`timescale 1ns / 1ps

module tb_encode8a3;

  reg [7:0] in;
  reg ena;
  wire [2:0] sel;

  // Instancia del módulo a probar
  encode8a3 uut (
    .in(in),
    .ena(ena),
    .sel(sel)
  );

  initial begin
    // Deshabilitar el codificador
    ena = 0;
    in = 8'b0000_0001;
    #10;
    
    // Habilitar el codificador con entrada válida
    ena = 1;
    in = 8'b0000_0001; // 000
    #10;
    
    in = 8'b0000_0100; // 010
    #10;
    
    in = 8'b1000_0000; // 111
    #10;
    
    // Probar con múltiples bits de entrada activos (inválido)
    in = 8'b0000_0011; // Inválido
    #10;
    
    // Probar con alta impedancia
    in = 8'bzzzz_zzzz; // Alta impedancia
    #10;
    
    // Probar con todos los bits de entrada activos (inválido)
    in = 8'b1111_1111; // Inválido
    #10;
    
    // Probar con todos los bits de entrada inactivos (inválido)
    in = 8'b0000_0000; // Inválido
    #10;
    
    // Finalizar la simulación
    $stop;
  end

  initial begin
    $monitor("Time: %0dns, ena: %b, in: %b, sel: %b", $time, ena, in, sel);
  end

endmodule
