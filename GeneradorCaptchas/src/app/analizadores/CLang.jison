/* DEFINICIONES LEXICAS */
%{	
	const {HttpClient, HttpHeaders} = require('@angular/common/http');
	
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
%options case-insensitive

%% 
/* - - - - - - - - - - - - - - EXPRESIONES REGULARES - - - - - - - - - - - - - - */ 

[ \r\t\n]     {/*ignorar*/}
"!!".*        	   {mostrarSintactico("Comentario: " + yytext);}
//["--" .*  "-->"]\b {mostrarSintactico("Comentario: " + yytext);}

"<C_SCRIPTING>"([\s\S]*?)"</C_SCRIPTING>" { mostrarToken("SCRIPT", yytext); return 'SCRIPT'; }
"<!--"([\s\S]*?)"-->"                     { mostrarSintactico("Comentario: " + yytext); }

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
//"Comentarios  
"!"			   {mostrarToken("EXCLAM", yytext); return 'EXCLAM'; }
"-"			   {mostrarToken("MINUS", yytext);  return 'MENOS'; }

//Scripting
//"|"            {mostrarToken("ORSIMB",yytext); return 'ORSIMB'; }
//"&"            {mostrarToken("AMPERS",yytext); return 'AMPERS'; }
//";"            {mostrarToken("SEMICO",yytext); return 'SEMICO'; }
////Otros
//"."            {mostrarToken("DOTSIM",yytext); return 'DOTSIM'; }

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







//SCRIPTING - - - - - - - - - - - - - - - - - - - 
"ON_LOAD"     { mostrarToken('ONLOAD'  , yytext); return 'ONLOAD'  ; }
"FUNCTION_"   { mostrarToken('FUNCTION', yytext); return 'FUNCTION'; }









//OTROS - - - - - - - - - - - - - - - - - - - -

[a-zA-Z0-9.#/%_()]+         {mostrarToken("VALOR", yytext); return 'VALOR';}
//[0-9]                       {mostrarToken("ENTERO", yytext); return 'ENTERO';}
//[0-9]+("."[0-9]+)\b        {mostrarToken("DECIMAL", yytext); return 'DECIMAL';} 
//[a-zA-Z_$-][a-zA-Z0-9_$-]\b   {mostrarToken("ID", yytext); 	  return 'ID'; }


<<EOF>>                     return 'EOF'
.                           {  
								mensajesSalida += "\nLEXER: \n";
								mensajesSalida += "ERROR SINTACTICO: No se reconoce " + yytext + " como un simbolo valido.\n";
								//return 'INVALID';
							}


/lex
%start inicio
	%{ 
		//Codigo javascript incrustado
		function mostrarToken(mensaje, token){
			console.log("Token: " + mensaje + " | Valor: " + token);
			mensajesSalida += "\nLEXER: \n"
			mensajesSalida += "Token: " + mensaje + " | Valor: " + token + "\n";
		}

		var nombrePagina = "a";
		var codigoPagina = "b";
		var mensajesSalida ="";

		exports.obtenerNombre = function(){
			return nombrePagina;
		};
		exports.obtenerCodigo = function(){
			return codigoPagina;
		};
		exports.obtenerMensajes = function(){
			return mensajesSalida;
		};
		exports.limpiarMensajes = function(){
			mensajesSalida = "";
		};


		function mostrarSintactico(mensaje){
			console.log(mensaje);
			mensajesSalida += "\nPARSER: \n";
			mensajesSalida += mensaje + "\n";
		};

		function mostrarError(error){
			mensajesSalida += "\nPARSER: \n";
			mensajesSalida += error.message + "\n";
			console.error(error.message)
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
				mostrarSintactico("parametro: " + par)
				mostrarSintactico(params);
				res.push(par);

				if(params != undefined && Array.isArray(params)){
					mostrarSintactico('Params si es un arary!')
					params.forEach(p=>{
						res.push(p);
					});
				}
				$$ = res; 
			}
		   | /* */ { $$ = []; };

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
					//mostrarSintactico("Etiquetas si es un array!");
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
		| SCRIPT 
		| h1 	 { $$ = $1; } | p 	   { $$ = $1; } 
		| coment {}
		| error {
			mostrarSintactico('Error: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		};











valores : VALOR valores{
			var valores = $2; 
			var vl = $1; 
			var res = [];

			if(vl != undefined){
				res.push(vl);
			}

			if(valores != undefined && Array.isArray(valores)){
				valores.forEach(v=>{
					if(v != undefined){
						res.push(v);
					}
				});

				$$ = res;
			}
		} 
		| VALOR {
			var vl = $1;
			var res = [];
			if(vl != undefined){
				res.push(vl);
			}
			$$ = res; 
		};

valor : VALOR;

/* - - Sin parametros - - */
head  : MENQUE HEAD  MAYQUE etiquetas 		HEAD_FIN{
			var etiquetas = $4;
			var head = new Head();
			etiquetas.forEach(etiqueta =>{
				head.agregarComponente(etiqueta);
			});

			mostrarSintactico(head.obtenerCodigo());
			$$ = head;
	  };
title : MENQUE TITLE MAYQUE valor     		TITLE_FIN{
			var valor = $4;
			var titulo = new Title();
			titulo.establecerValor(valor);
			mostrarSintactico(titulo.obtenerCodigo());
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
							mostrarError(error);
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

			
			nombrePagina = html.obtenerNombre();
			codigoPagina = html.obtenerCodigo();
			mostrarSintactico('Nombre pagina: ' + nombrePagina + "\nCodigo pagina: \n"  + html.obtenerCodigo());
			//mostrarSintactico('Codigo pagina: ')
			//mostrarSintactico(html.obtenerCodigo());
			
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
							mostrarError(error);
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
		
			mostrarSintactico(body.obtenerCodigo());
			$$ = body; 
	  };
coment : MENQUE EXCLAM MENOS MENOS valores MENOS MENOS MAYQUE{
			mostrarSintactico("Comentario multiple: " + $5);
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
							mostrarError(error);
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
		
			mostrarSintactico(div.obtenerCodigo());
			$$ = div; 
	  };

select: MENQUE SELECT  parametros MAYQUE options  		SELECT_FIN{ //Solo etiquetas option
			var parametros = $3;
			var opciones = $5;

			var select = new Select();
			//Establecer parametros
			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							select.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}
			//Agregar componentes
			if(opciones != undefined && Array.isArray(opciones)){
				opciones.forEach(e =>{
					if(e!=undefined){
						//Verificar si es un componente
						if(e instanceof Componente){
							select.agregarComponente(e);
						}
					}
				});
			}
		
			mostrarSintactico(select.obtenerCodigo());
			$$ = select;

		}; 
option  : MENQUE OPTION MAYQUE valor 					OPTION_FIN{
			var option = new Option();
			var val = $4;
			option.establecerValor(val);
			mostrarSintactico(option.obtenerCodigo());
			$$ = option; 
		};
options : option options{
			var op = $1;
			var options = $2;
			var res = [];

			if(op != undefined){
				res.push(op);
			}

			if(options != undefined && Array.isArray(options)){
				options.forEach(o=>{
					if(o != undefined){
						res.push(o);
					}
				});
			}
			$$ = res;
		} 
		| option {
			var op = $1;
			var res = [];
			if(op != undefined){
				res.push(op);
			}
			$$ = res;
		};


//Sin etiquetas
link  : MENQUE LINK     parametros MAYQUE valor     LINK_FIN	{
			var parametros = $3;
			var valor = $5;
			var res = new Link();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!= undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res;
	  };
spam  : MENQUE SPAM     parametros MAYQUE valor     SPAM_FIN	{
			var parametros = $3;
			var valor = $5;
			var res = new Spam();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!= undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res;
	  }; 
input : MENQUE INPUT    parametros MAYQUE valor 	INPUT_FIN	{
			var parametros = $3;
			var valor = $5;
			var res = new Input();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!= undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res;
	  }; 
t_area: MENQUE TEXTAREA parametros MAYQUE valor     TEXTAREA_FIN{
			var parametros = $3;
			var valor = $5;
			var res = new TextArea();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!= undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res;
	  };
img   : MENQUE IMG      parametros MAYQUE{
			var parametros = $3;
			var img = new Img();

			//Establecer parametros
			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							img.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			mostrarSintactico(img.obtenerCodigo());
			$$ = img;
	  };
br    : MENQUE BR 				   MAYQUE{
			var result = new Br();
			mostrarSintactico(result.obtenerCodigo());
			$$ = result;					
	  }
	  | MENQUE BARRA BR 		   MAYQUE{
			var result = new Br();
			mostrarSintactico(result.obtenerCodigo());
			$$ = result;
	  }
	  | BR_FIN{
			var result = new Br();
			mostrarSintactico(result.obtenerCodigo());
			$$ = result;
	  };
button: MENQUE BUTTON 	parametros MAYQUE valor     BUTTON_FIN{
			var parametros = $3;
			var valor = $5;
			var res = new Button();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res; 

	  };
h1    : MENQUE H1       parametros MAYQUE valor     H1_FIN	  {
			var parametros = $3;
			var valor = $5;
			var res = new H1();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res; 

	  };
p     : MENQUE P        parametros MAYQUE valor     P_FIN	  {
			var parametros = $3;
			var valor = $5;
			var res = new P();

			if(parametros != undefined && Array.isArray(parametros)){
				parametros.forEach(p=>{
					if(p!=undefined){
						try{
							res.establecerParametro(p.parametro, p.valor);
						}catch(error){ 
							mostrarError(error);
						}
					}
				});
			}

			res.establecerValor(valor);
			mostrarSintactico(res.obtenerCodigo());
			$$ = res; 

	  }; 