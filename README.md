# Abstract
Date: 10/17/2025
This is a project I did for my Structure of Programming Languages class. It involved creating a programming language by creating tokens and in a Flex file and defining syntax in a Bison file. This was my first project with the two languages and very much a learning experience for me. See RUBRIK.md for more comprehensive project details.

# Key Programming Concepts Demonstrated
1. Lexical Analysis
   - Tokenization
   - RegEx (Defining variable types)
   - Error Handling (If character is none of the above, throw an error)
2. Syntax Analysis
   - Grammar
   - Recursion (e.g. definition of statement_list)
   - Semantic Action
3. Interpreter Design
   - Execution Model
   - Symbol Table (Storing variables)
   - Domain-Specific Language (DSL)
5. C Programming and API Interaction
   - Modular Programming
   - API Usage (Pulls from a graphic library)
   - Runtime Error Handling (e.g. Checking for division by zero)

# Run Instructions
Download the files and run this command in your terminal to create an object file to run from:
```bash
gcc -o zjs zoomjoystrong.c lex.yy.c zoomjoystrong.tab.c -lSDL2 -lm
```
After compiling, run the output file with the file you wish to run:
```bash
./zjs < gv.zjs
```
A separate window will appear and the computer will draw based on the commands it is given.
