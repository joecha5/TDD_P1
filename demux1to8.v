module demux_1to8 (
    input wire d,       // Entrada de datos
    input wire [2:0] sel, // Señales de selección (3 bits para 8 salidas)
    input wire enable, // Señal de habilitación
    output wire [7:0] y // 8 salidas
);

    // Puertas AND para cada salida
    and gate0(y[0], d, ~sel[2], ~sel[1], ~sel[0], enable);
    and gate1(y[1], d, ~sel[2], ~sel[1],  sel[0], enable);
    and gate2(y[2], d, ~sel[2],  sel[1], ~sel[0], enable);
    and gate3(y[3], d, ~sel[2],  sel[1],  sel[0], enable);
    and gate4(y[4], d,  sel[2], ~sel[1], ~sel[0], enable);
    and gate5(y[5], d,  sel[2], ~sel[1],  sel[0], enable);
    and gate6(y[6], d,  sel[2],  sel[1], ~sel[0], enable);
    and gate7(y[7], d,  sel[2],  sel[1],  sel[0], enable);

endmodule
