module labK;
    reg a, b, flag, c, d;
    wire notOutput, lowerInput, tmp, z;
    not my_not(notOutput, b);
    and my_and(z, a, lowerInput);
    assign lowerInput = notOutput;
    initial
    begin
    c = 0; d = 1;
    flag = $value$plusargs("a=%b", a);
    if (flag === 0)
        $display("Missing input for the value a");
    else
    begin
        flag = $value$plusargs("b=%b", b);
        if (flag === 0)
            $display("Missing input for the value b");
        else
        begin
            #1;
            $display("a=%b b=%b z=%b", a, b, z);
        end
    end
    $finish;
    end
endmodule
