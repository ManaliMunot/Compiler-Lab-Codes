ALPHA [A-Za-z]
DIGIT [0-9]
%{
#include"y.tab.h"
%}
%%
{ALPHA}({ALPHA}|{DIGIT})* return ID;
{DIGIT}+ {yylval=atoi(yytext);return NUM;}
[\n\t] yyterminate();
. return yytext[0];
%%
int yywrap()
{
return 1;
}