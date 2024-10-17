/* DEFINICIONES LEXICAS */
%lex

%% 
/* - - - - - - - - - - - - - - EXPRESIONES REGULARES - - - - - - - - - - - - - - */ 

[ \r\t\n]     {/*ignorar*/}

// SIMBOLOS - - - - - - - - - - - - - - - - - -
"<"  	       return 'MENQUE'
">"  	       return 'MAYQUE'
"["  	       return 'CORIZQ'
"]"  	       return 'CORDER'
"="  	       return 'IGUAL'
"/"  	       return 'BARRA'
("“"|"”"|"\"") return 'COMILL'

// ETIQUETAS - - - - - - - - - - - - - - - - -
"C_CC" 			return 'CC'
"C_HEAD" 		return 'HEAD'
"C_TITLE"	    return 'TITLE'
"C_LINK" 		return 'LINK'
"C_BODY"	    return 'BODY'
"C_SPAM" 		return 'SPAM'
"C_INPUT" 		return 'INPUT'
"C_TEXTAREA" 	return 'TEXTAREA'
"C_SELECT" 		return 'SELECT'
"C_OPTION" 		return 'OPTION'
"C_DIV" 		return 'DIV'
"C_IMG" 		return 'IMG'
"C_BR" 			return 'BR'
"C_BUTTON" 		return 'BUTTON'
"C_H1" 			return 'H1'
"C_P" 			return 'P'
"C_SCRIPTING"   return 'SCRIPTING'

("<"[ \r\t\n]*"/"[ \r\t\n]*"C_CC"[\r\t\n]*">")\b 		return 'CC_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_HEAD"[\r\t\n]*">")\b 		return 'HEAD_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_TITLE"[\r\t\n]*">")\b 	return 'TITLE_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_LINK"[\r\t\n]*">")\b 		return 'LINK_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BODY"[\r\t\n]*">")\b 		return 'BODY_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SPAM"[\r\t\n]*">")\b 		return 'SPAM_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_INPUT"[\r\t\n]*">")\b 	return 'INPUT_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_TEXTAREA"[\r\t\n]*">")\b 	return 'TEXTAREA_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SELECT"[\r\t\n]*">")\b 	return 'SELECT_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_OPTION"[\r\t\n]*">")\b 	return 'OPTION_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_DIV"[\r\t\n]*">")\b 		return 'DIV_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_IMG"[\r\t\n]*">")\b 		return 'IMG_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BR"[\r\t\n]*">")\b 		return 'BR_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BUTTON"[\r\t\n]*">")\b 	return 'BUTTON_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_H1"[\r\t\n]*">")\b 		return 'H1_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_P"[\r\t\n]*">")\b 		return 'P_FIN'
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SCRIPTING"[\r\t\n]*">")\b return 'SCRIPTING_FIN'

// PARAMETROS - - - - - - - - - - - - - - - - - 
"href"        return 'HREF'   
"background"  return 'BACKGROUND'   
"color"       return 'COLOR'   
"font-size"   return 'F_SIZE'     
"font-family" return 'F_FAM'    
"text-align"  return 'TEXT_AL'  
"type"        return 'TYPE'     
"id"          return 'ID' 
"name"        return 'NAME'         
"cols"        return 'COLS'    
"rows"        return 'ROWS' 
"class"       return 'CLASS' 
"src"         return 'SRC' 
"width"       return 'WIDTH'      
"height"      return 'HEIGHT'     
"onclick()"   return 'ONCLICK'   



//OTROS - - - - - - - - - - - - - - - - - - - -
[a-zA-Z0-9.#/%_()]+         return 'VALOR'
<<EOF>>                     return 'EOF'
.                           return 'INVALID'


/lex
%start inicio
	%{ 
		//Codigo javascript incrustado
		function mostrarToken(mensaje){
			console.log("Token: " + mensaje);
		}
	%}

%% 
/* - - - - - - - - - - - - - - - - PRODUCCIONES  - - - - - - - - - - - - - - - - */


inicio: cc EOF;



// Parametros - - - - - - - - - - -
parametros : parametro parametros |/**/;
parametro : href | background | color | font_size | font_family | text_align | type | id | name | cols | rows | class | src | width | height | onclick;

href 		: CORIZQ HREF 		IGUAL COMILL VALOR COMILL CORDER; 
background  : CORIZQ BACKGROUND IGUAL COMILL VALOR COMILL CORDER;
color		: CORIZQ COLOR 		IGUAL COMILL VALOR COMILL CORDER;
font_size   : CORIZQ F_SIZE 	IGUAL COMILL VALOR COMILL CORDER;
font_family : CORIZQ F_FAM 		IGUAL COMILL VALOR COMILL CORDER; 
text_align  : CORIZQ TEXT_AL 	IGUAL COMILL VALOR COMILL CORDER; 
type        : CORIZQ TYPE 		IGUAL COMILL VALOR COMILL CORDER;  
id          : CORIZQ ID 		IGUAL COMILL VALOR COMILL CORDER;       
name        : CORIZQ NAME 		IGUAL COMILL VALOR COMILL CORDER;      
cols        : CORIZQ COLS 		IGUAL COMILL VALOR COMILL CORDER;   
rows        : CORIZQ ROWS 		IGUAL COMILL VALOR COMILL CORDER;     
class       : CORIZQ CLASS 		IGUAL COMILL VALOR COMILL CORDER;         
src         : CORIZQ SRC 		IGUAL COMILL VALOR COMILL CORDER;     
width       : CORIZQ WIDTH 		IGUAL COMILL VALOR COMILL CORDER;     
height      : CORIZQ HEIGHT 	IGUAL COMILL VALOR COMILL CORDER;    
onclick     : CORIZQ ONCLICK 	IGUAL COMILL VALOR COMILL CORDER;  




etiquetas: etiqueta etiquetas | etiqueta;
etiqueta: head | title | cc | body | div | select | link | spam | input | t_area | img | br | button | h1 | P | error {
	console.log('Error: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
};

valor : VALOR;


/* Sin parametros */
head  : MENQUE HEAD  MAYQUE etiquetas 		HEAD_FIN;
title : MENQUE TITLE MAYQUE valor     		TITLE_FIN;

/* - - Con parametros - - */
// Con etiquetas
cc    : MENQUE CC      parametros MAYQUE etiquetas 		CC_FIN  ;
body  : MENQUE BODY    parametros MAYQUE etiquetas 		BODY_FIN;
div   : MENQUE DIV     parametros MAYQUE etiquetas 		DIV_FIN ;

select: MENQUE SELECT  parametros MAYQUE opciones  		SELECT_FIN; //Solo etiquetas option
option  : MENQUE OPTION MAYQUE valor 					OPTION_FIN;
options : option options | option ;


//Sin etiquetas
link  : MENQUE LINK     parametros MAYQUE valor     LINK_FIN	;
spam  : MENQUE SPAM     parametros MAYQUE valor     SPAM_FIN	; 
input : MENQUE INPUT    parametros MAYQUE valor 	INPUT_FIN	; 
t_area: MENQUE TEXTAREA parametros MAYQUE valor     TEXTAREA_FIN;
img   : MENQUE IMG      parametros MAYQUE;
br    : MENQUE BR 				   MAYQUE 
	  | MENQUE BARRA BR 		   MAYQUE;
button: MENQUE BUTTON 	parametros MAYQUE valor     BUTTON_FIN;
h1    : MENQUE H1       parametros MAYQUE valor     H1_FIN	  ;
P     : MENQUE P        parametros MAYQUE valor     P_FIN	  ; 