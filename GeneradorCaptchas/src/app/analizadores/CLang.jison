/* DEFINICIONES LEXICAS */
%{	
	/*
	
	import { Componente } from "../componentes/Componente";
	
	import { Body } from "../componentes/Body";
	import { Br } from "../componentes/Br";
	import { Button } from "../componentes/Button";
	import { Div } from "../componentes/Div";
	import { H1 } from "../componentes/H1";
	import { Head } from "../componentes/Head";
	import { Html } from "../componentes/Html";
	import { Img } from "../componentes/Img";
	import { Input } from "../componentes/Input";
	import { Link } from "../componentes/Link";
	import { Option } from "../componentes/Option";
	import { P } from "../componentes/P";
	import { Select } from "../componentes/Select";
	import { Spam } from "../componentes/Spam";
	import { TextArea } from "../componentes/TextArea";
	import { Title } from "../componentes/Title";
	
	*/

%}
%lex

%% 
/* - - - - - - - - - - - - - - EXPRESIONES REGULARES - - - - - - - - - - - - - - */ 

[ \r\t\n]     {/*ignorar*/}

// ETIQUETAS - - - - - - - - - - - - - - - - -
"C_CC" 			{ mostrarToken('CC'			, yytext);   return 'CC';  	     }
"C_HEAD" 		{ mostrarToken('HEAD'		, yytext);   return 'HEAD';      }
"C_TITLE"	    { mostrarToken('TITLE'		, yytext);	 return 'TITLE';     }
"C_LINK" 		{ mostrarToken('LINK'		, yytext);	 return 'LINK';      }
"C_BODY"	    { mostrarToken('BODY'		, yytext);	 return 'BODY';      }
"C_SPAM" 		{ mostrarToken('SPAM'		, yytext);	 return 'SPAM';      }
"C_INPUT" 		{ mostrarToken('INPUT'		, yytext);	 return 'INPUT';     }
"C_TEXTAREA" 	{ mostrarToken('TEXTAREA'	, yytext);	 return 'TEXTAREA';  }
"C_SELECT" 		{ mostrarToken('SELECT'		, yytext);	 return 'SELECT'; 	 }
"C_OPTION" 		{ mostrarToken('OPTION'		, yytext);	 return 'OPTION'; 	 }
"C_DIV" 		{ mostrarToken('DIV'		, yytext);	 return 'DIV'; 		 }
"C_IMG" 		{ mostrarToken('IMG'		, yytext);	 return 'IMG'; 		 }
"C_BR" 			{ mostrarToken('BR'			, yytext);	 return 'BR'; 		 }
"C_BUTTON" 		{ mostrarToken('BUTTON'		, yytext);	 return 'BUTTON'; 	 }
"C_H1" 			{ mostrarToken('H1'			, yytext);	 return 'H1'; 		 }
"C_P" 			{ mostrarToken('P'			, yytext);	 return 'P'; 		 }
"C_SCRIPTING"   { mostrarToken('SCRIPTING'	, yytext);   return 'SCRIPTING'; }

