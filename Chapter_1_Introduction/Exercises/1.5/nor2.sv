module nor2
(
    input a, b,
    output c
);
    assign c = ~(a | b);
endmodule: nor2;