/*
QUESTION:
12. Write a C program to calculate the first function for the grammar E->E+T
E->T T->T*F T->F F->(E)/id

DESCRIPTION:
FIRST(X) is the set of terminal symbols that can appear at the start of any
string derived from X. Parsers use it to decide which rule to apply. This
program stores the grammar rules as strings and finds FIRST using a recursive
function. If the symbol is a terminal, it is printed directly. If it is a non-
terminal, the function looks at its rules and checks the first symbol on the
right side, calling itself again when that is also a non-terminal. Left-
recursive rules are skipped to avoid endless looping. The result is FIRST = {
( id } for E, T and F.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include <stdio.h>
#include <ctype.h>

char p[6][10] = {
    "E=E+T",
    "E=T",
    "T=T*F",
    "T=F",
    "F=(E)",
    "F=id"
};

void first(char c)
{
    int i;
    char x;

    if (!isupper(c))
    {
        printf("%c ", c);
        return;
    }

    for (i = 0; i < 6; i++)
    {
        if (p[i][0] == c)
        {
            x = p[i][2];

            if (x == c)
                x = p[i][3];

            if (x == '(')
                printf("( ");

            else if (x == 'i')
                printf("id ");

            else if (isupper(x))
                first(x);
        }
    }
}

int main()
{
    printf("FIRST(E) = { ");
    first('E');
    printf("}\n");

    printf("FIRST(T) = { ");
    first('T');
    printf("}\n");

    printf("FIRST(F) = { ");
    first('F');
    printf("}\n");

    return 0;
}
