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
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token LETTER DIGIT

%%

variable : LETTER
         | LETTER chars
         ;

chars : LETTER chars
      | DIGIT chars
      | LETTER
      | DIGIT
      ;

%%

void yyerror(const char *s)
{
    printf("Invalid Variable\n");
}

int main()
{
    printf("Enter a variable: ");
    if(yyparse() == 0)
        printf("Valid Variable\n");
    return 0;
}
