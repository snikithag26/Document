%{
/*
QUESTION:
4. Write a lex program to count the number of words and number of lines in a
given file or program.

DESCRIPTION:
This lex program counts how many words and lines are present in the given
input. Lex reads the input and matches it against rules. A newline character
increases the line counter, and any group of characters that does not contain
a space, tab or newline is treated as one word, so the word counter increases.
Spaces and tabs are simply ignored. When the input ends (press Ctrl+D), the
program adjusts the line count if the last line had no newline and prints the
total number of lines and words.

HOW TO RUN:
lex FILE.l
cc lex.yy.c -ll
./a.out
*/
%}
%{
#include<stdio.h>

int lines = 0, words = 0, lastnl = 1;
%}

%%

[ \t]+ ;

\n { lines++; lastnl = 1; }

[^ \t\n]+ { words++; lastnl = 0; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the text (Press Ctrl+D to end input):\n");

    yylex();

    if(!lastnl)      // last line had no newline at the end
        lines++;

    printf("\nNumber of lines = %d\n", lines);
    printf("Number of words = %d\n", words);

    return 0;
}
