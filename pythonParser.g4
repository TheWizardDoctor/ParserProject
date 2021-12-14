grammar pythonParser;

code
   : ((' ')* line)+
   ;
line
   : comment
   | control_stmnt
   | assign
   | func
   | print_func
   ;

control_stmnt
   : if_stmnt
   | elif_stmnt
   | else_stmnt
   | for_stmnt
   | while_stmnt
   ;

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
   : (' ')* 'for ' value ' in range(' value ', ' value '):' NEWLINE+
   ;
while_stmnt
	: (' ')* 'while' condition (CONDOP condition)*':' NEWLINE+
	| (' ')* 'while' (' ')* '(' condition (CONDOP condition)*'):' NEWLINE+
	;
condition
   : (' ')* value (' ')* CONDOP (' ')* value (' ')*
   ;
value
   : number (ARITHOP number)* (ARITHOP variable)*
   | variable (ARITHOP number)* (ARITHOP variable)*
   | STRING
   | func
   ;
assign
   : variable (' ')* ASSOP (' ')* value (' ')* NEWLINE+
   ;
comment
   : (' ')* '#' (CHARACTER | ASSOP | CONDOP | ARITHOP | ' ')+ NEWLINE+
   ;
variable
   : (CHARACTER | '_') (CHARACTER | DIGIT | '_')*
   ;
print_func
   : (' ')* 'print' (' ')* '(' (variable | STRING | func | (' ')*) ')' NEWLINE+
   | (' ')* 'print' (' ')* '(' (variable | STRING |func ) (' ')* ( '+' (' ')* (variable | STRING | func) )+  ')' NEWLINE+
   ;

func
   : str_func
   | int_func
   ;

str_func
   : (' ')* 'str(' value ')' 
   ;
int_func
   : (' ')* 'int(' value ')' 
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
fragment ALPHAFRAG
   : 'a' .. 'z'
   | 'A' .. 'Z'
   ;
fragment DIGITFRAG
   : ('0' .. '9')
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
   : '!' .. '/'
   | ':' .. '@'
   | '[' .. '`'
   | '{' .. '~'
   ;
DIGIT
   : DIGITFRAG
   ;
   
CHARACTER
   : SPACE
   | ASCIISYMBOLS
   | ALPHAFRAG
   | DIGITFRAG
   | '-'
   ;

NEWLINE
   : '\r'? '\n'
   ;
STRING
   : '"' CHARACTER* '"'
   ;
WS
   : [ \t] + -> channel (HIDDEN)
   ;