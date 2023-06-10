# RISC-V Assembler
*Credit to [@Chen BAI](http://github.com/baichen318)*

## RV32I assembler with 25 instructions in `asm.c` as follows
* Integer Register-Immediate Instructions:
            slli, xori, srli, srai, ori, andi, lui
* Integer Register-Register Operations:
            sub, sll, xor, srl, sra, or, and
* Unconditional Jumps:
            jalr, jal
* Conditional Branches:
           bne, blt, bge
* Load and Store Instructions:
            lb, lh, lw, sb, sh, sw

## How to implement
```
$ make validate
```
Then, it will show if the ```asm.c``` passes the benchmarks.
