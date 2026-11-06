/*
QUESTION:
10. Implement any one storage allocation strategy (heap, stack, static)

DESCRIPTION:
Storage allocation decides where and how a program's data is kept in memory at
run time. In stack allocation, memory is given and taken back in Last-In-
First-Out order, which is how function calls and local variables work. This
program simulates a stack using an array of size 5. PUSH adds an element on
top, POP removes the top element, and DISPLAY shows all elements. It also
reports Stack Overflow when the stack is full and Stack Underflow when it is
empty. The variable top always points to the last inserted element.

HOW TO RUN:
gcc FILE.c -o prog
./prog
*/

#include <stdio.h>
#define MAX 5

int stack[MAX];
int top = -1;

void push()
{
    int element;

    if (top == MAX - 1)
        printf("Stack Overflow\n");
    else
    {
        printf("Enter element: ");
        scanf("%d", &element);
        top++;
        stack[top] = element;
        printf("Element inserted: %d\n", element);
    }
}

void pop()
{
    if (top == -1)
        printf("Stack Underflow\n");
    else
    {
        printf("Deleted element: %d\n", stack[top]);
        top--;
    }
}

void display()
{
    int i;

    if (top == -1)
        printf("Stack is empty\n");
    else
    {
        printf("Stack elements:\n");
        for (i = top; i >= 0; i--)
            printf("%d\n", stack[i]);
    }
}

int main()
{
    int choice;

    printf("Stack Storage Allocation\n");

    while (1)
    {
        printf("\n1. PUSH");
        printf("\n2. POP");
        printf("\n3. DISPLAY");
        printf("\n4. EXIT");
        printf("\nEnter choice: ");

        scanf("%d", &choice);

        switch (choice)
        {
            case 1: push(); break;
            case 2: pop(); break;
            case 3: display(); break;
            case 4: return 0;
            default: printf("Invalid choice\n");
        }
    }

    return 0;
}
