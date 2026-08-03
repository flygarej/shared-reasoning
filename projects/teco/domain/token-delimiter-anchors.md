## Token-Exact Delimiter Anchor

When reasoning about TECO control-flow or text-taking commands, preserve delimiter tokens exactly and treat them as correctness-relevant local semantics.

Maintain an explicit distinction between:

- structural intent of a construct;
- exact token sequence required for valid execution.

Do not substitute prose descriptions (for example “quote”, “apostrophe”, “terminator”) for token identity when correctness depends on the token itself.

For conditional forms, text insertion forms, and similarly delimiter-driven commands:

1. identify opening token;
2. identify closing token;
3. identify argument terminator token (where applicable);
4. verify those tokens for the active TECO implementation before claiming executable correctness.

If token identity is uncertain:

- mark the construct as unresolved local semantics;
- preserve structural interpretation as hypothesis only;
- request implementation-specific documentation or run a discriminating experiment.

Structural plausibility does not certify delimiter correctness.

---

