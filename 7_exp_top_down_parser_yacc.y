%{
/*
QUESTION:
7. Write a YACC program to implement a top-down parser for the given grammar.

DESCRIPTION:
A parser checks whether a string follows the rules of a grammar. This program
parses expressions of the form id + id - id, where an identifier is any word
made of letters. The grammar is: expr -> id | expr + id | expr - id. Lex
returns the token ID for each word and returns + and - as themselves. YACC
then verifies the sequence. If the string matches the grammar, Parsing
successful is printed, otherwise Invalid string is shown. Strings such as
a+b-c are valid, while a++b is not.

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
int yylex(void);
void yyerror(const char *s);
%}

%token ID

%%

expr : ID
     | expr '+' ID
     | expr '-' ID
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid string\n");
}

int main()
{
    printf("Enter expression using id: ");
    if (yyparse() == 0)
        printf("Parsing successful\n");

    return 0;
}
