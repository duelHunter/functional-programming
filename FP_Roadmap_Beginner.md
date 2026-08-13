# 🗺️ Functional Programming Roadmap for Beginners

> A step-by-step guide for learning Functional Programming (Haskell).  
> **Goal:** Move from "What is FP?" to writing small, correct, composable programs with types.

---

## 📋 How to Use This Roadmap

- **Each phase** builds on the previous one. Do not skip.
- **Time estimate:** 1–2 hours per phase.
- **Tool you need:** `ghci` (the Haskell REPL). Install via [GHCup](https://www.haskell.org/ghcup/) or use an online REPL.
- **The Loop:** Edit → Save → `:r` (reload in GHCi) → Test. Memorize this workflow.

---

## Phase 1: The Functional Mindset & Setup
**Goal:** Understand *why* FP is different and get your tools running.

### Concepts
- [ ] **Pure functions:** Same input → same output, no side effects.
- [ ] **Immutability:** Data does not change; you create new data.
- [ ] **Expressions vs Statements:** Everything evaluates to a value. There is no "void."
- [ ] **Referential transparency:** You can replace a function call with its result safely.

### Setup Checklist
- [ ] Install GHCup (or open an online Haskell REPL).
- [ ] Verify: open a terminal and run `ghci`.
- [ ] Type `2 + 2` and see `4`.
- [ ] Learn the three tools:
  - `ghci` — interactive playground (your main tool).
  - `runghc File.hs` — run a script.
  - `ghc File.hs` — compile to an executable.

### Practice
1. In `ghci`, evaluate:
   - `2 ^ 100`
   - `"Hello" ++ " FP"`
2. Define a name: `double x = 2 * x`, then call `double 21`.

### Checkpoint
> You can open `ghci`, evaluate expressions, define a simple function, and reload a file with `:r`.

---

## Phase 2: Syntax Basics — The Grammar
**Goal:** Read and write Haskell expressions confidently.

### Concepts
- [ ] **Everything is an expression:** `if` produces a value, so `else` is **mandatory**.
- [ ] **Function application:** `f x y` — spaces separate arguments, not commas.
  - Application binds **tighter** than any operator: `double 5 + 1` means `(double 5) + 1`.
  - Nested calls need parentheses: `double (double 3)`.
- [ ] **Arithmetic:** `+ - * ^`, division trio:
  - `/` — fractional (e.g., `7 / 2` → `3.5`).
  - ``div`` — integer quotient (`7 `div` 2` → `3`).
  - ``mod`` — remainder (`7 `mod` 2` → `1`).
- [ ] **Comparison:** `==`, `/=` (not `!=`), `<`, `>`, etc.
- [ ] **Logic:** `&&`, `||`, `not x`.
- [ ] **Precedence (tightest first):** application > `^` > `* / div mod` > `+ -` > comparison > `&&` > `||`.
  - *Rule:* When in doubt, **parenthesize**.

### Local Definitions
- [ ] `let ... in ...` — plumbing first, result after.
- [ ] `... where ...` — headline first, plumbing after.
- [ ] **Layout rule:** Definitions at the same level must start in the **same column**. Use spaces, never tabs.

### Practice
Write these functions in a file and load into `ghci`:
1. `average x y = (x + y) / 2`
2. `cylinderVolume r h = let base = pi * r ^ 2 in base * h`
3. `bmi w h = w / h ^ 2` (add a `where` clause for `h^2` if you want practice).
4. `biggerOf x y = if x > y then x else y`

### Checkpoint
> You can write functions with `let`/`where`, predict precedence, and explain why `double 5 + 1` is `11`, not `12`.

---

## Phase 3: Types — Your Safety Net
**Goal:** Understand static types, read type signatures, and use `:t`.

### Concepts
- [ ] **Static typing:** Types are checked before the program runs. Bugs move from 2 a.m. production to 2 p.m. at your desk.
- [ ] **Reading signatures:** `::` means "has type."
  - `True :: Bool`
  - `'a' :: Char`
  - `"hi" :: String` (which is `[Char]`)
- [ ] **Function types:** `Int -> Int` takes an `Int` and returns an `Int`.
  - `bmi :: Double -> Double -> Double` takes two `Double`s and returns one.
- [ ] **Numeric types:**
  - `Int` — fast, bounded (wraps around silently!).
  - `Integer` — unbounded, exact (use for big numbers).
  - `Double` — approximate floating point. Never compare with `==`; use a tolerance.
- [ ] **Type inference:** The compiler can deduce types. Write signatures anyway — they are checked documentation.

### Type Classes (The "Clubs")
- [ ] `Num` — supports `+`, `-`, `*` (e.g., `Int`, `Integer`, `Double`).
- [ ] `Eq` — supports `==`, `/=`.
- [ ] `Ord` — supports ordering: `<`, `>`, `max`, `min`.
- [ ] `Show` — can be converted to `String` for printing.
- [ ] **Constraints:** `Ord a => a -> a -> a` means: "Give me any type `a` that can be ordered, and I will work."

### Practice
1. In `ghci`, run `:t` on:
   - `not`
   - `(+)`
   - `length "abc"`
2. Write signatures for:
   - `cube x = x * x * x`
   - `isPassing mark = mark >= 40`
   - `intAverage x y = fromIntegral (x + y) / 2`

### Checkpoint
> You can read `Ord a => a -> a -> a`, choose between `Int`/`Integer`/`Double`, and explain why `5 + "a"` is rejected at compile time.

---

## Phase 4: Lists — The Workhorse
**Goal:** Build, join, slice, and generate lists declaratively.

### Concepts
- [ ] **Homogeneous:** `[Int]`, `[String]`. All elements share one type.
- [ ] **Cons and literals:** `[1,2,3]` is sugar for `1 : 2 : 3 : []`.
- [ ] **Ranges:**
  - `[1 .. 10]`
  - `[2, 4 .. 20]` — first two elements set the step.
  - `[10, 9 .. 1]` — descending.
  - `['a' .. 'z']` — characters too.
- [ ] **Joining:**
  - `(:)` — prepend one element (fast).
  - `(++)` — join two lists (walks the left list).
  - `concat` — flatten a list of lists.
- [ ] **Safe slicers (total):**
  - `take n xs`, `drop n xs` — never crash.
  - `length xs`, `reverse xs`, `null xs`, `elem x xs`.
- [ ] **Unsafe accessors (partial):**
  - `head`, `tail`, `last`, `init` — crash on `[]`. Prefer pattern matching or `take`/`drop`.
- [ ] **Laziness:** Infinite lists like `[1 .. ]` are fine if you only take what you need: `take 5 [1..]`.

### List Comprehensions
Think "set-builder notation":
```haskell
[x*x | x <- [1..10]]           -- squares
[x*x | x <- [1..10], even x]   -- squares of evens
```
- [ ] **Generator:** `x <- [1..10]` — "drawn from."
- [ ] **Guard:** `even x` — "such that."
- [ ] **Multiple generators:** Later generators spin fastest (like nested loops).

### Practice
1. Write a function `divisors n = [d | d <- [1..n], n `mod` d == 0]`.
2. Write `removeVowels :: String -> String` using a comprehension.
3. Predict, then verify: `take 3 (drop 2 [1..10])`.

### Checkpoint
> You can build lists with ranges and comprehensions, explain `(:)` vs `(++)`, and safely slice lists without crashing on empty inputs.

---

## Phase 5: Pattern Matching — Taking Things Apart
**Goal:** Use patterns to inspect shape and bind names in one step.

### Concepts
- [ ] **Patterns are pictures of shape:** They check, destructure, and name simultaneously.
- [ ] **Literal patterns:** `isZero 0 = True`; `isZero _ = False`.
- [ ] **Wildcard `_`:** Matches anything, binds nothing. Put it **last** or it swallows everything.
- [ ] **Order matters:** Top-to-bottom, first match wins. Specific patterns before general ones.
- [ ] **Structural patterns:**
  - Tuples: `swap (x, y) = (y, x)`
  - Lists: `total [] = 0`; `total (x:xs) = x + total xs`
  - Custom constructors (see Phase 7).
- [ ] **Nested patterns:** `firstCoordOfJust (Just (x, _)) = x`
- [ ] **Guards (`|`):** Ask about *truth* after matching *shape*.
  ```haskell
  gradeOf mark
    | mark >= 75 = 'A'
    | mark >= 65 = 'B'
    | otherwise  = 'F'
  ```
- [ ] **`case` expressions:** Pattern match anywhere, not just at the top level.

### Practice
1. Write `secondElement :: [a] -> Maybe a` using patterns (return `Just x` if at least two elements, else `Nothing`).
2. Write `startsWithZero (0:_) = True`.
3. Write `quadrant (x,y)` with guards for the four quadrants.

### Checkpoint
> You can write total functions over lists using `[]` and `(x:xs)` patterns, use guards for interval logic, and avoid `if`/`else` when a pattern suffices.

---

## Phase 6: Higher-Order Functions — Power Tools
**Goal:** Stop writing loops; start writing pipelines.

### Concepts
- [ ] **Functions are first-class values:** You can name them, put them in lists, and pass them to other functions.
- [ ] **`map`:** Transform every element. `map f [1,2,3]` → `[f 1, f 2, f 3]`.
- [ ] **`filter`:** Keep what satisfies a predicate. `filter even [1..5]` → `[2,4]`.
- [ ] **`foldr` / `foldl`:** Collapse a list to one value.
  - `sum = foldr (+) 0`
  - `product = foldr (*) 1`
  - Mental model: replaces `(:)` with your function and `[]` with your starting value.
- [ ] **Lambdas:** Anonymous functions. `\x -> x * x + 1`.
- [ ] **Sections:** Partially applied operators.
  - `(+1)` — add one.
  - `(/2)` — divide by two.
  - `(2/)` — two divided by argument. **Side matters!**
- [ ] **Currying & Partial Application:**
  - Every function takes exactly one argument.
  - `add x y = x + y` really means `add :: Int -> (Int -> Int)`.
  - `addFive = add 5` is valid and useful.

### The Pipeline Pattern
```haskell
result = aggregate . transform . select $ input
-- filter -> map -> fold
```

### Practice
1. Sum of squares of even numbers from 1 to 100 (one expression, no recursion).
2. Write `classAverage` that filters valid marks (0–100), caps a bonus at 100, and computes the average.
3. Use `map (+1)` and `filter (>= 40)` on a list of exam marks.

### Checkpoint
> You can replace any explicit list recursion with `map`, `filter`, or a fold, and build new functions cheaply with partial application.

---

## Phase 7: Algebraic Data Types (ADTs) — Modeling Reality
**Goal:** Define your own types so that invalid states are unrepresentable.

### Concepts
- [ ] **`data` keyword:** Invent types as freely as functions.
  ```haskell
  data TrafficLight = Red | Amber | Green
  ```
- [ ] **Sum types (`|` = OR):** `Bool = False | True`. Adds alternatives.
- [ ] **Product types (fields = AND):** `data Point = Point Double Double`. Multiplies possibilities.
- [ ] **Sum of products:** Real-world modeling.
  ```haskell
  data Shape = Circle Double
             | Rectangle Double Double
             | Triangle Double Double
  ```
- [ ] **One equation per constructor:** The compiler warns if you miss one.
- [ ] **`deriving (Show, Eq)`:** Auto-generate printing and equality.
- [ ] **Constructors are functions:** They curry and partially apply just like any function.

### Maybe — Failure as a Value
- [ ] `data Maybe a = Nothing | Just a`
- [ ] Use `Maybe` instead of crashing. `safeHead [] = Nothing`; `safeHead (x:_) = Just x`.
- [ ] The caller **must** handle both cases (via pattern matching or `case`).

### Expr — Computation as Data
- [ ] Recursive types describe tree-shaped data.
  ```haskell
  data Expr = Num Int
            | Add Expr Expr
            | Mul Expr Expr
  ```
- [ ] Write one recursive function per meaning (`eval`, `render`, `simplify`).

### Practice
1. Define `data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun` and write `nextDay` with wrap-around.
2. Define `data Payment = Cash | Card String` and write `describePayment`.
3. Extend `Expr` with `Sub` and update `eval`.

### Checkpoint
> You can define a custom type, explain sum vs product, use `Maybe` to handle absence safely, and write recursive evaluators over tree-shaped data.

---

## Phase 8: Laziness & Infinite Data
**Goal:** Leverage Haskell's lazy evaluation to write elegant, efficient code.

### Concepts
- [ ] **Lazy evaluation:** Expressions are evaluated only when their results are needed.
- [ ] **Infinite lists:** `naturals = [1..]` is a recipe, not a warehouse.
- [ ] **Safe usage:** Always bound infinite lists with `take`, `filter`, or a guard.
- [ ] **Pipelining:** `take 5 [1..]` produces `[1,2,3,4,5]` instantly without computing the infinite tail.

### Practice
1. Generate the first 10 powers of 2: `take 10 [2^n | n <- [1..]]`.
2. Define `primes` conceptually (you may need a helper), then take the first 20.

### Checkpoint
> You can use infinite ranges safely, explain why `take 5 [1..]` does not loop forever, and describe the difference between strict and lazy evaluation in your own words.

---

## Phase 9: Putting It All Together
**Goal:** Build a small, complete program that uses every concept above.

### Suggested Capstone Projects
Pick one and implement it in a single `.hs` file:

1. **Student Gradebook**
   - Define a `Student` type (name, list of marks).
   - Write functions to calculate average, determine grade (`Ord` + guards), and find honors students (`filter`).
   - Use `Maybe` for students with no marks.
   - Render a report string from the data.

2. **Expression Calculator**
   - Define `Expr` with `Num`, `Add`, `Sub`, `Mul`, `Div`.
   - `eval` returns `Maybe Double` (handle division by zero).
   - `render` prints infix with parentheses.
   - Parse a simple string into an `Expr` (bonus).

3. **Lazy Prime Sieve**
   - Implement the Sieve of Eratosthenes using list comprehensions and lazy filtering.
   - Use `take` to get the first *n* primes.

### Final Checklist
- [ ] Types defined with `data`.
- [ ] Functions use pattern matching and/or guards.
- [ ] No explicit recursion where `map`/`filter`/`fold` suffice.
- [ ] `Maybe` used for partial operations.
- [ ] At least one higher-order function pipeline.
- [ ] File loads in `ghci` without errors; `:r` works after edits.

---

## 🎓 Study Tips

1. **Predict before you run.** Write your guess on paper, then check in `ghci`. A wrong guess teaches more than a fast lookup.
2. **Read errors top-down.** The first line tells you *where* and *what* failed. The compiler is on your side.
3. **Use `:t` constantly.** Interrogate every name and expression. Types are the best documentation.
4. **Parenthesize when in doubt.** Clever code is less important than clear code.
5. **Refactor to HOFs.** If you write recursion over a list, ask: "Can this be `map`, `filter`, or a fold?"
6. **Make invalid states unrepresentable.** If a value shouldn't exist, design a type that prevents it.

---

## 📚 Recommended Reading

- **Hutton, *Programming in Haskell* (2nd ed.)** — Chapters 1–8 map closely to this roadmap.
- **Learn You a Haskell (free online)** — Friendly, conversational companion.
- **Your lecture slides:** Keep them open as reference while you practice in `ghci`.

---

*Good luck. Keep the prompt warm, keep evaluating, and let the types guide you.*
