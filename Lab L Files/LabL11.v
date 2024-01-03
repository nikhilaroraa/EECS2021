module labL;
    reg signed [31:0] a, b;
    reg [31:0] expect;
    reg [2:0] op, tmp;
    wire ex;
    wire [31:0] z, zAnd;
    reg ok, flag, zero;
    integer i;

    and ab_and[31:0](zAnd, a, b);
    yAlu mine(z, ex, a, b, op);

    initial
    begin
        repeat (10)
        begin
            a = $random;
            b = $random;
            tmp = $random % 2;
            if (tmp == 0)
            begin
                $display("b will now equal a");
                b = a;
            end
            flag = $value$plusargs("op=%d", op);

            if (op == 3'b000)
            begin
                $display("and");
                for (i = 0; i < 32; i++)
                begin
                    expect[i] = a[i] & b[i];
                end
            end
            else if (op == 3'b001)
            begin
                $display("or");
                for (i = 0; i < 32; i++)
                begin
                    expect[i] = a[i] | b[i];
                end
            end
            else if (op == 3'b010)
            begin
                $display("addition");
                expect = a + b;
            end
            else if (op == 3'b110)
            begin
                $display("subtraction");
                expect = a + ~b + 1;
            end
            else if (op == 3'b111)
                expect = (a < b) ? 1 : 0;
            else
            begin
                $display("not supported operation");
                expect = 0;
            end
            zero = (expect == 0) ? 1 : 0;
            #1;

            $display("expected=%b", expect);
            
            ok = 0;
            if (expect === z)
                ok = 1;

            if (ok)
            begin
                $display("PASS: a=%b b=%b op=%b z=%b", a, b, op, z);
                $display("correct zero flag value=%b", zero);
                if (zero && zero === ex)
                    $display("PASS: exception of zero flag raised correctly. zero=%b", ex);
                else if (zero && zero !== ex)
                    $display("FAIL: exception of zero flag not raised when it should be raised. zero=%b", ex);
                else if (!(zero) && zero !== ex)
                    $display("FAIL: exception of zero flag raised incorrectly. zero=%b", ex);
                else if (!(zero) && zero === ex)
                    $display("PASS: exception of zero flag is not raised when it should not be raised. zero=%b", ex);
            end
            else
                $display("FAIL: a=%b b=%b op=%b z=%b", a, b, op, z);
        end
    $finish;
    end
endmodule
