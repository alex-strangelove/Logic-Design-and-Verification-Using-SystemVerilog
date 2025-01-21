module fourBitTest_tb;

logic a, b, c, d;

fourBitTest fb(.*);

initial begin
    $dumpfile("fourBitTest.vcd");
    $dumpvars(0, fourBitTest_tb);
    for (int i = 0; i < 16; i++) begin
        {a, b, c, d} = i;
        #1;
        $display("Time=%t a=%b b=%b c=%b d=%b",$time, a, b, c, d);
    end
    $finish;
end

endmodule: fourBitTest_tb;