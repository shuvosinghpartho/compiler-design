%{
#include "squarecalc.tab.h"
%}

%%

[0-9]+         { yylval.num = atoi(yytext); return NUMBER; }
"^2"           { return SQUARE; }
[ \t\r]+       ; // Skip spaces and tabs
\n             { return NEWLINE; }
"+"            { return '+'; }
"*"            { return '*'; }
"("            { return '('; }
")"            { return ')'; }
.              { return yytext[0]; }

%%

int yywrap() {
    return 1;
}