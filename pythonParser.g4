grammar pythonParser;

code
   : (TAB* line)+
   ;
line
   : control_stmnt
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
   | break_stmnt
   ;

number
   : '-'? DIGIT + 
   ;
if_stmnt
   : 'if' '(' condition '):' NEWLINE+
   | 'if' condition ':' NEWLINE+
   ;
elif_stmnt
   : 'elif(' condition '):' NEWLINE+
   | 'elif' condition ':' NEWLINE+
   ;
else_stmnt
   : 'else:' NEWLINE+
   ;
for_stmnt
   : 'for ' value ' in range('value ', ' value '):' NEWLINE+
   ;
while_stmnt
	: 'while' condition (CONDOP condition)*':' NEWLINE+
	| 'while' '(' condition (CONDOP condition)*'):' NEWLINE+
	;
condition
   : value CONDOP value
   ;
value
   : number (ARITHOP value)*
   | variable (ARITHOP value)*
   | STRING (ARITHOP value)*
   | func (ARITHOP value)*
   ;
assign
   : variable ASSOP value NEWLINE+
   ;
variable
   : (CHARACTER | '_') (CHARACTER | DIGIT | '_')*
   ;
print_func
   : 'print' '(' (variable | STRING | func) ')' NEWLINE+
   | 'print' '(' (variable | STRING | func ) ( '+' (variable | STRING | func) )+  ')' NEWLINE+
   ;

func
   : str_func
   | int_func
   ;

str_func
   : 'str(' value ')' 
   ;
int_func
   : 'int(' value ')' 
   ;

break_stmnt
   : 'break' NEWLINE+
   ;

ARITHOP
   : '*'
   | '/'
   | '+'
   | '-'
   | '%'
   | '^'
   ;
ASSOP
   : '='
   | '+='
   | '-='
   | '*='
   | '/='
   | '%='
   | '^='
   ;
CONDOP
   : '<'
   | '<='
   | '>'
   | '>='
   | '=='
   | '!='
   | 'and'
   | 'or'
   | 'not'
   ;

fragment ALPHAFRAG
   : 'a' .. 'z'
   | 'A' .. 'Z'
   ;
fragment DIGITFRAG
   : ('0' .. '9')
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
   : ASCIISYMBOLS
   | ALPHAFRAG
   | DIGITFRAG
   ;
TAB
   : '    '
   ;
NEWLINE
   : '\r'? '\n'
   ;
STRING
   : '"' (CHARACTER | ' ')* '"'
   ;
COMMENT
   : '#' (~[\r\n])* NEWLINE -> skip
   ;
WS
   : [ \t] + -> channel (HIDDEN)
   ;