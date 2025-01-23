### 1.5 What are the 4-valued logic characteristics of a 2-input NOR gate (as used in SystemVerilog)? Write a SystemVerilog module and testbench to produce a 4-valued truth table. Use a `$display` statement to print each line of the truth table.

#### Note:

`$monitor` considers gate propagation delays.

`$display` does not consider gate propagation delays.

#### What is a 4-valued logic?
> In SystemVerilog, there are four values that a signal can take: 0, 1, X, and Z. X represents an unknown value, and Z represents a high-impedance value.

#### NOR Gate definition:
> The NOR gate is a digital logic gate that implements logical NOR - it behaves according to the truth table to the right. A HIGH output (1) results if both the inputs to the gate are LOW (0); if one or both input is HIGH (1), a LOW output (0) results. It is the opposite of the OR gate.
```sv
module nor2
(
    input a, b,
    output c
);
    assign c = ~(a | b);
endmodule: nor2;
```

#### Solution:
```sv
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
```

Truth table:

```
Time= 10 a=0 b=0 c=1
Time= 20 a=0 b=1 c=0
Time= 30 a=1 b=0 c=0
Time= 40 a=1 b=1 c=0
Time= 50 a=x b=0 c=x
Time= 60 a=0 b=x c=x
Time= 70 a=x b=1 c=0
Time= 80 a=1 b=x c=0
Time= 90 a=x b=x c=x
Time=100 a=z b=0 c=x
Time=110 a=0 b=z c=x
Time=120 a=z b=1 c=0
Time=130 a=1 b=z c=0
Time=140 a=z b=z c=x

```

#### P.S.
In case of `$monitor`, testbench will look like this:
```sv
`timescale 1ns/1ns

module nor2_tb();
    logic a, b, c;
    nor2 dut(.*);
    initial begin
        for (int i = 0; i < 4; i++) begin
            #1 {a, b} = i;
            $monitor("Time=%t a=%b b=%b c=%b", $time, a, b, c);
        end
        #4 $finish;
        ...
    end

endmodule: nor2_tb;
```