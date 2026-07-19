# Documentation Overview

  --------------------------------------------------------------------------------------------
  Reference       Covers           Reliability    Limitations               Preferred use
  --------------- ---------------- -------------- ------------------------- ------------------
  1985 Standard   Core language    Primary        Historical semantics      First reference
  TECO manual     semantics                                                 for language
                                                                            behavior

  TECOC source    Implementation   High           Implementation-specific   Verify TECOC
                  behavior                                                  internals

  TECOC           Command syntax   High           Minimal explanation       Fast lookup
  `wchart.txt`                                                              

  TECO-64         Extensions and   High           Includes extensions       TECO-64-specific
  documentation   flags                                                     behavior

  TOPS-20 TECO    Historical       High when      Only tested cases         Historical
  540 experiments implementation   tested                                   reference and
                                                                            comparison
  --------------------------------------------------------------------------------------------

Prefer verified experiments over documentation for implementation
behavior; keep language principles separate from implementation
observations.
