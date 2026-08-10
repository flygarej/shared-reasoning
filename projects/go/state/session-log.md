# session-log.md

## 2026-08-04 — Project bootstrap and first executable

### Origin

The Go project began as a branch from a 6502 discussion that moved through transputers and the question of which modern platforms preserve aspects of that heritage.

The user began with no prior Go knowledge but with broad programming and systems experience and access to Linux systems.

### Initial Direction

The collaboration chose not to treat the project as a syntax-first tutorial.

The initial teaching direction is:

- understand why Go exists;
- understand its package and tooling model;
- learn the language through small experiments;
- later return to CSP, goroutines, channels, and the transputer connection.

### Environment Inspection

The user ran:

```bash
go version
go env
go help
```

Observed:

```text
go version go1.22.2 linux/amd64
```

Relevant environment observations included:

```text
GOARCH='amd64'
GOOS='linux'
GOROOT='/usr/lib/go-1.22'
GOPATH='/home/flax/go'
GOVERSION='go1.22.2'
CGO_ENABLED='1'
GOMOD='/dev/null'
```

Interpretation accepted for the session:

- Go is installed and operational;
- no module was active in the original directory;
- the system is ready for local experiments.

### Module Creation

The user created:

```text
~/go-playground/hello
```

and ran:

```bash
go mod init example.go/hello
```

The generated `go.mod` was inspected:

```text
module example.go/hello

go 1.22.2
```

The accidental use of `example.go` rather than `example.com` was retained. It is sufficient for this local learning module.

### First Program

The first program used:

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, grasshopper!")
}
```

The user ran:

```bash
go run .
```

Observed output:

```text
Hello, grasshopper!
```

This established a working build-and-run path and introduced the package-oriented model.

### Current Teaching Hypothesis

The useful initial mental model is that Go primarily organizes and builds packages rather than treating source files as independent compilation targets.

This remains to be tested directly with a two-file package.

### Next Planned Experiment

Add `message.go` to the same `main` package with a `greeting()` function, invoke it from `main.go`, and run `go run .`.

This is intended as the smallest discriminating experiment for package composition across files.
