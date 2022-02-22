# Raylib 4.x Bindings for Racket

This is a _complete_ FFI wrapper for [Raylib 4.0][raylib]. It also consists of few helper functions - in the same style - to simplify very common FFI code.

It also comes with pre-compiled dynamic libraries for 64-bit Windows, MacOS (Apple Silicon & Intel), and Linux (AMD64). These will automatically be installed by `raco` and put in a location where Racket can find them.

## Installation

Install with `raco`:

```bash
$ raco pkg install raylib
```

## Quickstart Examples

It's expected that you know [Raylib][raylib] and know the types, functions, etc. But, examples of using it from [Racket][racket] can be found [here][examples].



[csfml]: https://www.raylib.com/
[examples]: https://github.com/massung/racket-raylib/tree/main/examples
