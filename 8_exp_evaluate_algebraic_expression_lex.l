%{
/*
QUESTION:
8. Write a YACC program to evaluate algebraic expressions.

DESCRIPTION:
This program reads an algebraic expression such as 4+5*2 and calculates its
value. Lex converts each number into a NUMBER token and gives its value to
YACC. The YACC grammar has rules for +, -, * and /, and each rule has an
action that computes the result of that operation. Precedence declarations
(%left) make * and / get done before + and -, just like normal maths. When the
line ends, the final result is printed. Division by zero is not handled, so
avoid it in the input.

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
#include <stdlib.h>
%}

%option noyywrap

%%

[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[ \t]     ;
\n        return '\n';
.         return yytext[0];

%%
