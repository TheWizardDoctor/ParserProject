# Parser Project for Principles of Programming Languages

### Contributors: Tyler Hoerschgen, Sneha Reddy, Nathan Shepherd, Jim Donovan

We created a grammar for Python v3.x that parses the given ` python_test_code.py ` file. We created this grammar using ANTLR.

The features that our grammar implements are:

- `if/else` blocks
- Variable definitions
- `while` and `for` loops
- Arithmetic operators (+, -, *, /, %, ^)
- Assignment operators (=, +=, -=, *=, /=, ^=, %=)
- Conditional statements (<, <==, >, >==, ==, !=, and, or, not)
- Comments

#### Requirements and Setup

You must have Java installed (version 1.7 or higher). You also must have ANTLR installed. To do this, follow the steps given by the creators of ANTLR, which includes installation for Unix and Windows: https://github.com/antlr/antlr4/blob/master/doc/getting-started.md

#### How to Use/Run the Parser

This project can be run by writing the following commands in command line. Depending on how your ANTLR was configured, you might need to change `antlr4` to `antlr`.

```
antlr4 pythonParser.g4
```
```
javac pythonParser*.java
```
```
grun pythonParser entry -gui python_test_code.py
```

Running these commands returns a parse tree of the provided `python_test_code.py` code.
