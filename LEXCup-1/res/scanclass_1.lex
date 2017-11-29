package pac1.parser;

import pac1.utils.*;
 
%%
 
%public  

%function nextToken

%class scanClass  

%{
private int contador;
%}

%init{
	contador = 0;
%init}

%eof{
%eof}

%line
%char


EXP_ALPHA=[a-zA-Z]
EXP_NUMBER=[0-9]
PALABRA=({EXP_ALPHA})+({EXP_NUMBER})*
NUMBER=("+"|"-"|\s*)({EXP_NUMBER})+
COMENTARIO="/""/"({EXP_ALPHA}|{EXP_NUMBER}|\t|\f|\s)*[\n|\r|\r\n]
LITERAL=\"({EXP_ALPHA}|{EXP_NUMBER}|\s|\t|\f|" ")*\"
WHATELSE=.

%%
{LITERAL} {contador++; return new Yytoken(contador,yytext(),"Literal",yyline,yychar);}
{COMENTARIO} {contador++; return new Yytoken(contador,yytext(),"Comentario",yyline,yychar);}
[Cc][Ll][Aa][Ss][Ss] {contador++; return new Yytoken(contador,yytext(),"Class",yyline,yychar);}
[Bb][Ee][Gg][Ii][Nn] {contador++; return new Yytoken(contador,yytext(),"Begin",yyline,yychar);}
[Pp][Uu][Bb][Ll][Ii][Cc] {contador++; return new Yytoken(contador,yytext(),"Public",yyline,yychar);}
[Ee][Nn][Dd] {contador++; return new Yytoken(contador,yytext(),"End",yyline,yychar);}
[Pp][Rr][Ii][Vv][Aa][Tt][Ee] {contador++; return new Yytoken(contador,yytext(),"Private",yyline,yychar);}
[Bb][Oo][Oo][Ll][Ee][Aa][Nn] {contador++; return new Yytoken(contador,yytext(),"Boolean",yyline,yychar);}
[Ss][Tt][Rr][Ii][Nn][Gg] {contador++; return new Yytoken(contador,yytext(),"String",yyline,yychar);}
[Ii][Nn][Tt][Ee][Gg][Ee][Rr] {contador++; return new Yytoken(contador,yytext(),"Integer",yyline,yychar);}
[Cc][Oo][Nn][Ss][Tt][Rr][Uu][Cc][Tt][Oo][Rr] {contador++; return new Yytoken(contador,yytext(),"Constructor",yyline,yychar);}
[Ii][Ff] {contador++; return new Yytoken(contador,yytext(),"If",yyline,yychar);}
[Tt][Hh][Ee][Nn] {contador++; return new Yytoken(contador,yytext(),"Then",yyline,yychar);}
[Ee][Ll][Ss][Ee] {contador++; return new Yytoken(contador,yytext(),"Else",yyline,yychar);}
[Ee][Nn][Dd][Ii][Ff] {contador++; return new Yytoken(contador,yytext(),"Endif",yyline,yychar);}
"TRUE" {contador++; return new Yytoken(contador,yytext(),"True",yyline,yychar);}
"FALSE" {contador++; return new Yytoken(contador,yytext(),"False",yyline,yychar);}
{NUMBER} {contador++; return new Yytoken(contador,yytext(),"Numero",yyline,yychar);}
{PALABRA} {contador++; return new Yytoken(contador,yytext(),"Palabra",yyline,yychar);}
"+" {contador++; return new Yytoken(contador,yytext(),"Mas",yyline,yychar);}
"-" {contador++; return new Yytoken(contador,yytext(),"Menos",yyline,yychar);}
"*" {contador++; return new Yytoken(contador,yytext(),"Mult",yyline,yychar);}
"/" {contador++; return new Yytoken(contador,yytext(),"Div",yyline,yychar);}
"&" {contador++; return new Yytoken(contador,yytext(),"Ampers",yyline,yychar);}
"|" {contador++; return new Yytoken(contador,yytext(),"Or",yyline,yychar);}
"==" {contador++; return new Yytoken(contador,yytext(),"Equal",yyline,yychar);} 
"< >" {contador++; return new Yytoken(contador,yytext(),"Diff",yyline,yychar);} 
"<" {contador++; return new Yytoken(contador,yytext(),"MenorQue",yyline,yychar);} 
">" {contador++; return new Yytoken(contador,yytext(),"MayorQue",yyline,yychar);} 
"^" {contador++; return new Yytoken(contador,yytext(),"Not",yyline,yychar);} 
"!" {contador++; return new Yytoken(contador,yytext(),"Neg",yyline,yychar);} 
"=" {contador++; return new Yytoken(contador,yytext(),"Asig",yyline,yychar);} 
";" {contador++; return new Yytoken(contador,yytext(),"PuntoComa",yyline,yychar);} 
"(" {contador++; return new Yytoken(contador,yytext(),"PartAbre",yyline,yychar);} 
")" {contador++; return new Yytoken(contador,yytext(),"PartCierra",yyline,yychar);} 
"," {contador++; return new Yytoken(contador,yytext(),"Comma",yyline,yychar);} 
[ \t\r\n\f] { /* ignore white space. */ } 
{WHATELSE} {contador++; return new Yytoken(contador,yytext(),"Unknow",yyline,yychar);}
