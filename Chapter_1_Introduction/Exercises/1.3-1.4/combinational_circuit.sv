`timescale 1ns/1ns
`default_nettype none

module combinational_circuit
(
    input A, B, C, D, E,
    output F, G
);
    logic g1, g2, g3, g4, g5, g6, g7, g8;
    
    assign g1 = B ~& C;
    assign g2 = A & g1;
    assign g3 = g2 & g4;
    assign g4 = ~g1;
    assign g5 = g4 ~& D;
    assign g6 = C | E;
    assign g7 = ~g6;
    assign g8 = C ~& g1;
    
    assign F = g3 ^ g5 ^ ^ g7;
    assign G = ~D & ~E & g6 & g8; 
endmodule: combinational_circuit