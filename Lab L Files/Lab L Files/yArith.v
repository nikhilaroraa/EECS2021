module yArith(z, cout, a, b, ctrl);
    output [31:0] z;
    output cout;
    input [31:0] a, b;
    input ctrl;
    wire[31:0] notB, tmp;
    wire cin;

    not c_not[31:0](notB, b);
    yMux #(.SIZE(32)) my_mux[31:0](tmp, b, notB, ctrl);
    assign cin = ctrl;
    yAdder my_add[31:0](z, cout, a, tmp, cin);
endmodule
