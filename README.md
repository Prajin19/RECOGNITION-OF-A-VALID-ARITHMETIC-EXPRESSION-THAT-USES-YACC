# Ex. No : 3	
# RECOGNITION OF A VALID ARITHMETIC EXPRESSION THAT USES YACC
## Name : Prajin S
## Register Number : 212223230151
## Date : 25-05-2026

## AIM   
To write a yacc program to recognize a valid arithmetic expression that uses operator +,- ,* and /.

## ALGORITHM
1.	Start the program.
2.	Write a program in the vi editor and save it with .l extension.
3.	In the lex program, write the translation rules for the operators =,+,-,*,/ and for the identifier.
4.	Write a program in the vi editor and save it with .y extension.
5.	Compile the lex program with lex compiler to produce output file as lex.yy.c. eg $ lex filename.l
6.	Compile the yacc program with yacc compiler to produce output file as y.tab.c. eg $ yacc –d arith_id.y
7.	Compile these with the C compiler as gcc lex.yy.c y.tab.c
8.	Enter an arithmetic expression as input and the tokens are identified as output.

## PROGRAM
#### arth.l
```l
%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token ID PLUS MINUS MULTIPLICATION DIVISION

%%

statement:
      ID '=' E
      {
          printf("\nValid arithmetic expression\n");
      }
      ;

E:
      E PLUS ID
    | E MINUS ID
    | E MULTIPLICATION ID
    | E DIVISION ID
    | ID
    ;

%%

extern FILE *yyin;

int main()
{
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}
```
#### arth.y
```y
%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token ID PLUS MINUS MULTIPLICATION DIVISION

%%

statement:
      ID '=' E
      {
          printf("\nValid arithmetic expression\n");
      }
      ;

E:
      E PLUS ID
    | E MINUS ID
    | E MULTIPLICATION ID
    | E DIVISION ID
    | ID
    ;

%%

extern FILE *yyin;

int main()
{
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}
```

## OUTPUT 
<img width="355" height="206" alt="image" src="https://github.com/user-attachments/assets/9fec8c14-2938-47f5-9c9a-cc7bd8dad936" />

## RESULT
A YACC program to recognize a valid arithmetic expression that uses operator +,-,* and / is executed successfully and the output is verified.
