module labL;
    reg cin;
    reg signed [31:0] a, b, expect;
    wire [31:0] z;
    wire cout;

    yAdder my_add[31:0](z, cout, a, b, cin);

    initial begin
        repeat (10)
        begin
            a = $random;
            b = $random;
            cin = 0;
            expect = a + b + cin;
            #1;

            if (expect === z)
                $display("PASS: a=%b b=%b c=%b z=%b", a, b, cin, z);
            else
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, cin, z);
        end
    $finish;
    end
endmodule
