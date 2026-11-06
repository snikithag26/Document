%{
/*
QUESTION:
5. Generate YACC specification for a few syntactic categories. b. Program to
recognize a valid variable that starts with a letter followed by any number of
letters or digits.

DESCRIPTION:
In most programming languages, a variable name must start with a letter and
can then contain any number of letters or digits. This program checks that
rule using Lex and YACC. Lex returns LETTER for every alphabet character and
DIGIT for every number character. The YACC grammar says a variable is one
LETTER, optionally followed by more letters or digits. If the typed name
follows this rule, the program prints Valid Variable. For names like 2abc or
a$b it prints Invalid Variable.

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

[a-zA-Z]    { return LETTER; }
[0-9]       { return DIGIT; }
[ \t]       ;
\n          { return 0; }
.           { return yytext[0]; }

%%
