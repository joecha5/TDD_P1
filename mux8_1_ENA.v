timescale 1ns / 1ps


module mux8_1_ENA (Output, Sel, I1, I2, I3, I4, I5, I6, I7, I8, Enable);

input [7:0] I1, I2, I3, I4, I5, I6, I7, I8;
input [2:0] Sel; // Línea de selección de 3 bits para seleccionar entre las 8 entradas
input Enable;   // Señal de habilitación

output [7:0] Output;

reg [7:0] Output;

always @ (I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or Sel or Enable)
begin
  if (Enable)
  begin
    case (Sel)
      3'b000 : Output = I1;
      3'b001 : Output = I2;
      3'b010 : Output = I3;
      3'b011 : Output = I4;
      3'b100 : Output = I5;
      3'b101 : Output = I6;
      3'b110 : Output = I7;
      3'b111 : Output = I8;
      default: Output = 8'bzzzzzzzz; // Valor por defecto si la selección no coincide
    endcase
  end
  else
    Output = 8'bzzzzzzzz; // Si la habilitación está desactivada, la salida es indefinida
end

endmodule
