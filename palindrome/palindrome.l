%{
#include "palindrome.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[a-zA-Z]+      { yylval.str = strdup(yytext); return WORD; }
\n             { return NEWLINE; }
.              ; // Ignore everything else
%%

int yywrap(void) {
    return 1;
}
