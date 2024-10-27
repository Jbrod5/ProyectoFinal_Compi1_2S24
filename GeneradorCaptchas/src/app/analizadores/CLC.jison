/* DEFINICIONES LEXICAS */
%{
    //Codigo incrustado javascript   
%}
%lex

%%
/* - - - - - - - - - - - - - - - EXPRESIONES REGULARES - - - - - - - - - - - - - - - */

// IGNORAR - - - - - - - - - - - - - - - 
[ \r\t\n]                 {/* ignorar */}
"<C_SCRIPTING>"           {/* Encabezado de script, ignorar */}
"</C_SCRIPTING>"          {/* Pie de script, ignorar */}
"!!".*        	          {/* Comentario una linea */}
"<!--"([\s\S]*?)"-->"     {/* Comentario multilinea */}

//PALABRAS RESERVADAS - - - - - - - - - -  
"FUNCTION_"? {mostrarToken('FUNCTION', yytext);  return 'FUNCTION';} 
"ON_LOAD"    {mostrarToken('ONLOAD', yytext)  ;  return 'ONLOAD';} 
"@global"    {mostrarToken('GLOBAL', yytext)  ;  return 'GLOBAL';} 

"IF"        {mostrarToken('IF',   yytext); return 'IF'  ;} 
"THEN"      {mostrarToken('THEN', yytext); return 'THEN';} 
"ELSE"      {mostrarToken('ELSE', yytext); return 'ELSE';} 

"REPEAT"    {mostrarToken('REPEAT', yytext); return 'REPEAT';}
"HUNTIL"    {mostrarToken('HUNTIL', yytext); return 'HUNTIL';}

"WHILE"      {mostrarToken('WHILE'    , yytext);  return 'WHILE'    ;}
"THENWHILE"  {mostrarToken('THENWHILE', yytext);  return 'THENWHILE';}

"INIT"       {mostrarToken('INIT', yytext); return 'INIT';}
"END"        {mostrarToken('END', yytext);  return 'END' ;}

"INSERT"     {mostrarToken('INSERT', yytext); return 'INSERT';}


//Tipos de datos
"integer" {mostrarToken('INT', yytext); return 'INT';} 
"string"  {mostrarToken('STR', yytext); return 'STR';} 
"decimal" {mostrarToken('DEC', yytext); return 'DEC';}
"char"    {mostrarToken('CHR', yytext); return 'CHR';}
"boolean" {mostrarToken('BOO', yytext); return 'BOO';}




//SIMBOLOS - - - - - - - - - - - - - - -
"(" {mostrarToken("PAROPN", yytext); return  'PAROPN';}
")" {mostrarToken("PARCLS", yytext); return  'PARCLS';}
"[" {mostrarToken("COROPN", yytext); return  'COROPN';}
"]" {mostrarToken("CORCLS", yytext); return  'CORCLS';}
"{" {mostrarToken("LLAVOP", yytext); return  'LLAVOP';}
"}" {mostrarToken("LLAVCL", yytext); return  'LLAVCL';}
"," {mostrarToken("COMMA", yytext);  return  'COMMA' ;}
";" {mostrarToken("SEMIC", yytext);  return  'SEMIC' ;}
":" {mostrarToken("COLON", yytext);  return  'COLON' ;}

"=" {mostrarToken('EQU' ,yytext); return 'EQU'; }
"+" {mostrarToken('MAS' ,yytext); return 'MAS'; }
"-" {mostrarToken('MEN' ,yytext); return 'MEN'; }
"/" {mostrarToken('DIV' ,yytext); return 'DIV'; }
"*" {mostrarToken('TIM' ,yytext); return 'TIM'; }
"!" {mostrarToken('EXC' ,yytext); return 'EXC'; }
"<" {mostrarToken('MEN' ,yytext); return 'MEN'; }
">" {mostrarToken('MAY' ,yytext); return 'MAY'; }
"|" {mostrarToken('ORS' ,yytext); return 'ORS'; }
"&" {mostrarToken('AND' ,yytext); return 'AND'; }









// IDENTIFICADOR - - - - - - - - - - - - -
[a-zA-Z_$-][a-zA-Z0-9_$-]*   {mostrarToken("ID", yytext); 	  return 'ID'; }




// OTROS - - - - - - - - - - - - - - - - 
<<EOF>>                     return 'EOF'
.                           {  
								//mensajesSalida += "\nLEXER: \n";
								//mensajesSalida += "ERROR SINTACTICO: No se reconoce " + yytext + " como un simbolo valido.\n";
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


/* - - - - - - - - - - - - - - - - - PRODUCCIONES - - - - - - - - - - - - - - - - - */
inicio: functions EOF;

functions: function functions 
		 | function 
		 |error {
			mostrarSintactico('Error: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		}; 

function: FUNCTION ID PAROPN PARCLS COROPN expresiones CORCLS 
        | ON_LOAD     PAROPN PARCLS COROPN expresiones CORCLS;