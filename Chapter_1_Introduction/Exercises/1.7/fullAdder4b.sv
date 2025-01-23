module fullAdd
(
    input  a, b, carry_in,
    output sum, carry_out
);
    xor (sum, a, b, carry_in);
    and (g1, a, b);
    and (g2, g1, carry_in);
    or  (carry_out, g1, g2);
endmodule: fullAdd

module fullAdder4b
(
    input  [3:0] a,
    input  [3:0] b,
    input        carry_in,
    output [3:0] sum,
    output       carry_out
);
    reg sum1, sum2, sum3;
    reg carry1, carry2, carry3;

    fullAdd add1(
        .a(a[0]), .b(b[0]), 
        .carry_in(carry_in), 
        .sum(sum[0]), 
        .carry_out(carry1));

    fullAdd add2(
        .a(a[1]), .b(b[1]), 
        .carry_in(carry1), 
        .sum(sum[1]), 
        .carry_out(carry2));

    fullAdd add3(
        .a(a[2]), .b(b[2]), 
        .carry_in(carry2), 
        .sum(sum[2]), 
        .carry_out(carry3));

    fullAdd add4(
        .a(a[3]), .b(b[3]), 
        .carry_in(carry3), 
        .sum(sum[3]), 
        .carry_out(carry_out));
endmodule: fullAdder4b