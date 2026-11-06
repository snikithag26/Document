%{
/*
QUESTION:
5. Generate YACC specification for a few syntactic categories. c.
Implementation of calculator using Lex and YACC.

DESCRIPTION:
This program is a simple calculator built with Lex and YACC. Lex reads the
typed expression, converts digits into a NUMBER token and stores its value.
YACC has grammar rules for +, -, *, / and brackets, and each rule has an
action that calculates the result, for example $$ = $1 + $3. Precedence
declarations make sure multiplication and division are done before addition
and subtraction. When the full expression is read, the final answer is
printed. It shows how YACC can both check syntax and compute results.

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

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

input : expr '\n' { printf("Result = %d\n", $1); }
      ;

expr : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | expr '*' expr { $$ = $1 * $3; }
     | expr '/' expr { $$ = $1 / $3; }
     | '(' expr ')'  { $$ = $2; }
     | NUMBER        { $$ = $1; }
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}
