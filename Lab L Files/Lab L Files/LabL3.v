module labL;
    reg c;
    reg [31:0] a, b, expect;
    wire [31:0] z;
    integer i;

    yMux #(.SIZE(32)) my_mux[31:0](z, a, b, c);

    initial begin
        repeat (10)
        begin
            a = $random;
            b = $random;
            c = $random % 2;
            for (i = 0; i < 32; i = i + 1)
            begin
                expect[i] = ((a[i] & ~c) + (b[i] & c));
            end
            #1;

            if (expect === z)
                $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
            else
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
        end
    $finish;
    end
endmodule
