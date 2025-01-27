module fullAdder4b_tb;
    logic        carry_in;
    logic  [3:0] sum;
    logic        carry_out;
    logic  [9:0] count;

    fullAdder4b dut(.a(count[7:4]), .b(count[3:0]), .carry_in(count[8]), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("fullAdder4b.vcd");
        $dumpvars(0, fullAdder4b_tb);

        for (count = 0; count <= 10'h200; count++)
            #1 if ({carry_out, sum} != (count[7:4] + count[3:0] + count[8]))
                $display("Error: %d != %d + %d + %d", {carry_out, sum}, count[7:4], count[3:0], count[8]);
    end
endmodule: fullAdder4b_tb;