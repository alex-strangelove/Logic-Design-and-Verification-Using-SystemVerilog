module combinational_circuit_tb;
    logic A, B, F;
    combinational_circuit dut(.*);
    initial begin
        $monitor("Time=%t A=%b B=%b F=%b", $time, A, B, F);
        A= 0;
        B = 1;
        #15 A=1;
        B = 0;
        #15 $finish;
    end
endmodule:combinational_circuit_tb;