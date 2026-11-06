/*
QUESTION:
11. Write a recursive descent parser for the grammar 
a. E->E+T 
   E->T 
   T->T*F
   T->F 
   F->(E)/id.

DESCRIPTION:
A recursive descent parser is a top-down parser where each grammar rule
becomes a function that calls other functions. The left recursion in E->E+T
and T->T*F is removed by using loops, so E() calls T() and keeps repeating
while it sees +, and T() calls F() while it sees *. F() accepts either the
letter a (standing for id) or an expression inside brackets. The input is
valid only if all rules are satisfied and the whole string is consumed.
Example: a+a*(a) is valid.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include <stdio.h>
#include <string.h>

char input[100];
int i = 0;
int error = 0;

void E();
void T();
void F();

void E()
{
    T();

    while(input[i] == '+')
    {
        i++;
        T();
    }
}

void T()
{
    F();

    while(input[i] == '*')
    {
        i++;
        F();
    }
}

void F()
{
    if(input[i] == 'a')
    {
        i++;
    }
    else if(input[i] == '(')
    {
        i++;
        E();

        if(input[i] == ')')
            i++;
        else
            error = 1;   // Missing closing bracket
    }
    else
    {
        error = 1;       // Invalid symbol
    }
}

int main()
{

    printf("Enter expression: ");
    scanf("%s", input);

    E();

    if(error == 0 && input[i] == '\0')
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}