("<"[ \r\t\n]*"/"[ \r\t\n]*"C_CC"[\r\t\n]*">") 			{ mostrarToken('CC_FIN'       , yytext);	 return 'CC_FIN';	    }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_HEAD"[\r\t\n]*">") 		{ mostrarToken('HEAD_FIN'     , yytext);	 return 'HEAD_FIN';     }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_TITLE"[\r\t\n]*">") 		{ mostrarToken('TITLE_FIN'    , yytext);	 return 'TITLE_FIN';    }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_LINK"[\r\t\n]*">") 		{ mostrarToken('LINK_FIN'     , yytext);	 return 'LINK_FIN';     }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BODY"[\r\t\n]*">") 		{ mostrarToken('BODY_FIN'     , yytext);	 return 'BODY_FIN';     }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SPAM"[\r\t\n]*">") 		{ mostrarToken('SPAM_FIN'     , yytext);     return 'SPAM_FIN';     }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_INPUT"[\r\t\n]*">") 		{ mostrarToken('INPUT_FIN'    , yytext);     return 'INPUT_FIN';    }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_TEXTAREA"[\r\t\n]*">")	{ mostrarToken('TEXTAREA_FIN' , yytext);     return 'TEXTAREA_FIN'; }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SELECT"[\r\t\n]*">") 		{ mostrarToken('SELECT_FIN'   , yytext);     return 'SELECT_FIN';   }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_OPTION"[\r\t\n]*">") 		{ mostrarToken('OPTION_FIN'   , yytext);     return 'OPTION_FIN';   }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_DIV"[\r\t\n]*">") 		{ mostrarToken('DIV_FIN'      , yytext);	 return 'DIV_FIN';      }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_IMG"[\r\t\n]*">") 		{ mostrarToken('IMG_FIN'      , yytext);	 return 'IMG_FIN';      }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BR"[\r\t\n]*">") 			{ mostrarToken('BR_FIN'       , yytext);	 return 'BR_FIN';       }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_BUTTON"[\r\t\n]*">") 		{ mostrarToken('BUTTON_FIN'   , yytext);     return 'BUTTON_FIN';   }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_H1"[\r\t\n]*">") 			{ mostrarToken('H1_FIN'       , yytext);	 return 'H1_FIN';       }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_P"[\r\t\n]*">") 			{ mostrarToken('P_FIN'        , yytext);	 return 'P_FIN';        }
("<"[ \r\t\n]*"/"[ \r\t\n]*"C_SCRIPTING"[\r\t\n]*">")   { mostrarToken('SCRIPTING_FIN', yytext);     return 'SCRIPTING_FIN';}

// SIMBOLOS - - - - - - - - - - - - - - - - - -
"<"  	       { mostrarToken("MENQUE", yytext); return 'MENQUE'; }
">"  	       { mostrarToken("MAYQUE", yytext); return 'MAYQUE'; }
"["  	       { mostrarToken("CORIZQ", yytext); return 'CORIZQ'; }
"]"  	       { mostrarToken("CORDER", yytext); return 'CORDER'; }
"="  	       { mostrarToken("IGUAL" , yytext);  return 'IGUAL'; }
"/"  	       { mostrarToken("BARRA" , yytext);  return 'BARRA'; }
("“"|"”"|"\"") { mostrarToken("COMILL", yytext); return 'COMILL'; }

// PARAMETROS - - - - - - - - - - - - - - - - - 
"href"        { mostrarToken('HREF'		 , yytext);   return 'HREF';	  }   
"background"  { mostrarToken('BACKGROUND', yytext);   return 'BACKGROUND';}   
"color"       { mostrarToken('COLOR'	 , yytext);   return 'COLOR';	  }   
"font-size"   { mostrarToken('F_SIZE'	 , yytext);   return 'F_SIZE';	  }     
"font-family" { mostrarToken('F_FAM' 	 , yytext);   return 'F_FAM';	  }    
"text-align"  { mostrarToken('TEXT_AL'	 , yytext);   return 'TEXT_AL';	  }  
"type"        { mostrarToken('TYPE'		 , yytext);   return 'TYPE';	  }     
"id"          { mostrarToken('ID'		 , yytext);   return 'ID';		  } 
"name"        { mostrarToken('NAME'		 , yytext);   return 'NAME';      }         
"cols"        { mostrarToken('COLS' 	 , yytext);   return 'COLS';      }    
"rows"        { mostrarToken('ROWS'		 , yytext);   return 'ROWS';      } 
"class"       { mostrarToken('CLASS'	 , yytext);   return 'CLASS';     } 
"src"         { mostrarToken('SRC'		 , yytext);   return 'SRC';       } 
"width"       { mostrarToken('WIDTH'	 , yytext);   return 'WIDTH';     }      
"height"      { mostrarToken('HEIGHT'	 , yytext);   return 'HEIGHT';    }     
"onclick()"   { mostrarToken('ONCLICK'	 , yytext);   return 'ONCLICK';   }   



//OTROS - - - - - - - - - - - - - - - - - - - -
[a-zA-Z0-9.#/%_()]+         {mostrarToken("VALOR", yytext); return 'VALOR';}
<<EOF>>                     return 'EOF'
.                           return 'INVALID'


/lex
%start inicio
	%{ 
		//Codigo javascript incrustado
		function mostrarToken(mensaje, token){
			console.log("Token: " + mensaje + " | Valor: " + token);
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

// Etiquetas - - - - - - - - - - - -
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