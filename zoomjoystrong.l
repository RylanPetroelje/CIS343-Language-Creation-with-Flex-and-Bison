%{
#include <stdio.h>
#include <stdlib.h>
#include "zoomjoystrong.tab.h"
#include "zoomjoystrong.h"
%}


%%
[ \t\n]+        {/*Ignore whitespace*/}
";"             {return END_STATEMENT;}
"="             {return EQUALS;}
"-"             {return MINUS;}
"+"             {return PLUS;}
"*"             {return MULT;}
"/"             {return DIV;}

END|end                 {return END;}
POINT|point             {return POINT;}
LINE|line               {return LINE;}
CIRCLE|circle           {return CIRCLE;}
RECTANGLE|rectangle     {return RECTANGLE;}
SET_COLOR|set_color     {return SET_COLOR;}

[0-9]+\.[0-9]+  {yylval.val = atof(yytext); return FLOAT;}
[0-9]+          {yylval.val = atoi(yytext); return INT;}

\$[A-Za-z]      { //Converts letters to an integer
                    if (yytext[1] >= 'a' && yytext[1] <= 'z') {
                        yylval.index = yytext[1] - 'a';
                    } else {
                        yylval.index = yytext[1] - 'A' + 26;
                    }
                    return VARIABLE;
                }

.               {fprintf(stderr, "Error: Unrecognized Character '%s'\n", yytext);} //Catch unrecognized characters
        
%%

int yywrap(void) {
    return 1;
}