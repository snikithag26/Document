%{
/*
QUESTION:
9. Implement type checking to evaluate a simple expression.

DESCRIPTION:
Type checking is a compiler phase that makes sure operations are used on
compatible data types. In this program the input is a simple addition like int
+ int or float + float, using the words int and float to represent the types.
The YACC rules check the types on both sides of the + sign. If both are int,
the result type is int; if both are float, the result type is float. If one is
int and the other is float, the program reports a Type Error, showing how a
compiler catches type mismatches.

HOW TO RUN:
yacc -d NAME.y
lex NAME.l
gcc y.tab.c lex.yy.c -o NAME
./NAME
(NAME.y and NAME.l are the two files of this experiment)
*/
%}
%{
#include "y.tab.h"
%}

%option noyywrap

%%

int       { return INT; }
float     { return FLOAT; }
[+]       { return '+'; }
[ \t]     ;
\n        return 0;
.         return yytext[0];

%%
