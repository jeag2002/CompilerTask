package pac2;

import java_cup.runtime.Symbol;
import java.io.*;

class symbol{
	public String lex;
	
	public symbol (String str) {
		lex = new String(str);
	}
	
}

%%

%eofval{
  return new java_cup.runtime.Symbol(Pac2Sym.EOF);
%eofval}

%{
public int contador;
%}

%init{
	contador = 0;
%init}


%cup
%full
%ignorecase

%line
%char

EXP_ALPHA=[a-zA-Z]
EXP_NUMBER=[0-9]
PALABRA=({EXP_ALPHA})+({EXP_NUMBER})*
NUMBER= ({EXP_NUMBER})+
NUMBERMAS = ("+"|"-")({EXP_NUMBER})
COMENTARIO="/""/"[^\r\n]*
LITERAL=\"[^\r\n]*\"
WHATELSE=.

%%
<YYINITIAL>{LITERAL} 		{	return new Symbol(Pac2Sym.TK_LITERAL);}
<YYINITIAL>{COMENTARIO}     {   return new Symbol(Pac2Sym.TK_COMENTARIO);}
<YYINITIAL>CLASS 			{   return new Symbol(Pac2Sym.TK_CLASS);}
<YYINITIAL>BEGIN		 	{   return new Symbol(Pac2Sym.TK_BEGIN);}
<YYINITIAL>END	 			{   return new Symbol(Pac2Sym.TK_END);}
<YYINITIAL>INTEGER 			{   return new Symbol(Pac2Sym.TK_INTEGER);}
<YYINITIAL>PUBLIC	 		{   return new Symbol(Pac2Sym.TK_PUBLIC);}
<YYINITIAL>STRING	 		{	return new Symbol(Pac2Sym.TK_STRING);}
<YYINITIAL>BOOLEAN	 		{	return new Symbol(Pac2Sym.TK_BOOLEAN);}
<YYINITIAL>CONSTRUCTOR		{	return new Symbol(Pac2Sym.TK_CONSTRUCTOR);}

<YYINITIAL>IF 				{ 	return new Symbol(Pac2Sym.TK_IF);}
<YYINITIAL>THEN 			{ 	return new Symbol(Pac2Sym.TK_THEN);}
<YYINITIAL>ELSE 			{ 	return new Symbol(Pac2Sym.TK_ELSE);}
<YYINITIAL>ENDIF 			{ 	return new Symbol(Pac2Sym.TK_ENDIF);}

<YYINITIAL>TRUE|FALSE 		{ 										}
<YYINITIAL>{PALABRA} 		{	return new Symbol(Pac2Sym.TK_WORD, new symbol(yytext()));}
<YYINITIAL>{NUMBER} 		{	return new Symbol(Pac2Sym.TK_NUMBER, new symbol(yytext()));}
<YYINITIAL>{NUMBERMAS} 		{	return new Symbol(Pac2Sym.TK_NUMBERMAS, new symbol(yytext()));}
<YYINITIAL>"=" 				{	return new Symbol(Pac2Sym.TK_ASIG);} 
<YYINITIAL>";" 				{	return new Symbol(Pac2Sym.TK_DOTCOMMA);} 
<YYINITIAL>"(" 				{   return new Symbol(Pac2Sym.TK_PAROPEN);} 
<YYINITIAL>")"				{	return new Symbol(Pac2Sym.TK_PARCLOSE);} 
<YYINITIAL>"," 				{	return new Symbol(Pac2Sym.TK_COMMA);} 

<YYINITIAL>"+" 				{ 	return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"-" 				{ 	return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"*" 				{ 	return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"/" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"&" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"|" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"<" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>">" 				{ 	return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"<>" 			{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"!" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>"^" 				{   return new Symbol(Pac2Sym.TK_OP);}
<YYINITIAL>[ \t\r\n\f] 		{   /* ignore white space. */ } 
<YYINITIAL>{WHATELSE} 		{	contador++;}

