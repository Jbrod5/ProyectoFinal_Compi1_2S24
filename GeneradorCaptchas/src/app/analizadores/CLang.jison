/* DEFINICIONES LEXICAS */
%{	
	
	
	const {Componente} = require ('../componentes/Componente');
	
	const { Body }     = require ('../componentes/Body')	;
	const { Br }       = require ('../componentes/Br')		;
	const { Button }   = require ('../componentes/Button')	;
	const { Div }      = require ('../componentes/Div')		;
	const { H1 }       = require ('../componentes/H1')		;
	const { Head }     = require ('../componentes/Head')	;
	const { Html }     = require ('../componentes/Html')	;
	const { Img }      = require ('../componentes/Img')		;
	const { Input }    = require ('../componentes/Input')	;
	const { Link }     = require ('../componentes/Link')	;
	const { Option }   = require ('../componentes/Option')	;
	const { P }        = require ('../componentes/P')		;
	const { Select }   = require ('../componentes/Select')	;
	const { Spam }     = require ('../componentes/Spam')	;
	const { TextArea } = require ('../componentes/TextArea');
	const { Title }    = require ('../componentes/Title')	;

	const {Parametro} = require('../componentes/Parametro')	;

	var parametros = [];



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


// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
// Parametros = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
parametros : parametro parametros {
				var params = $2; 
				var par = $1;
				var res = [];
				console.log("parametro: " + par)
				console.log(params);
				res.push(par);

				if(params != undefined && Array.isArray(params)){
					console.log('Params si es un arary!')
					params.forEach(p=>{
						res.push(p);
					});
				}
				$$ = res; 
			}
		   | /**/ { $$ = undefined;  };

parametro : href        { $$ = $1; }    | background  { $$ = $1; }   | color       { $$ = $1; }    
		  | font_size   { $$ = $1; }    | font_family { $$ = $1; }   | text_align  { $$ = $1; }    
		  | type        { $$ = $1; }    | id          { $$ = $1; }   | name        { $$ = $1; } 
		  | cols        { $$ = $1; }    | rows        { $$ = $1; }   | class       { $$ = $1; }  
		  | src         { $$ = $1; }    | width       { $$ = $1; }   | height      { $$ = $1; }
		  | onclick     { $$ = $1; };


href 		: CORIZQ HREF 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("HREF"		  , $5); }; 
background  : CORIZQ BACKGROUND IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("BACKGROUND" , $5); };
color		: CORIZQ COLOR 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("COLOR"	  , $5); };
font_size   : CORIZQ F_SIZE 	IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("FONT_SIZE"  , $5); };
font_family : CORIZQ F_FAM 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("FONT_FAMILY", $5); }; 
text_align  : CORIZQ TEXT_AL 	IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("TEXT_ALIGN" , $5); }; 
type        : CORIZQ TYPE 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("TIPO"       , $5); };  
id          : CORIZQ ID 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("ID"         , $5); };       
name        : CORIZQ NAME 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("NAME"       , $5); };      
cols        : CORIZQ COLS 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("COLS"       , $5); };   
rows        : CORIZQ ROWS 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("ROWS"       , $5); };     
class       : CORIZQ CLASS 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("CLASS"      , $5); };         
src         : CORIZQ SRC 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("SRC"        , $5); };     
width       : CORIZQ WIDTH 		IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("WIDTH"      , $5); };     
height      : CORIZQ HEIGHT 	IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("HEIGHT"     , $5); };    
onclick     : CORIZQ ONCLICK 	IGUAL COMILL VALOR COMILL CORDER{ $$ = new Parametro("ONCLICK"    , $5); };  


// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
// Etiquetas = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

etiquetas: etiqueta etiquetas {
				var etiquetas = $2;
				var et = $1;
				var res = [];

				if(et != undefined){
					res.push(et);
				}

				if(etiquetas != undefined && Array.isArray(etiquetas)){
					console.log("Etiquetas si es un array!");
					etiquetas.forEach(e=>{
						if(e != undefined){
							res.push(e);
						}
					})
				}
				$$ = res;
		 }
		 | etiqueta{
				var etiqueta = $1;
				var res = [];
				if(etiqueta != undefined){
					res.push(etiqueta);
				}
				$$ = res; 
		 };
etiqueta: head 
		| title  { $$ = $1; } | cc 	 { $$ = $1; }   | body 	 { $$ = $1; } 
		| div 	 { $$ = $1; } | select { $$ = $1; } | link 	 { $$ = $1; } 
		| spam 	 { $$ = $1; } | input  { $$ = $1; } | t_area { $$ = $1; } 
		| img 	 { $$ = $1; } | br 	   { $$ = $1; } | button { $$ = $1; } 
		| h1 	 { $$ = $1; } | P 	 { $$ = $1; } 
		| error {
			console.log('Error: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		};













valor : VALOR;

/* - - Sin parametros - - */
head  : MENQUE HEAD  MAYQUE etiquetas 		HEAD_FIN{
			var etiquetas = $4;
			var head = new Head();
			etiquetas.forEach(etiqueta =>{
				head.agregarComponente(etiqueta);
			});

			console.log(head.obtenerCodigo());
			$$ = head;
	  };
title : MENQUE TITLE MAYQUE valor     		TITLE_FIN{
			var valor = $4;
			var titulo = new Title();
			titulo.establecerValor(valor);
			console.log(titulo.obtenerCodigo());
			$$ = titulo; 
	  };





/* - - Con parametros - - */
// Con etiquetas
cc    : MENQUE CC      parametros MAYQUE etiquetas 		CC_FIN  {
			var parametros = $3;
			var etiquetas = $5;

			var html = new Html();

			//Establecer parametros
			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							html.establecerParametro(p.parametro, p.valor);
						}catch(error){

						}
					}
				});
			}
			//Agregar componentes
			if(etiquetas != undefined && Array.isArray(etiquetas)){
				etiquetas.forEach(e =>{
					if(e!=undefined){
						//Verificar si es un Head, Body o componente
						if(e instanceof Head){
							html.establecerHead(e);
						} else if(e instanceof Body){
							html.establecerBody(e);
						} else if(e instanceof Componente){
							html.agregarComponente(e)
						}
					}
				});
			}

			console.log(html.obtenerCodigo());
			$$ = html; 

	  };
body  : MENQUE BODY    parametros MAYQUE etiquetas 		BODY_FIN{
			var parametros = $3;
			var etiquetas = $5;

			var body = new Body();

			//Establecer parametros
			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							body.establecerParametro(p.parametro, p.valor);
						}catch(error){
						
						}
					}
				});
			}
			//Agregar componentes
			if(etiquetas != undefined && Array.isArray(etiquetas)){
				etiquetas.forEach(e =>{
					if(e!=undefined){
						//Verificar si es un componente
						if(e instanceof Componente){
							body.agregarComponente(e)
						}
					}
				});
			}
		
			console.log(body.obtenerCodigo());
			$$ = body; 
	  };
div   : MENQUE DIV     parametros MAYQUE etiquetas 		DIV_FIN {
			var parametros = $3;
			var etiquetas = $5;

			var div = new Div();

			//Establecer parametros
			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							div.establecerParametro(p.parametro, p.valor);
						}catch(error){
						
						}
					}
				});
			}
			//Agregar componentes
			if(etiquetas != undefined && Array.isArray(etiquetas)){
				etiquetas.forEach(e =>{
					if(e!=undefined){
						//Verificar si es un componente
						if(e instanceof Componente){
							div.agregarComponente(e)
						}
					}
				});
			}
		
			console.log(div.obtenerCodigo());
			$$ = div; 
	  };

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