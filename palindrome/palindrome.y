%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int yylex(void);
void yyerror(const char *s);

int isPalindrome(const char *str);
%}

%union {
    char *str;
}

%token <str> WORD
%token NEWLINE


%%

input:
      /* empty */
    | input line
    ;

line:
      WORD NEWLINE {
          if (isPalindrome($1)) {
              printf("\"%s\" is a Palindrome\n", $1);
          } else {
              printf("\"%s\" is NOT a Palindrome\n", $1);
          }
          free($1);
      }
    ;

%%

int main() {
    printf("Enter a word to check for palindrome (Ctrl+C to exit):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int isPalindrome(const char *str) {
    int left = 0;
    int right = strlen(str) - 1;
    while (left < right) {
        if (tolower(str[left]) != tolower(str[right])) {
            return 0;
        }
        left++;
        right--;
    }
    return 1;
}
