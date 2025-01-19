module trueBoole
    (output logic f,
    input logic a, b, c);

    logic f1, f2, f3, f4, f5;

    nor (f, f1, f2, f5);

    or  (f2, f3, f4, f5);
    not (f1, a);
    xor (f3, a, f1);
    and (f4, f3, c, a, b);
    and (f5, a, c);
endmodule: trueBoole