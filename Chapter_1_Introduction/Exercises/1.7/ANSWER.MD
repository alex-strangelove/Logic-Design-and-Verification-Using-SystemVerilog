### 1.7 A full adder is a logic circuit that will add two binary input bits and a carry-in, and produce a sum and carry-out bit. The sum is the XOR of the three bits, and the carry-out is TRUE when two or more of the inputs are 1.
- A) Write a module called fullAdd with the three inputs and two outputs. Use primitive
gates.
- B) Instantiate this module four times inside a 4-bit full adder module. The inputs to this
module should be the 4-bit vectors a and b, and the scalar carryIn. The outputs should be
the 4-bit sum and the scalar carryOut. Connect the instantiated modules' ports so that
carry out of each stage connect to the carry in or the next higher stage.
- C) Extend Problem 1.2 to produce the nine input bits to show that the full adder works
correctly.

Answer: 
A) The full adder module is as follows:
```verilog
module fullAdd
(
    input  a, b, carry_in,
    output sum, carry_out
);
    xor (sum, a, b, carry_in);
    and (a_and_b, a, b);
    and (a_and_cin, a, carry_in);
    and (b_and_cin, b, carry_in);
    or  (carry_out, a_and_b, a_and_cin, b_and_cin);
endmodule: fullAdd
```

B) The 4-bit full adder module is as follows:
```verilog
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
```

C) The testbench for the 4-bit full adder is as follows:
```verilog
module fullAdder4b_tb;
    logic        carry_in;
    logic  [3:0] sum;
    logic        carry_out;
    logic  [9:0] count;

    fullAdder4b dut(.a(count[7:4]), .b(count[3:0]), .carry_in(count[8]), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("fullAdder4b.vcd");
        $dumpvars(0, fullAdder4b_tb);

        for (count = 0; count <= 10'h200; count++)
            #1 if ({carry_out, sum} != (count[7:4] + count[3:0] + count[8]))
                $display("Error: %d != %d + %d + %d", {carry_out, sum}, count[7:4], count[3:0], count[8]);
    end
endmodule: fullAdder4b_tb;
```

Testbench ensures that the full adder works correctly by comparing the sum and carry out with the expected values for all possible inputs.