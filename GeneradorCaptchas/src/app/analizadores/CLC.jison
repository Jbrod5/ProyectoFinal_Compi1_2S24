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
"ON_LOAD"    {mostrarToken('ONLOAD',   yytext);  return 'ONLOAD'  ;} 
"@global"    {mostrarToken('GLOBAL',   yytext);  return 'GLOBAL'  ;} 

"IF"         {mostrarToken('IF',   yytext); return 'IF'  ;} 
"THEN"       {mostrarToken('THEN', yytext); return 'THEN';} 
"ELSE"       {mostrarToken('ELSE', yytext); return 'ELSE';} 

"REPEAT"     {mostrarToken('REPEAT', yytext); return 'REPEAT';}
"HUNTIL"     {mostrarToken('HUNTIL', yytext); return 'HUNTIL';}

"WHILE"      {mostrarToken('WHILE'    , yytext);  return 'WHILE'    ;}
"THENWHILE"  {mostrarToken('THENWHILE', yytext);  return 'THENWHILE';}

"INIT"       {mostrarToken('INIT', yytext); return 'INIT';}
"END"        {mostrarToken('END',  yytext); return 'END' ;}

"INSERT"     {mostrarToken('INSERT', yytext); return 'INSERT';}


//Tipos de datos
"integer"    {mostrarToken('INT', yytext); return 'INT';} 
"string"     {mostrarToken('STR', yytext); return 'STR';} 
"decimal"    {mostrarToken('DEC', yytext); return 'DEC';}
"char"       {mostrarToken('CHR', yytext); return 'CHR';}
"boolean"    {mostrarToken('BOO', yytext); return 'BOO';}




//SIMBOLOS - - - - - - - - - - - - - - -
"(" {mostrarToken("PAROPN", yytext); return  'PAROPN';}
")" {mostrarToken("PARCLS", yytext); return  'PARCLS';}
"[" {mostrarToken("COROPN", yytext); return  'COROPN';}
"]" {mostrarToken("CORCLS", yytext); return  'CORCLS';}
"{" {mostrarToken("LLAVOP", yytext); return  'LLAVOP';}
"}" {mostrarToken("LLAVCL", yytext); return  'LLAVCL';}
"," {mostrarToken("COMMA",  yytext); return  'COMMA' ;}
";" {mostrarToken("SEMIC",  yytext); return  'SEMIC' ;}
":" {mostrarToken("COLON",  yytext); return  'COLON' ;}

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









// VALORES - - - - - - - - - - - - -
("\""([\s\S]*?)"\"")         {mostrarToken("STRING", yytext);   return 'STRING' ;}
("“"([\s\S]*?)"“")           {mostrarToken("STRING", yytext);   return 'STRING' ;}
("”"([\s\S]*?)"”")           {mostrarToken("STRING", yytext);   return 'STRING' ;}
("“"([\s\S]*?)"”")           {mostrarToken("STRING", yytext);   return 'STRING' ;}
("”"([\s\S]*?)"“")           {mostrarToken("STRING", yytext);   return 'STRING' ;}

"\'"[a-zA-Z]"\'"\b			 {mostrarToken("CHAR"  , yytext); 	return 'CHAR'	;}

"true"                       {mostrarToken("TRUE"	, yytext); 	return 'TRUE'	;}       
"false"                      {mostrarToken("FALSE"	, yytext); 	return 'FALSE'	;}    
[0-9]+"."[0-9]+               {mostrarToken("DECIMAL",yytext); 	return 'DECIMAL';}     
[0-9]+\b                     {mostrarToken("INTEGER", yytext); 	return 'INTEGER';}    
[a-zA-Z_$-][a-zA-Z0-9_$-]*   {mostrarToken("ID"		, yytext); 	return 'ID'		;}





// OTROS - - - - - - - - - - - - - - - - 
<<EOF>>                     return 'EOF'
.                           {  
								//mensajesSalida += "\nLEXER: \n";
								//mensajesSalida += "ERROR SINTACTICO: No se reconoce " + yytext + " como un simbolo valido.\n";
								//return 'INVALID';
							}
