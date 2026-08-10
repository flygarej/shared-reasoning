# Go Foundations

## Status

Initial domain capsule created after the first verified Go program.

This file contains a compact working model, not comprehensive Go documentation.

## Package-Oriented Generator

A useful initial reconstruction model is:

```text
module
    -> packages
        -> source files
            -> declarations
```

- The module supplies a root identity used for versioning and imports.
- Packages are the principal units of code organization and build reasoning.
- Source files contribute declarations to their package.
- Executables are built from a package named `main` that defines `func main()`.

## Toolchain Generator

The `go` command integrates common project operations around modules and packages.

For the current learning project:

```bash
go mod init <module-path>
go run .
```

means:

1. establish a module;
2. locate the package in the current directory;
3. build its applicable source files and dependencies;
4. link and execute it.

## Boundary

This capsule does not yet establish:

- exact package loading rules;
- build constraints;
- module version selection;
- package initialization order;
- visibility rules;
- workspace behavior;
- concurrency semantics.

Those details require later documentation or discriminating experiments.

## Next Verification Target

Test whether two files in the same directory and package contribute to one executable when invoked with `go run .`.
