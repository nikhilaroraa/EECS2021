s0: DC "Rectangle area calculation. \0"
s1: DC "Enter a:\0"
s2: DC "Enter b:\0"
s3: DC "Rectangle area="
addi x5, x0, s0
ecall x0, x5, 4
addi x5, x0, s1
ecall x1, x5, 4
ecall x6, x0, 5
addi x5, x0, s2
ecall x1, x5, 4
ecall x7, x0, 5
mul x6, x6, x7
addi x5, x0, s3
ecall x1, x5, 4
ecall x1, x6, 0
