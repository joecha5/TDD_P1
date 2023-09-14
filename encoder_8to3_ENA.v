module encoder_8to3 (
    input [7:0] data_in,
    input enable,
    output [2:0] code_out
);

wire [7:0] and_result;
wire [2:0] priority_encoder_out;

assign and_result = (enable) ? (data_in & 8'b11100000) : 8'b00000000;
assign priority_encoder_out = (enable) ? and_result[7:5] : 3'b000;

assign code_out = priority_encoder_out;

endmodule
