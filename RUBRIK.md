
# 343-language-creation-flex-and-bison
For this project, you will be creating a new programming language. This language will not be very complex (certainly not Turing complete!). I'm not very good at drawing in paint programs. I prefer to draw with code! So, we will be creating a mini-language that allows us to do that.
We are going to call our language Zoomjoystrong (thank you to the Product Name Generator. Zoomjoystrong will will be written in C, with the help of  Flex and Bison. As such, we will need the following pieces:
- A Flex file to define our tokens. We will call this `zoomjoystrong.lex`.
- A Bison file to define our grammar. This will be called `zoomjoystrong.y`.
- A graphics library with functions we can call to do the drawing. This will be provided to you in files called `zoomjoystrong.h` and `zoomjoystrong.c`.
Note that you don't have to create the graphics library; it is provided in this repo.

---

## Project Specifications

### Flex File

Your Flex file should define the following tokens (case-insensitive):

| Token | Description |
|-------|--------------|
| `END` | Exits the interpreter |
| `END_STATEMENT` | Marks the end of a command (semicolon) |
| `POINT` | Plot a point |
| `LINE` | Draw a line |
| `CIRCLE` | Draw a circle |
| `RECTANGLE` | Draw a rectangle |
| `SET_COLOR` | Change drawing color |
| `INT` | Integer value |
| `FLOAT` | Floating-point value |
| `VARIABLE` | Strings beginning with `$` followed by one character (e.g., `$A`, `$r`) |
| `EQUALS` | Equals sign `=` |
| `PLUS` | Addition `+` |
| `MINUS` | Subtraction `-` |
| `MULT` | Multiplication `*` |
| `DIV` | Division `/` |

#### Other Flex Rules

- Ignore tabs, spaces, and newlines.
- Match any unknown symbol and notify the user of the error.

---

### Bison File

The Bison file defines the grammar of Zoomjoystrong.

It should support:

- A **statement list** of one or more valid statements followed by the `END` token.  
- Valid statements ending with `END_STATEMENT` (i.e., commands separated by periods).

#### Example Syntax

```plaintext
point 50 50;
circle 50 50 100;
```

#### Supported Commands

| Command | Syntax | Description |
|----------|---------|-------------|
| `line` | `line x y u v` | Draw a line from `(x, y)` to `(u, v)` |
| `point` | `point x y` | Plot a single point at `(x, y)` |
| `circle` | `circle x y r` | Draw a circle centered at `(x, y)` with radius `r` |
| `rectangle` | `rectangle x y w h` | Draw a rectangle of width `w` and height `h` from top-left `(x, y)` |
| `set_color` | `set_color r g b` | Change drawing color (RGB values 0–255) |

#### Expressions

- Support arithmetic operations between variables and numbers.
- Store results in variables.

Example:

```plaintext
$A = 3 + 2;
```

All parameters may be numbers or variables.

---

## Compiling

Run the following commands:

```bash
# Generate parser files
bison -d zoomjoystrong.y

# Generate lexer
flex zoomjoystrong.lex

# Compile everything into executable 'zjs'
gcc -o zjs zoomjoystrong.c lex.yy.c zoomjoystrong.tab.c -lSDL2 -lm
```

> ⚠️ Note: The graphics library requires local execution on EOS or Arch labs, or an SDL2 installation.

Download supporting files:  
- [zoomjoystrong.c](http://localhost:63444/zoomjoystrong.c)  
- [zoomjoystrong.h](http://localhost:63444/zoomjoystrong.h)

---

## Rubric

| Criteria | 10 Points | Up to 9 Points | 0 Points |
|-----------|------------|----------------|-----------|
| **Compilation** | Compiles with no errors or warnings | Compiles with warnings | Does not compile |
| **Style Guide** | Perfect adherence | Minor mistakes | Major deviations |
| **Follows Project Specs** | Fully correct parsing | 1–2 omissions | 3+ omissions |
| **Error Handling** | Handles user errors gracefully (invalid commands, range checks, etc.) | Handles some errors | No error handling |
| **On Time** | Submitted before due date | Up to 1 day late | More than 1 day late |

---

## Sample Files

Included in this repo are sample **Flex** and **Bison** files for a calculator program — use these as references.  
A sample Zoomjoystrong program is also provided.

Example usage:

```bash
zjs < sample_program.zjs
```

This should display the expected output in the drawing window.

---

## Submission

Submit **either**:
- A GitHub repository link *(preferred)*  
**or**
- A zipped project directory to Blackboard.

**Due Date:** Friday, **October 17, 2025**, at **11:59 PM**  
**Instructor:** Charitha Subrahmanya Kodumagulla

---
