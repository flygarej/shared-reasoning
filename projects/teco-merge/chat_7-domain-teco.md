# Domain Knowledge

## Purpose

Restore the accepted conceptual model of TOPS-20 TECO 540 Q-registers, macro execution, and the TECO substrate used by original TECO EMACS, while preventing inference from later TECO dialects or modern language models.

## Core Model

TOPS-20 TECO is a stream interpreter. Command input, text input, and text output are conceptually distinct streams; the editing buffer is independent of them. `M` executes text currently stored in a Q-register as a nested TECO command stream.

A TECO-10 Q-register is one storage area containing either a numeric value or a text value, never both simultaneously. The current value kind is part of the register state.

The editing buffer is the construction and transformation workspace for text-valued Q-registers. `Xq` transfers a selected buffer range into Q-register `q` and removes that range from the buffer. `Gq` inserts the stored text into the buffer without consuming the Q-register.

The explicit Q-register push-down list saves and restores complete Q-register state. It is separate from interpreter-managed nesting of command streams during `M`.

TECO EMACS builds higher-level facilities from TECO macros, generated libraries, structured Q-register data, and some machine-language primitives. Named EMACS operations such as command lookup and variable handling are macros in local Q-registers, not TECO primitives.

## Execution Model

A command string is collected until doubled command termination executes it; individual command terminators delimit commands within that string.

`Mq`:

1. reads the current text value of Q-register `q`;
2. executes it as a TECO command stream;
3. permits nested `M` calls;
4. resumes the caller’s command stream when the invoked stream is exhausted.

Macro text is interpreted from the Q-register’s current contents. Editing a macro’s text and storing it back changes subsequent execution immediately; no separate compilation stage is required for ordinary Q-register macros.

`[q` copies the complete current state of `q` onto a LIFO push-down list while leaving `q` unchanged and mutable. `]q` replaces `q` with the most recently saved state.

For text transfer:

- `m,nXq` moves the selected buffer text into `q` and deletes the selected buffer range.
- `Gq` copies the text value of `q` into the editing buffer at point.
- Repeated `Gq` does not consume or alter the stored text.

Value replacement:

- `nUq` makes `q` numeric and destroys any prior text value.
- `m,nXq` makes `q` textual and destroys any prior numeric value.

Access is asymmetric:

- textual retrieval from a numeric Q-register fails with `NTQ`;
- numeric retrieval from a textual Q-register returns a large negative implementation-level value rather than a type error.

## Language / Structural Model

Q-register state:

```text
Q-register q
    value-kind ∈ {numeric, text}
    payload    = one value of that kind
```

No simultaneous numeric and text components exist in TECO-10.

Save/restore:

```text
[q  => push(copy(full-state(q))); q unchanged
]q  => q := pop()
```

Macro model:

```text
text in Q-register
    --Mq-->
nested command stream
    --stream exhaustion-->
resume caller
```

Self-modification model:

```text
Q-register text
    --Gq-->
editing buffer
    --ordinary editing-->
modified command text
    --Xq-->
same or another Q-register
    --Mq-->
execution of modified definition
```

TECO EMACS naming conventions:

```text
M.Mname$  = execute local Q-register .M, which resolves a named command
M.Vname$  = execute local Q-register .V, which manages a named variable
```

Historically, named command lookup used `MMname$`, meaning execution of global Q-register `M`; in the observed EMACS, `M` is a compatibility wrapper delegating to `.M`.

EMACS runtime layers:

```text
raw TECO interpreter
    ├── ordinary Q-register macros
    ├── local EMACS macros such as .M and .V
    ├── structured text-valued runtime objects such as ..Q
    ├── generated .:EJ libraries from .EMACS sources
    └── selected machine-language primitives
```

Keyboard macros are represented in the EMACS-specific command language, not as raw TECO command strings.

## Verified Invariants

- In TOPS-20 TECO 540, a Q-register stores text or a number, but not both.
- `[q` leaves the visible value unchanged.
- Modifying `q` after `[q` does not alter the saved state.
- Nested pushes of the same Q-register restore in strict LIFO order.
- Push/pop restores both payload and value kind across numeric/text replacement.
- `Xq` is destructive to the source buffer range.
- `Gq` is non-destructive to the Q-register.
- `Gq` on a numeric Q-register raises `NTQ`.
- `Qq` on a textual Q-register returns an internal-looking negative number.
- Nested `M` execution composes and returns to its caller.
- Later execution uses a macro’s current Q-register contents.
- `M.M` and `M.V` are executions of local Q-register macros, not TECO primitives.
- EMACS variable names are case-insensitive.
- `..Q` is a substantial structured text value; `FQ..Q` was observed as 1835.
- `.EMACS` files are source libraries; generated runtime libraries use `.:EJ`.
- Some EMACS named commands resolve to machine-language functions rather than TECO macro text.

## Structural Exceptions

TECOC must not be used to infer TECO-10 Q-register semantics:

- TECOC preserves numeric and text components simultaneously.
- TECOC `Xq` copies rather than extracts.
- After numeric assignment, TECOC can still retrieve the prior text value.

TECO-11 and later explicitly support direct text insertion into Q-registers and simultaneous numeric/text storage; these features do not belong to the accepted TOPS-20 TECO 540 model.

`:Gq`, described as typing Q-register text, is not present in TECO-10. `:Qq` must not be inferred to mean text length in this dialect.

`..Q` is confirmed as structured text storage used by EMACS code, but its exact schema and ownership of all named commands/variables are unresolved.

## Open Questions

- Exact internal representation of textual Q-register values and the large negative number returned by numeric access.
- Exact parser/runtime state preserved across nested `M` execution.
- Exact structure and role of `..Q`.
- Exact runtime placement and representation of command bodies loaded from `.:EJ` libraries.
- Exact relationship among EJ pages, indexed Q-register/Q-vector operations, named-command entries, variables, and machine-language dispatch.
- Exact representation and execution path of EMACS keyboard macros.
