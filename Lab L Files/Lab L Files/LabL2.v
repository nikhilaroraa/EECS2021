module labL;
    reg c;
    reg [1:0] a, b, expect;
    wire [1:0] z;
    integer i, j, k;

    yMux2 mine[1:0](z, a, b, c);

    initial begin
        repeat (10)
        begin
            i = $random % 4;
            j = $random % 4;
            k = $random % 2;
            a = i; b = j; c = k;
            expect[0] = (a[0] & ~c) | (b[0] & c);
            expect[1] = (a[1] & ~c) | (b[1] & c); 
            #1; 

            if (expect === z)
                $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
            else
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
        end
    $finish;
    end
endmodule
