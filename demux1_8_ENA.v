timescale 1ns / 1ps

module demux1_8_ENA (Input, Sel, Output1, Output2, Output3, Output4, Output5, Output6, Output7, Output8, Enable);

input Input;     // Entrada que se va a demultiplexar
input [2:0] Sel; // Línea de selección de 3 bits para seleccionar entre las 8 salidas
input Enable;    // Señal de habilitación

output Output1, Output2, Output3, Output4, Output5, Output6, Output7, Output8;

assign Output1 = (Enable && (Sel == 3'b000)) ? Input : 1'b0;
assign Output2 = (Enable && (Sel == 3'b001)) ? Input : 1'b0;
assign Output3 = (Enable && (Sel == 3'b010)) ? Input : 1'b0;
assign Output4 = (Enable && (Sel == 3'b011)) ? Input : 1'b0;
assign Output5 = (Enable && (Sel == 3'b100)) ? Input : 1'b0;
assign Output6 = (Enable && (Sel == 3'b101)) ? Input : 1'b0;
assign Output7 = (Enable && (Sel == 3'b110)) ? Input : 1'b0;
assign Output8 = (Enable && (Sel == 3'b111)) ? Input : 1'b0;

endmodule
