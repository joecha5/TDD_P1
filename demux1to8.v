`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 11:49:57
// Design Name: 
// Module Name: demux1to8
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


module demux1to8 (
    input wire clk,       // Reloj
    input wire enable,    // Habilitación
    input wire [2:0] sel, // Señal de selección
    input wire din,       // Dato de entrada
    output reg [7:0] douts // Datos de salida
);
    
    always @(posedge clk) begin
        if (enable) begin
            case (sel)
                3'b000: douts <= 8'b00000001;
                3'b001: douts <= 8'b00000010;
                3'b010: douts <= 8'b00000100;
                3'b011: douts <= 8'b00001000;
                3'b100: douts <= 8'b00010000;
                3'b101: douts <= 8'b00100000;
                3'b110: douts <= 8'b01000000;
                3'b111: douts <= 8'b10000000;
                default: douts <= 8'b00000000;
            endcase
        end else douts <= 8'b00000000;
    end

endmodule
