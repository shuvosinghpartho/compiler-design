%{
#include "ArithmeticYProb.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+           { yylval = atoi(yytext); return NUMBER; }
[+\-*/()\n]      { return yytext[0]; }
[\t ]+           ; // ignore whitespace (tabs and spaces)
.                { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}