/*
QUESTION:
2. Develop a lexical analyzer to recognize a few patterns in C (ex.
Identifiers, constants, comments, operators etc.)

DESCRIPTION:
A lexical analyzer (lexer) is the first phase of a compiler. It reads the
source code and breaks it into small meaningful units called tokens, such as
keywords, identifiers, constants and operators. This program reads the
statement word by word (separate tokens with spaces, e.g. int a = 10 ;). Each
word is checked: if it matches int, float, char or double it is a keyword; if
it starts with a letter it is an identifier; if it starts with a digit it is a
constant; and symbols like + - * / = are operators. A semicolon is reported as
a special symbol.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
    char token[20];
    int len;

    printf("Enter statement: ");

    while(scanf("%s", token) != EOF)
    {
        len = strlen(token);

        if(token[len-1] == ';')
        {
            token[len-1] = '\0';   // Remove ';'
        }

        if(strcmp(token,"int")==0 || strcmp(token,"float")==0 ||
           strcmp(token,"char")==0 || strcmp(token,"double")==0)
            printf("%s - Keyword\n", token);

        else if(isalpha(token[0]))
            printf("%s - Identifier\n", token);

        else if(isdigit(token[0]))
            printf("%s - Constant\n", token);

        else if(strcmp(token,"+")==0 || strcmp(token,"-")==0 ||
                strcmp(token,"*")==0 || strcmp(token,"/")==0 ||
                strcmp(token,"=")==0)
            printf("%s - Operator\n", token);

        if(len > 0 && token[len-1] == '\0')
        {
            printf("; - Special Symbol\n");
            break;
        }
    }

    return 0;
}
