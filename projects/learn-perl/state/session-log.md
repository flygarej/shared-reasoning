# session-log.md

## 2026-09-05 — Project bootstrap

### Operation

Bootstrap of project `learn-perl`.

### User objective

The user wants to brush up existing Perl skills and hopefully learn something new.

### Environment observation

The user reported running Perl on Ubuntu. `perl -v` reported:

```text
This is perl 5, version 38, subversion 2 (v5.38.2) built for x86_64-linux-gnu-thread-multi
(with 64 registered patches, see perl -V for more detail)
```

### Decisions

- Treat this as a refresher/exploration project rather than a beginner-from-zero course.
- Do not infer the user's exact prior Perl knowledge from the project name or general programming background.
- Let the learning path emerge through small exercises and experiments.
- Use early exercises to distinguish fluent, rusty, and unfamiliar areas.
- Keep detailed Perl domain knowledge out of Project State until it has actually emerged through the project.

### Working model

A sequence of compact practical exercises should reveal the user's current Perl habits and knowledge efficiently. The resulting evidence can then guide both review and exploration of new material.

### Open questions

- Which areas of Perl are already fluent?
- Which are rusty?
- Which modern or advanced areas are unfamiliar?
- What kinds of Perl tasks are most useful or interesting to the user?

### Next step

Begin with a small Perl exercise and use the solution as evidence for refining the learning path.