/lex
/*precedencia*/
%left 'MAS' 'MEN'
%left 'TIM' 'DIV'

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
		 | function;
		 

valor: ID 
	 | TRUE
	 | FALSE
	 | DECIMAL
	 | INTEGER
	 | CHAR
	 | STRING
	 | PAROPN condicion PARCLS
	 //| condicion
	 | valor MAS valor
	 | valor MEN valor
	 | valor TIM valor
	 | valor DIV valor;
	 //| numero;


declaracion: INT        identificadores SEMIC 
		   | STR        identificadores SEMIC 
		   | DEC        identificadores SEMIC 
		   | CHA        identificadores SEMIC 
		   | BOO        identificadores SEMIC 
		   | INT GLOBAL identificadores SEMIC
		   | STR GLOBAL identificadores SEMIC
		   | DEC GLOBAL identificadores SEMIC
		   | CHA GLOBAL identificadores SEMIC
		   | BOO GLOBAL identificadores SEMIC
		   | INT        identificadores EQU ints SEMIC 
		   | STR        identificadores EQU strs SEMIC 
		   | DEC        identificadores EQU decs SEMIC 
		   | CHA        identificadores EQU chas SEMIC 
		   | BOO        identificadores EQU boos SEMIC 
		   | INT GLOBAL identificadores EQU ints SEMIC
		   | STR GLOBAL identificadores EQU strs SEMIC
		   | DEC GLOBAL identificadores EQU decs SEMIC
		   | CHA GLOBAL identificadores EQU chas SEMIC
		   | BOO GLOBAL identificadores EQU boos SEMIC;

identificadores: ID identificadores | ID;

ints : INTEGER COMMA ints | INTEGER;
strs : STRING  COMMA strs | STRING;
decs : DECIMAL COMMA decs | DECIMAL;
chas : CHAR    COMMA chas | CHAR;
boos : valbool COMMA boos | valbool;

valbool: TRUE | FALSE;

condicion: //PAROPN condicion PARCLS
		   valor AND AND    valor
		   |valor ORS ORS    valor
		   | 		  EXCLAM valor
		   |valor EQU EQU 	 valor
		   |valor EXCLAM EQU valor
		   |valor MENQUE 	 valor
		   |valor MENQUE EQU valor
		   |valor MAYQUE 	 valor
		   |valor MAYQUE EQU valor
		   |valor;






asignacion : ID EQU valor SEMIC; 

if_exp:   IF PAROPN condicion PARCLS THEN expresion 
		| IF PAROPN condicion PARCLS THEN bloque_ins;
elif_exp: ELSE if_exp;
else_exp: ELSE expresion
		| ELSE bloque_ins;



repeat: REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS expresion
	  | REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS bloque_ins; 

variable: asignacion | declaracion; 
num: ID { $$ = $1; }
   | numero { console.log("NUMERO RETORNADO POR PRODUCCION: " + $1);  $$ = $1; };

numero: INTEGER { $$ = $1; } 
	  | DECIMAL { $$ = $1; }
	  | numero MAS numero{
		$$ = $1 + $3; 
	  }
	  | numero MEN numero{
		$$ = $1 - $3; 
	  } 
	  | numero TIM numero{
		$$ = $1 * $3; 
	  }
	  | numero DIV numero{
		$$ = $1 / $3; 
	  }
	  | PAROPN numero PARCLS{
		$$ = $2;
	  };  





expresiones : expresion expresiones | expresion;

expresion: declaracion
		 | asignacion
		 | if_exp
		 //|elif_exp
		 | else_exp
		 | repeat
		 | error {
			mostrarSintactico('EXPRESION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		 };

function: FUNCTION ID PAROPN PARCLS COROPN expresiones CORCLS 
        | ON_LOAD     PAROPN PARCLS COROPN expresiones CORCLS
		|error {
			mostrarSintactico('FUNCION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		};

bloque_ins: INIT LLAVOP COLON expresiones COLON LLAVCL END;


