module combinational_circuit_tb;
    // Inputs
    logic A, B, C, D, E;
    
    // Outputs
    wire F, G;
    
    // Instantiate the Device Under Test (DUT)
    combinational_circuit dut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G)
    );
    
    // Test stimulus
    initial begin
        for (int i = 0; i < 32; i++) begin
            {A, B, C, D, E} = i;
            #10;
            $display("Test %d: A=%b B=%b C=%b D=%b E=%b | F=%b G=%b",i,  A, B, C, D, E, F, G);
        end
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("combinational_circuit.vcd");
        $dumpvars(0, combinational_circuit_tb);
    end

endmodule