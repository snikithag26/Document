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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    char v[20];
    struct node *l, *r;
} Node;

Node *root;

Node *create(char *v, Node *l, Node *r) {
    Node *n = malloc(sizeof(Node));
    strcpy(n->v, v);
    n->l = l; n->r = r;
    return n;
}

int yylex(void);
void yyerror(const char *s);

void draw(Node *n, int d) {
    if (!n) return;
    for (int i = 0; i < d; i++) printf("  ");
    printf("%s\n", n->v);
    draw(n->l, d+1);
    draw(n->r, d+1);
}
%}

%union { struct node *n; char *s; }
%token <s> ID
%type <n> E T F

%%
E : ID '=' E { $$ = root = create("=", create($1,0,0),$3); }
  | E '+' T  { $$ = root = create("+",$1,$3); }
  | T        { $$ = root = $1; }
  ;
T : T '*' F  { $$ = create("*",$1,$3); }
  | F        { $$ = $1; }
  ;
F : '(' E ')' { $$ = $2; }
  | ID        { $$ = create($1,0,0); }
  ;
%%

void yyerror(const char *s) { printf("Invalid expression\n"); }

int main() {
    printf("Enter expression: ");
    if (yyparse() == 0)
        draw(root,0);
    return 0;
}
