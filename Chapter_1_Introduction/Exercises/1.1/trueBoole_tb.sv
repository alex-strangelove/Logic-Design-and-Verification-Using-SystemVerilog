`timescale 1ns/100ps 

module trueBoole_tb;
 
logic f;
logic a, b, c;

trueBoole dut (.*);

initial begin
    $dumpfile("trueBoole.vcd");
    $dumpvars(0, trueBoole_tb);

    // Test all possible input combinations
    for (int i = 0; i < 8; i++) begin
        {a, b, c} = i;
        #10;
        $display("Time=%0t a=%b b=%b c=%b f=%b", $time, a, b, c, f);
    end

    $finish;
end

endmodule: trueBoole_tb