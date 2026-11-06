/*
QUESTION:
11. Write a recursive descent parser for the grammar b. S->(L) S->a L->L, S
L->S

DESCRIPTION:
This is a recursive descent parser for a grammar that describes nested lists.
S can be the letter a or a list in brackets, and L is one or more S separated
by commas. Since L->L,S is left recursive, it is written as a loop: L() calls
S() and keeps going while it finds a comma. Each grammar rule is a function,
and they call each other to match the input. The string is valid only if
everything matches and no characters are left. Examples: a, (a,a) and
(a,(a,a)) are valid.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include <stdio.h>

char input[100];
int i = 0;
int error = 0;

void S();
void L();

void S()
{
    if(input[i] == 'a')
    {
        i++;
    }
    else if(input[i] == '(')
    {
        i++;

        L();

        if(input[i] == ')')
            i++;
        else
            error = 1;
    }
    else
    {
        error = 1;
    }
}

void L()
{
    S();

    while(input[i] == ',')
    {
        i++;
        S();
    }
}

int main()
{
    printf("Enter string: ");
    scanf("%s", input);

    S();

    if(error == 0 && input[i] == '\0')
        printf("Valid String\n");
    else
        printf("Invalid String\n");

    return 0;
}
