grammar pythonParser;

number
   : '-'? DIGIT + 
   ;
if_stmnt
   : (' ')* 'if' (' ')* '(' condition '):' NEWLINE+
   | (' ')* 'if' condition ':' NEWLINE+
   ;
elif_stmnt
   : (' ')* 'elif(' condition '):' NEWLINE+
   | (' ')* 'elif' condition ':' NEWLINE+
   ;
else_stmnt
   : (' ')* 'else:' NEWLINE+
   ;
for_stmnt
   : (' ')* 'for' value 'in range(' value ',' value '):' NEWLINE+
   ;
condition
   : (' ')* value (' ')* CONDOP (' ')* value (' ')*
   ;
value
   : number (ARITHOP number)* (ARITHOP variable)*
   | variable (ARITHOP number)* (ARITHOP variable)*
   ;
assign
   : variable ASSOP value
   ;
comment
   : (' ')* '#' CHARACTER* NEWLINE*
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
ARITHOP
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
fragment PLUS_EQU
   : '+='
   ;
fragment MINUS_EQU
   : '-='
   ;
fragment TIMES_EQU
   : '*='
   ;
fragment DIV_EQU
   : '/='
   ;
fragment MOD_EQU
   : '%='
   ;
fragment POW_EQU
   : '^='
   ;
ASSOP
   : EQU
   | PLUS_EQU
   | MINUS_EQU
   | TIMES_EQU
   | DIV_EQU
   | MOD_EQU
   | POW_EQU
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
   : '!='
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
ALPHA
   : 'a' .. 'z'
   | 'A' .. 'Z'
   ;
DIGIT
   : ('0' .. '9')
   ;
CHARACTER
   : SPACE
   | ASCIISYMBOLS
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