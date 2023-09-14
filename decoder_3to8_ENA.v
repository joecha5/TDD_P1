module decoder_3to8 (
    input [2:0] code_in,
    input enable,
    output [7:0] data_out
);

wire [7:0] decoder_output;

assign decoder_output = (enable) ? (1 << code_in) : 8'b00000000;
assign data_out = decoder_output;

endmodule
