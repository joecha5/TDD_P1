`timescale 1ns / 1ps

module mux8_1_ENA (
    output reg Output,  
    input [7:0] IN,
    input [2:0] Sel,
    input ENA,
    input CLK
);

always @(posedge CLK) begin
    if (ENA) begin
        case (Sel)
            3'b000 : Output = IN[0];
            3'b001 : Output = IN[1];
            3'b010 : Output = IN[2];
            3'b011 : Output = IN[3];
            3'b100 : Output = IN[4];
            3'b101 : Output = IN[5];
            3'b110 : Output = IN[6];
            3'b111 : Output = IN[7];
            default: Output = 1'bz; 
        endcase
    end else begin
        Output = 1'bz; 
    end
end

endmodule
