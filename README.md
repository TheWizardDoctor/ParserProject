# Parser Project for Principles of Programing Languages

Contributors: Tyler Hoerschgen, Sneha Reddy, Nathan Shepherd, Jim Donovan

If you have ANTLR set up according to the TA slides, this project can be run by writing the following commands in command line. Depending on how your ANTLR was configured, you might need to change `antlr4` to `antlr`
```
antlr4 -Dlanguage=Python3 pythonParser.g4

python pythonParser.py python_test_code.py
```

The output will be a parser tree.
