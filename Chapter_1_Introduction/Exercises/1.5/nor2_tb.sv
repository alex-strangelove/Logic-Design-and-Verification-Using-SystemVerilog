`timescale 1ns/1ns

module nor2_tb();
    logic a, b, c;
    nor2 dut(.*);
    initial begin
        // Test known states
        for (int i = 0; i < 4; i++) begin
            {a, b} = i;
            #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        end

        // X states
        {a, b} = 2'bX0;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'b0X;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'bX1;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'b1X;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'bXX;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);

        // Z states
        {a, b} = 2'bZ0;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'b0Z;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'bZ1;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'b1Z;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        {a, b} = 2'bZZ;
        #10 $display("Time=%t a=%b b=%b c=%b", $time, a, b, c);

        #10 $finish;
    end

endmodule: nor2_tb;