# Instruction Families

## Purpose

Capture the grammar behind instruction families.

## MOVE

Grammar: MOV + value transformation + destination variant.

Transformations: blank=copy, N=negate, M=absolute value, S=swap
halfwords.

Destinations: blank=memory→AC, I=immediate operand, M=AC→memory,
S=self/memory variant.

## TEST

Grammar: T + mask source + AC modification + skip condition.

Mask: R/L/D/S. Modification: N/Z/O/C. Skip: blank/N/E/A.

## BOOLEAN

Implements all 16 Boolean functions of two inputs. Variants:
blank=memory operand, I=immediate, M=store memory, B=store both.

## JUMP

JRST family selected by AC field.

AC=1 implements a protected portal entry into privileged code. The portal
instruction itself is the first instruction of a privileged entry area and
dispatches execution to the actual privileged routine.

JSR non-reentrant. JSP reentrant. JFCL test+clear flags. XCT executes
instruction from memory.

## Shift Family

Grammar

Dimension 1

- Logical
- Arithmetic
- Rotate

Dimension 2

- Single-word
- Combined (AC,AC+1)

Resulting family

LSH   LSHC
ASH   ASHC
ROT   ROTC

Generator

The C suffix denotes operation on the concatenated doubleword AC,AC+1.

## Arithmetic Families

Shared destination grammar

(blank)
    memory operand, result to AC

I
    immediate operand

M
    result written to memory

B
    result written to both AC and memory

Families using this grammar

ADD
SUB
IMUL

## Width hierarchy

Arithmetic operations scale by operand width.

IMUL
    one-word product

MUL
    two-word product

DMUL
    four-word product

IDIV
    one-word dividend

DIV
    two-word dividend

DDIV
    four-word dividend
	
## Floating-point grammar

Single precision

F
+
operation
+
optional rounding
+
destination variant

Double precision

DF
+
operation

Operations

AD
SB
MP
DV
