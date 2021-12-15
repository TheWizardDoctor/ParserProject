import antlr4
from antlr4.InputStream import InputStream
from pythonParserLexer import pythonParserLexer
from pythonParserParser import pythonParserParser
import sys


def main():
    input_stream = None
    if len(sys.argv) > 1:
        input_stream = antlr4.FileStream(sys.argv[1])
    else:
        input_stream = InputStream(sys.stdin.readline())
    lexer = pythonParserLexer(input_stream)
    stream = antlr4.CommonTokenStream(lexer)
    parser = pythonParserParser(stream)
    tree = parser.code()
    print(tree.toStringTree(recog=parser))


if __name__ == '__main__':
    main()
