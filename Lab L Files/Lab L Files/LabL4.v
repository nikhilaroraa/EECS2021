module labL;
    reg [1:0] c;
    reg [31:0] a, b, d, e, zLo, zHi, expect;
    wire [31:0] z;
    integer i;

    yMux4to1 #(.SIZE(32)) my_mux[31:0](z, a, b, d, e, c);

    initial begin
        repeat (10)
        begin
            a = $random;
            b = $random;
            d = $random;
            e = $random;
            c = $random % 4;
            for (i = 0; i < 32; i = i + 1)
            begin
                zLo[i] = ((a[i] & ~c[0]) + (b[i] & c[0]));
                zHi[i] = ((d[i] & ~c[0]) + (e[i] & c[0]));
                expect[i] = ((zLo[i] & ~c[1]) + (zHi[i] & c[1]));
            end
            #1;

            if (expect === z)
                $display("PASS: a0=%b a1=%b a2=%b a3=%b c=%b z=%b", a, b, d, e, c, z);
            else
                $display("FAIL: a0=%b a1=%b a2=%b a3=%b c=%b z=%b", a, b, d, e, c, z);
        end
    $finish;
    end
endmodule
