%{
/*
QUESTION:
6. Convert the BNF rules into YACC form and write code to generate an abstract
syntax tree.

DESCRIPTION:
An Abstract Syntax Tree (AST) is a tree that shows the structure of an
expression, where each operator is a node and its operands are the children.
Here the BNF grammar rules for assignment, addition and multiplication are
written in YACC form. Each rule creates a tree node using the create()
function, joining left and right sub-trees. After parsing, the draw() function
prints the tree with indentation. For example, a = b + c * d gives = at the
top, with a and the + subtree below it. Multiplication binds tighter than
addition.

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
#include <string.h>
%}

%option noyywrap

%%
[ \t\n]+ ;
[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.s = strdup(yytext);
    return ID;
}
"="  return '=';
"+"  return '+';
"*"  return '*';
"("  return '(';
")"  return ')';
.    printf("Invalid character\n");
%%
