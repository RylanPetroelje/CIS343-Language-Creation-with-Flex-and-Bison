# Abstract
Date: 10/17/2025  
This is a project I did for my Structure of Programming Languages class. It involved creating a programming language by creating tokens in a Flex file and defining syntax in a Bison file. This was my first project with the two languages and very much a learning experience for me. See RUBRIK.md for more comprehensive project details.

# Key Programming Concepts Demonstrated
1. Lexical Analysis
   - Tokenization
   - RegEx
   - Error Handling
2. Syntax Analysis
   - Grammar
   - Recursion
   - Semantic Action
3. Interpreter Design
   - Execution Model
   - Symbol Table (Storing variables)
   - Domain-Specific Language (DSL)
5. C Programming and API Interaction
   - Modular Programming
   - API Usage (Pulls from a graphic library)
   - Runtime Error Handling 
  
# File Breakdown
- `README.md` - Markdown file containing high-level requirements and file details.
- `RUBRIK.md` - Markdown file containing the instructions for the project given by the instructor.
- `zoomjoystrong.c` - C file provided by the professor that defines core graphic functions with the SDL library, such as `setup()`, `set_color()`, `point`, `line`, etc.
- `zoomjoystrong.h` - Header file that delcates the shared functions, constants and the `color` struct, allowing all ofther C files to access the core drawing API.
- `zoomjoystrong.l` - Flex file that defines the lexical analyzer, using RegEx to scan input text and convert it to a stream of tokens like `POINT`, `INT`, or `VARIABLE` for the parser.
- `lex.yy.c` - Auto-generated C source code produced by Flex from the rules in `zoomjoystrong.l`, which implements the token-scanning state machine.
- `zoomjoystrong.y` - Bison grammar file that difines the syntax and rules for the `ZoomJoyStrong` drawing language.
- `zoomjoystrong.tab.c` - Auto-generated C source code produced by `zoomjoystrong.y`, which implentes the state machine for parsing the language.
- `zoomjoystrong.tab.h` - Auto-generated header file that defined the token numbers and the `YYSTYPE` data unoin, allowing the lexer and parser to exchange information.
- `zjs` - The compiled binary executable file, which is the final `ZoomJoyStrong`interpreter program that you can run to parse and draw graphics.
- `gv.zjs`- Example script written in `ZoomJoyStrong` that contains a sequence of commands to draw a graphic.

# Run Instructions
With the files provided, theres no need to run any flex or bison commands in your terminal. Although the compiled binary file is provided, if you want to recompile, run this command:
```bash
gcc -o zjs zoomjoystrong.c lex.yy.c zoomjoystrong.tab.c -lSDL2 -lm
```
After compiling, run the output file with the file you wish to run:
```bash
./zjs < gv.zjs
```
A separate window will appear and the computer will draw based on the commands it is given.
