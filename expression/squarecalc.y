%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int num;
}

%token <num> NUMBER
%token SQUARE
%token NEWLINE

%type <num> expr term line

%left '+' 
%left '*'
%right SQUARE

%%

input:
      /* empty */
    | input line
    ;

line:
      expr NEWLINE    { printf("= %d\n", $1); }
    ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | '(' expr ')'    { $$ = $2; }
    | term            { $$ = $1; }
    ;

term:
      NUMBER              { $$ = $1; }
    | NUMBER SQUARE       { $$ = $1 * $1; }
    ;

%%

int main() {
    printf("Enter a series (e.g., 1^2 + 2^2 + 3^2):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
