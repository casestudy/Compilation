%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define YYSTYPE double
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT RIGHT
%token END
%token COS SIN FACT

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG
%right POWER
%right MODULO
%right COS SIN FACT

%start Input

%%

Input:
    
     | Input Line
;

Line:
     END
     | Expression END { printf("Result: %lf\n\n", $1); }
;

Expression:
     NUMBER { $$=$1; }
| Expression PLUS Expression { $$=$1+$3; }
| Expression MINUS Expression { $$=$1-$3; }
| Expression TIMES Expression { $$=$1*$3; }
| Expression DIVIDE Expression { $$=$1/$3; }
| MINUS Expression %prec NEG { $$=-$2; }
| Expression POWER Expression { $$=pow($1,$3); }
| Expression MODULO Expression {$$ = fmod($1,$3) ;}
| LEFT Expression RIGHT { $$=$2; }
| COS LEFT Expression RIGHT { $$ = cos($3) ; }
| SIN LEFT Expression RIGHT { $$ = sin($3) ; }
| FACT LEFT Expression RIGHT { $$ = fact((int) $3); }
;

%%

int yyerror(char *s) {
  printf("%s\n", s);
}

int main() {

	printf("\n\nPermission is hereby granted, free of charge, to any person obtaining a copy \nof this software and associated documentation files (the \"Software\"), to deal \nin the Software without restriction, including without limitation the rights \nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell \ncopies of the Software, and to permit persons to whom the Software is \nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in \nall copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS \nOR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, \nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE \nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER \nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, \nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\nThis Software is developed by Femencha Azombo Fabrice, Student of the University of Buea, \nin collaboration with Dr. Williams Shu as supervisor.\nContact me at femenchaazombofabrice@gmail.com or \nDr. Williams Shu, Proffessor at the University of Buea \nwsshu@yahoo.com, before the usage of this software.\n\n\n");
	
  if (yyparse())
     fprintf(stderr, "Successful parsing.\n");
  else
     fprintf(stderr, "error found.\n");
}

int fact(int n){

	if (n > 1)
	{
		return (n * fact(n - 1)) ;
	}
	else
	{
		return 1 ;
	}
}
