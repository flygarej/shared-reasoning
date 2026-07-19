# Documentation Overview

  --------------------------------------------------------------------------------------------
  Reference           Covers         Reliability    Limitations               Preferred Use
  ------------------- -------------- -------------- ------------------------- ----------------
  Standard TECO       Standard       High           Broader than              Language
  manual (TECOC)      language                      implementation            reference;
                                                                              verify
                                                                              experimentally

  TECOC executable    TECOC          Highest        Implementation-specific   Authoritative
                      semantics                                               for TECOC

  TECO-64             TECO-64        High/Highest   Dialect-specific          Compare dialect
  manual/executable   behaviour                                               behaviour

  TOPS-20 TECO        Historical     High           Smaller dialect           Historical
  manuals             TECO                                                    reference

  TOPS-20 EMACS       EMACS          High           MIDAS extensions          EMACS internals
  sources             architecture                                            
  --------------------------------------------------------------------------------------------

## Guidance

-   Prefer experiments over documentation.
-   Treat manuals as evidence, not authority.
-   Verify cross-dialect assumptions.
