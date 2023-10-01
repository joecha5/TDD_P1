`timescale 1ns / 1ps

module tb_mux8_1_ENA;

    reg [7:0] IN;
    reg [2:0] Sel;
    reg ENA;
    reg CLK;
    wire Output;

    mux8_1_ENA uut (
        .Output(Output),
        .IN(IN),
        .Sel(Sel),
        .ENA(ENA),
        .CLK(CLK)
    );

    initial begin
        // Clock Generation
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        // Test for valid values
        $display("Testing valid values...");
        ENA = 1;
        IN = 8'b10101010;
        Sel = 3'b000; #10; assert(Output == IN[0]);
        Sel = 3'b001; #10; assert(Output == IN[1]);
        Sel = 3'b010; #10; assert(Output == IN[2]);
        Sel = 3'b011; #10; assert(Output == IN[3]);
        Sel = 3'b100; #10; assert(Output == IN[4]);
        Sel = 3'b101; #10; assert(Output == IN[5]);
        Sel = 3'b110; #10; assert(Output == IN[6]);
        Sel = 3'b111; #10; assert(Output == IN[7]);
        $display("Valid values test passed!");

        // Test for invalid values
        $display("Testing invalid values...");
        Sel = 3'b010; IN = 8'b00000000; #10; assert(Output != 1'bz);
        Sel = 8; #10; assert(Output == 1'bz);
        $display("Invalid values test passed!");

        // Test for high impedance
        $display("Testing high impedance...");
        ENA = 0;
        Sel = 3'b010; #10; assert(Output == 1'bz);
        $display("High impedance test passed!");

        // Test for corner values
        $display("Testing corner values...");
        ENA = 1;
        Sel = 3'b000; IN = 8'b11111111; #10; assert(Output == IN[0]);
        Sel = 3'b111; IN = 8'b00000000; #10; assert(Output == IN[7]);
        $display("Corner values test passed!");

        $finish;
    end

    task assert(output logic condition);
        if (!condition) begin
            $display("Test failed at time %t", $time);
            $finish;
        end
    endtask

endmodule
