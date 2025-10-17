
%{
#include <stdio.h>
#include <stdlib.h>
#include "zoomjoystrong.h"

int yylex(void);
void yyerror(char const *s);

// Stores variables
double variables[52];
%}

// Define types of data tokens can hold
%union {
    double val;
    int index;
}

// Declare tokens
%token <val> INT FLOAT
%token <index> VARIABLE
%token END END_STATEMENT POINT LINE CIRCLE RECTANGLE SET_COLOR EQUALS
%token PLUS MINUS MULT DIV 

// Grammar rules
%type <val> expression

%%

program:
    /*empty*/
    statement_list
    ;

statement_list:
    /*empty*/
    |
    statement_list statement
    ;

statement:
POINT expression expression END_STATEMENT  { point($2, $3); }
| LINE expression expression expression expression END_STATEMENT { line($2, $3, $4, $5); }
| CIRCLE expression expression expression END_STATEMENT { circle($2, $3, $4); }
| RECTANGLE expression expression expression expression END_STATEMENT { rectangle($2, $3, $4, $5); }
| SET_COLOR expression expression expression END_STATEMENT { 
    if ($2 < 0 || $2 > 255 || $3 < 0 || $3 > 255 || $4 < 0 || $4 > 255) {
        yyerror("Error: Color vals must be between 0 and 255");
    } else {
        set_color($2, $3, $4);
    }
}
| VARIABLE EQUALS expression END_STATEMENT { variables[$1] = $3; }
| END_STATEMENT { }
| END { finish(); return 0; }
;

expression:
    INT                             {$$ = $1;}
    | FLOAT                         {$$ = $1;}
    | VARIABLE                      {$$ = variables[$1];}
    | expression PLUS expression    {$$ = $1 + $3;}
    | expression MINUS expression   {$$ = $1 - $3;}
    | expression MULT expression    {$$ = $1 * $3;}
    | expression DIV expression     { if ($3 != 0) {$$ = $1 / $3;}
                                      else { yyerror("Error: Division by zero");
                                      $$ = 0;
                                      }
                                    }
;

%%

#include <stdio.h>

void yyerror(char const *s) {
    fprintf(stderr, "%s\n", s);
}

int main (int argc, char **argv) {
    setup();

    for (int i = 0; i < 52; i++) {
        variables[i] = 0.0;
    }

    yyparse();

    finish();

    return 0;
}