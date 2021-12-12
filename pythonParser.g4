grammar pythonParser;

expression
   : multiplyingExpression ((PLUS | MINUS) multiplyingExpression)*
   ;
multiplyingExpression
   : number ((TIMES | DIV) number)*
   ;
number
   : MINUS? DIGIT + 
   ;
if
   : SPACE* 'if(' CONDITION '):' NEWLINE+
   | SPACE* 'if' CONDITION ':' NEWLINE+
   ;
elif
   : SPACE* 'elif(' CONDITION '):' NEWLINE+
   | SPACE* 'elif' CONDITION ':' NEWLINE+
else
   : SPACE* 'else:' NEWLINE+
   ;
for
   : SPACE* 'for' VALUE 'in range(VALUE2,VALUE3):' NEWLINE+
   ;
condition
   : VALUE CONDOP VALUE
   ;
value
   : number (ARITHOP number)* (ARITHOP VARIABLE)*
   | VARIABLE
   ;
assign
   : VARIABLE ASSOP value
   ;
comment
   : SPACE* '#' CHARACTER* NEWLINE*
   ;
variable
   : (ALPHA | '_') (ALPHA | DIGIT | '_')*
   ;
print
   :
   ;



fragment PLUS
   : '+'
   ;
fragment MINUS
   : '-'
   ;
fragment TIMES
   : '*'
   ;
fragment DIV
   : '/'
   ;
fragment MOD
   : '%'
   ;
fragment POW
   : '^'
   ;
fragment ARITHOP
   : TIMES
   | DIV
   | PLUS
   | MINUS
   | MOD
   | POW
   ;

fragment EQU
   : '='
   ;
ASSOP
   : ARITHOP?EQU
   ;

fragment LT
   : '<'
   ;
fragment LTE
   : '<='
   ;
fragment GT
   : '>'
   ;
fragment GTE
   : '>='
   ;
fragment DEQU
   : '=='
   ;
fragment NOTEQU
   : '!="
   ;
fragment AND
   : 'and'
   ;
fragment OR
   : 'or'
   ;
fragment NOT
   : 'not'
   ;
CONDOP
   : LT
   | LTE
   | GT
   | GTE
   | DEQU
   | NOTEQU
   | AND
   | OR
   | NOT
   ;

fragment SPACE
   : ' '
   ;
fragment ASCIISYMBOLS
   : '!'..'~'
   ;
CHARACTER
   : SPACE
   | ASCIISYMBOLS
   ;
ALPHA
   : 'a' .. 'z'
   | 'A' .. 'Z'
   ;
DIGIT
   : ('0' .. '9')
   ;
NEWLINE
   : '\r'? '\n'
   ;
STRING
   : '"' (ASCIISYMBOLS | SPACE)* '"'
   ;

WS
   : [ \t] + -> channel (HIDDEN)
   ;