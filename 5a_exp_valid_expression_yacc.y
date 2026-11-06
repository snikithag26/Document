%{
/*
QUESTION:
5. Generate YACC specification for a few syntactic categories. a. Program to
recognize a valid arithmetic expression that uses operators +,-, *, and /.

DESCRIPTION:
YACC (Yet Another Compiler Compiler) builds a parser from grammar rules, while
Lex supplies the tokens. In this program the grammar says an expression is
made of numbers joined by + - * / and can also have brackets. Lex returns
NUMBER for every number and passes other symbols directly. YACC then checks if
the sequence follows the grammar. If it does, the program prints Valid
Expression, otherwise it prints Invalid Expression. Precedence rules are added
so that * and / are handled before + and -.

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
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | '(' expr ')'
     | NUMBER
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter expression: ");
    if(yyparse() == 0)
        printf("Valid Expression\n");
    return 0;
}
