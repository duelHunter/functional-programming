# Functional Programming Notes

Notes, exercises, and lab code for learning Functional Programming (Haskell).

## Contents

- [Notes.md](Notes.md) — concept notes (REPL, thunks, first-class functions, HLS, etc.)
- [FP_Roadmap_Beginner.md](FP_Roadmap_Beginner.md) — a phase-by-phase beginner roadmap for learning Haskell
- [lab-1.hs](lab-1.hs) — lab 1 source code

## How to install Haskell on Windows?

1. Download and run the [GHCup](https://www.haskell.org/ghcup/) installer (`ghcup-msys2-hls-x86_64-mingw64.exe` or the installer PowerShell script from the GHCup site).
2. Follow the prompts to install:
   - **GHC** — the Glasgow Haskell Compiler
   - **Cabal** — the build tool / package manager
   - **Stack** (optional) — an alternative build tool
   - **HLS** (Haskell Language Server) — editor tooling (see [Notes.md](Notes.md#what-is-huskell-language-serverhls))
3. Restart your terminal so the updated `PATH` takes effect.
4. Verify the installation:
   ```bash
   > ghc --version
   > ghci --version
   > cabal --version
   ```
5. (Optional, for VS Code) Install the **Haskell** extension, which uses HLS to provide error highlighting, type info on hover, go-to-definition, and formatting.

## How to run lab-1.hs?

```bash
    > ghc .\lab-1.hs
    [1 of 2] Compiling Main             ( lab-1.hs, lab-1.o )
    [2 of 2] Linking lab-1.exe
    > .\lab-1.exe
    9
```

You can also skip compiling to an executable and run the script directly:

```bash
    > runghc .\lab-1.hs
```

Or load it into the interactive REPL (GHCi) to experiment with the functions inside:

```bash
    > ghci .\lab-1.hs
    Prelude> square 4
    16
```
