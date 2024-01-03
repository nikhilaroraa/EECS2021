addi sp, x0, 0
addi a0, x0, 5
jal x1, fact
ebreak x0, x0, 0
fact: blt x0, a0, recu
addi a0, x0, 1
jalr x0, 0(x1)
recu: sd x1, -8(sp)
sd a0, -16(sp)
addi sp, sp, -16
addi a0, a0, -1
jal x1, fact
addi sp, sp, 16
ld x1, -8(sp)
ld x5, -16(sp)
mul a0, x5, a0
jalr x0, 0(x1)