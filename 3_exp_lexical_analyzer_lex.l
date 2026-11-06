%{
/*
QUESTION:
3. Implementation of lexical analyzer using lex tool.

DESCRIPTION:
Lex is a tool that automatically generates a lexical analyzer from a set of
rules. Each rule has a pattern (written as a regular expression) and an action
(C code to run when the pattern matches). Here we define patterns for
identifiers, operators and special symbols. When input text matches a pattern,
the program prints its token type. Spaces, tabs and newlines are ignored, and
anything else is reported as Unknown. This is much shorter than writing the
lexer by hand in C, which is why lex is widely used in compilers.

HOW TO RUN:
lex FILE.l
cc lex.yy.c -ll
./a.out
*/
%}
ID      [a-zA-Z][a-zA-Z0-9]*
NUM     [0-9]+
OP      [+\-*/=%]
SPEC    [.,;:(){}[\]]

%%

{ID}    { printf("%s\t: Identifier\n", yytext); }

{NUM}   { printf("%s\t: Constant\n", yytext); }

{OP}    { printf("%s\t: Operator\n", yytext); }

{SPEC}  { printf("%s\t: Special Symbol\n", yytext); }

[ \t\n]+ ;

.       { printf("%s\t: Unknown\n", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}
