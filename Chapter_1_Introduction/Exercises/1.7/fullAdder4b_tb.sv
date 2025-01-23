module fullAdder4b_tb;
    logic  [3:0] a;
    logic  [3:0] b;
    logic        carry_in;
    logic  [3:0] sum;
    logic        carry_out;

    fullAdder4b dut(.*);

    initial begin
        $dumpfile("fullAdder4b.vcd");
        $dumpvars(0, fullAdder4b_tb);
        for (int k = 0; k < 2; k++) begin
            carry_in = k;
            for (int i = 0; i < 16; i++) begin
                a = i;
                #1;
                for (int y = 0; y < 16; y++) begin
                    b = y;
                    #1;
                    $monitor("Time=%t a=%b b=%b carry_in=%b carry_out=%b sum=%b",$time, a, b, carry_in, carry_out, sum);
                end
            end
        end
        #544 $finish;
    end
endmodule: fullAdder4b_tb;