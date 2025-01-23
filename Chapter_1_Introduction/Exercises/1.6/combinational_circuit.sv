module combinational_circuit
(
    input A, B,
    output F
);
    assign #1 a_not = ~A;
    assign #1 b_not = ~B;
    assign #3 f1 = B | a_not;
    assign #4 f2 = a_not ~& B;
    assign #5 f3 = b_not ~^ A;
    assign #6 F = f1 & f2 & f3;
endmodule:combinational_circuit;