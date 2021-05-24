%{
	int key=0,id=0,pun=0,fun=0,dir=0,opt=0,s=0,var=0,Digit=0;
        int Sind=0,Lind=0,i;
	struct Tab
	{
		char name[50];
                             		
	}Stab[50],Ltab[50];
%}

%%
#include[<]([A-Za-z0-9 ]+)*[.]([A-Za-z]+)*[>] {printf("\n\t preprocessor directives:=%s",yytext);dir=dir+1;}
printf|scanf {printf("\n\t System function:=%s",yytext); id=id+1;}
\"([%]*[A-Za-z0-9 ]+)*\" {printf("\n\tWord=%s",yytext);strcpy(Ltab[Lind].name,yytext);Lind=Lind+1;} 
[;|,] {printf("\n\tpunctuations:= %s",yytext);pun=pun+1;}
(([A-Z]+)*([a-z]+))*[(][)] {printf("\n\t function:=%s",yytext);fun=fun+1;}
if|else|while|do|for|until|elseif|char|void|int|float|string|boolean|long {printf("\n\t keyword:=%s",yytext);key=key+1;}
[a-z|A-Z]+ {printf("\n\t Variable:=%s",yytext);var=var+1;strcpy(Stab[Sind].name,yytext);Sind=Sind+1;}
[{|}|(|)] {printf("\n\t Symbol:=%s",yytext);s=s+1;}
[0-9] {printf("\n\tDigit:= %s",yytext);Digit=Digit+1;strcpy(Ltab[Lind].name,yytext);Lind=Lind+1;}
[+|-|*|=|<|>|/|&] {printf("\n\toperator= %s",yytext);opt=opt+1;}
%%

int main(int argc,char *argv[50])
{
	FILE *fp;
	fp=fopen(argv[1],"r");
	yyin=fp;
	yylex();
	
	printf("\n\tNumber of keywords=%d",key);
	printf("\n\tNumber of operators=%d",opt);
	printf("\n\tNumber of functions=%d",fun);
	printf("\n\tNumber of punctuations=%d",pun);
	printf("\n\tNumber of dirctives=%d",dir);
	printf("\n\tNumber of Variable=%d",var);
        printf("\n No      Symbol");
        for(i=0;i<Sind;i++)
            printf("\n %d   %s",i,Stab[i].name);
	printf("\n\n No     Literal");
        for(i=0;i<Lind;i++)
            printf("\n %d   %s",i,Ltab[i].name);

}
int yywrap()
{
return 1;
}

/*

Output
--------
compiler@linuxmint ~/Desktop/Ass2 $ cc lex.yy.c -ll
compiler@linuxmint ~/Desktop/Ass2 $ ./a.out input.c

	 preprocessor directives:=#include<conio.h>

	 keyword:=int 
	 function:=main()

	 Symbol:={

	
	 keyword:=int 
	 Variable:=i
	punctuations:= ,
	 Variable:=a
	punctuations:= ,
	 Variable:=b
	punctuations:= ,
	 Variable:=c
	punctuations:= ;
        
	 keyword:=char 
	 Variable:=st
	operator= =
	Word="asd"
	punctuations:= ;	
	
	 System function:=printf
	 Symbol:=(
	Word="\n\tHellow Good morning"
	 Symbol:=)
	punctuations:= ;
	
	 Variable:=a
	operator= =
	Digit:= 5
	punctuations:= ;
	
	 Variable:=b
	operator= =
	Digit:= 5
	punctuations:= ;
	
	 Variable:=c
	operator= =
	 Variable:=a
	operator= +
	 Variable:=b
	punctuations:= ;
	
	 Variable:=i
	operator= =
	Digit:= 1
	punctuations:= ;	
	
	 keyword:=while
	 Symbol:=(
	 Variable:=i
	operator= <
	Digit:= 5
	 Symbol:=)
              
	 System function:=printf
	 Symbol:=(
	Word="Hellow"
	 Symbol:=)
	punctuations:= ;  
	

	 Symbol:=}

	Number of keywords=4
	Number of operators=7
	Number of functions=1
	Number of punctuations=11
	Number of dirctives=1
	Number of Variable=12

 No      Symbol
 0   i
 1   a
 2   b
 3   c
 4   st
 5   a
 6   b
 7   c
 8   a
 9   b
 10   i
 11   i

 No     Literal
 0   "asd"
 1   "\n\tHellow Good morning"
 2   5
 3   5
 4   1
 5   5
 6   "Hellow"
*/





