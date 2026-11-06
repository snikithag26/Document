/*
QUESTION:
1. Implementation of the symbol table.

DESCRIPTION:
A symbol table is a data structure used by a compiler to store information
about every identifier in a program, such as its name, data type and value.
Whenever the compiler meets a variable, it looks it up in this table. In this
program we create a structure called Symbol with three fields: name, type and
value. We read the details of n symbols from the user, store them in an array
of structures, and finally print them in a neat table form. This shows the
basic idea of how a compiler remembers variables.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include<stdio.h>
#include<string.h>

struct Symbol
{
    char name[20];
    char type[20];
    int value;
};

int main()
{
    struct Symbol table[100];
    int n, i;

    printf("Enter number of symbols: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++)
    {
        printf("\nEnter Symbol Name: ");
        scanf("%s", table[i].name);

        printf("Enter Data Type: ");
        scanf("%s", table[i].type);

        printf("Enter Value: ");
        scanf("%d", &table[i].value);
    }

    printf("\nSYMBOL TABLE\n");
    printf("Name\tType\tValue\n");

    for(i = 0; i < n; i++)
    {
        printf("%s\t%s\t%d\n",
               table[i].name,
               table[i].type,
               table[i].value);
    }

    return 0;
}
