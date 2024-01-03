module labL;
    reg ctrl;
    reg signed [31:0] a, b, expect;
    wire [31:0] z;
    wire cout;

    yArith my_arith[31:0](z, cout, a, b, ctrl);

    initial begin
        repeat (10)
        begin
            a = $random;
            b = $random;
            ctrl = $random % 2;
            if (ctrl)
                expect = a + ~b + 1;
            else
                expect = a + b;
            #1;

            if (expect === z)
                $display("PASS: a=%b b=%b c=%b z=%b", a, b, ctrl, z);
            else
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, ctrl, z);
        end
    $finish;
    end
endmodule
