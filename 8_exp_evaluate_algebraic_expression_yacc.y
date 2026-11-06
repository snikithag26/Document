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
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

input : expr '\n'
        {
            printf("Result = %d\n", $1);
        }
      ;

expr : expr '+' expr
        { $$ = $1 + $3; }
     | expr '-' expr
        { $$ = $1 - $3; }
     | expr '*' expr
        { $$ = $1 * $3; }
     | expr '/' expr
        { $$ = $1 / $3; }
     | NUMBER
        { $$ = $1; }
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid expression\n");
}

int main()
{
    printf("Enter an expression: ");
    yyparse();
    return 0;
}
