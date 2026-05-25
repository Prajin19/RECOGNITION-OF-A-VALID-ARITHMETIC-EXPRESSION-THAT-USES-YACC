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
