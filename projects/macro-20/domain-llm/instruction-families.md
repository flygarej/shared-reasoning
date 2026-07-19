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

