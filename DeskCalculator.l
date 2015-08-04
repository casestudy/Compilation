/*comment*/

%{
#define YYSTYPE double
#include "calc.tab.h"
#include <stdlib.h>
%}

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%

{white} { }
{real} { yylval=atof(yytext); 
 return NUMBER;
}

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"^" return POWER;
"(" return LEFT;
")" return RIGHT;
"%" return MODULO ;
"cos" return COS ;
"COS" return COS;
"sin" return SIN;
"SIN" return SIN;
"fact" return FACT;
"FACT" return FACT ;
"\n" return END;

%%
