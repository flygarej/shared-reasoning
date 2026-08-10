# project-state.md

## Project

Go language and platform exploration.

## Operation

Maintenance following the first successful bootstrap session.

## Objective

Learn Go from first principles, with emphasis on the language and platform design rather than syntax alone.

The motivating question is how Go relates conceptually to the transputer and CSP heritage, especially through concurrency, goroutines, and channels.

## Scope

Included:

- Go language fundamentals;
- the Go toolchain;
- modules and packages;
- small executable experiments on Linux;
- later study of interfaces, goroutines, channels, and CSP-related ideas;
- comparison with languages and systems already familiar to the user when that improves understanding.

Excluded for now:

- production application design;
- web frameworks;
- large dependency ecosystems;
- premature concurrency examples before the basic language and package model are understood.

## Known Environment

Verified by direct observation on 2026-08-04:

- Host operating system: Linux.
- Architecture: amd64.
- Installed Go version: `go1.22.2`.
- `GOROOT`: `/usr/lib/go-1.22`.
- `GOPATH`: `/home/flax/go`.
- `CGO_ENABLED=1` with GCC available.
- The user has one or more Linux systems available for experiments.

## Accepted Observations

### Toolchain

- `go version` and `go env` run successfully.
- The `go` command provides integrated build, run, format, test, documentation, module, and package operations.
- Outside a module, `go env` reported `GOMOD=/dev/null`.

### First Module

A learning module was created at:

```text
~/go-playground/hello
```

using:

```bash
go mod init example.go/hello
```

The resulting `go.mod` contains:

```text
module example.go/hello

go 1.22.2
```

Accepted interpretation:

- the module path identifies the module;
- the `go` directive records the Go language/toolchain semantics declared by the module;
- the current learning module is intentionally local and disposable.

### First Program

A package named `main` containing `func main()` was created and executed with:

```bash
go run .
```

Observed output:

```text
Hello, grasshopper!
```

This verifies that the installed Go toolchain can discover the module, build the current package, link an executable, and run it.

## Current Working Model

Go should initially be understood through this hierarchy:

```text
module
    -> packages
        -> source files
            -> declarations and functions
```

Current conceptual distinctions:

- A module is the versioning and dependency-management unit and provides the root import path.
- A package is the principal code-organization and compilation unit.
- Source files contribute declarations to a package.
- `package main` plus `func main()` defines an executable program.
- `go run .` operates on the package in the current directory, not merely on one named source file.

These distinctions are accepted as the teaching model for the next experiments. Exact edge cases and full module semantics have not yet been studied.

## Learning Strategy

- Prefer the smallest experiment that discriminates between competing mental models.
- Explain mechanisms before accumulating syntax.
- Delay goroutines and channels until packages, functions, data, and interfaces are sufficiently understood.
- Preserve the transputer/CSP motivation so concurrency is later introduced as part of a conceptual lineage rather than as a novelty.

## Explicit Unknowns

- How multiple files in one package compose during a build has not yet been verified experimentally in this project.
- Package visibility and exported identifiers have not been studied.
- Variables, constants, data types, pointers, structs, arrays, slices, maps, methods, and interfaces have not yet been studied.
- Error handling has not yet been studied.
- Testing and formatting have not yet been exercised.
- Goroutines, channels, scheduling, synchronization, and their exact relationship to CSP and transputer ideas remain future topics.
- No production-quality project structure has been chosen.

## Next Experiment

Create a second source file in the existing `main` package containing a `greeting()` function, call it from `main.go`, and run:

```bash
go run .
```

Purpose:

Distinguish the model "Go compiles individual files" from the stronger model "Go builds packages assembled from all applicable source files in a directory."
