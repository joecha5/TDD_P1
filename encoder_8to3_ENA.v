
module encode8a3(
    input [7:0] in,    // Entradas del codificador
    input ena,        // Enable
    output [2:0] sel  // Salidas del codificador
);

  assign sel[2] = (in[4] | in[5] | in[6] | in[7]) & ena;
  assign sel[1] = (in[2] | in[3] | in[6] | in[7]) & ena;
  assign sel[0] = (in[1] | in[3] | in[5] | in[7]) & ena;

endmodule

