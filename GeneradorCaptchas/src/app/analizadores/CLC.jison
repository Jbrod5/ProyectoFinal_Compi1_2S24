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

//Funciones especiales - -
//valores
"ASC"                   {mostrarToken('ASC'					, yytext); return 'ASC'					;}     
"DESC"                  {mostrarToken('DESC'				, yytext); return 'DESC'				;}      
"LETPAR_NUM"            {mostrarToken('LETPAR_NUM'			, yytext); return 'LETPAR_NUM'			;}           
"LETIMPAR_NUM"          {mostrarToken('LETIMPAR_NUM'		, yytext); return 'LETIMPAR_NUM'		;}    
"REVERSE"               {mostrarToken('REVERSE'				, yytext); return 'REVERSE'				;}      
"CARACTER_ALEATORIO"    {mostrarToken('CARACTER_ALEATORIO'	, yytext); return 'CARACTER_ALEATORIO'	;}     
"NUM_ALEATORIO"         {mostrarToken('NUM_ALEATORIO'		, yytext); return 'NUM_ALEATORIO'		;}

"getElementById"?        {mostrarToken('GET_ELEMENT'			, yytext); return 'GET_ELEMENT'         ;}
//sin retorno
"ALERT_INFO"            {mostrarToken('ALERT_INFO'			, yytext); return 'ALERT_INFO'			;}  
"EXIT"                  {mostrarToken('EXIT'				, yytext); return 'EXIT'				;}
"REDIRECT"              {mostrarToken('REDIRECT'			, yytext); return 'REDIRECT'			;}

"INSERT"                {mostrarToken('INSERT'              , yytext); return 'INSERT'              ;}


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

"'"[a-zA-Z]"'"\b			 {mostrarToken("CHAR"  , yytext); 	return 'CHAR'	;}
("'"([\s\S]*?)"'")         {mostrarToken("STRING", yytext);   return 'STRING' ;}

"true"                       {mostrarToken("TRUE"	, yytext); 	return 'TRUE'	;}       
"false"                      {mostrarToken("FALSE"	, yytext); 	return 'FALSE'	;}    
[0-9]+"."[0-9]+              {mostrarToken("DECIMAL", yytext); 	return 'DECIMAL';}     
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
	 | valor DIV valor
	 | funcion_st
	 | numero_aleatorio;
	 //| numero;

funcion_st : asc {$$ = $1;}
		   | desc {$$ = $1;}
		   | letpar_num{$$ = 1; }
		   | letimpar_num{$$ = 1;}
		   | reverse{$$ = 1;}
		   | caracter_aleatorio{$$ = 1; }
		   | getElement{$$ = $1;}; 


asc: ASC PAROPN STRING PARCLS{
		$$ = $3.split('').sort().join('');
	}
	| ASC PAROPN ID PARCLS;
desc: DESC PAROPN STRING PARCLS{
		$$ = $3.split('').sort().reverse().join('');
	}
	| DESC PAROPN ID PARCLS; 
letpar_num: LETPAR_NUM PAROPN STRING PARCLS{
			var resultado = '';

			for (let i = 0; i < palabra.length; i++) {
				if (i % 2 === 0) {
					// Mantiene las letras en posiciones impares (índices pares) en ASCII
					resultado += palabra.charCodeAt(i);
				} else {
					// Deja las letras en posiciones impares (índices impares) como están
					resultado += palabra[i];
				}
			}
			$$ = resultado;
		 }
		 | LETPAR_NUM PAROPN ID PARCLS;
letimpar_num: LETIMPAR_NUM PAROPN STRING PARCLS{
				var resultado = '';

				for (let i = 0; i < palabra.length; i++) {
					if (i % 2 !== 0) {
						// Convierte las letras en posiciones impares (índices impares) a ASCII
						resultado += palabra.charCodeAt(i);
					} else {
						// Deja las letras en posiciones pares (índices pares) como están
						resultado += palabra[i];
					}
				}
				$$ = resultado; 
			}
			| LETIMPAR_NUM PAROPN ID PARCLS;
reverse: REVERSE PAROPN STRING PARCLS{
			$$ = $3.split('').reverse().join('');
		}
		| REVERSE PAROPN ID PARCLS;
getElement: GET_ELEMENT PAROPN STRING PARCLS;

caracter_aleatorio : CARACTER_ALEATORIO PAROPN PARCLS{
						const esMayuscula = Math.random() < 0.5; // Decide si será mayúscula o minúscula
						const codigoAscii = esMayuscula 
							? Math.floor(Math.random() * 26) + 65  // ASCII para A-Z (65-90)
							: Math.floor(Math.random() * 26) + 97; // ASCII para a-z (97-122)
						
						$$ =  String.fromCharCode(codigoAscii);
					};

numero_aleatorio : NUM_ALEATORIO PAROPN PARCLS{
					$$ = Math.floor(Math.random() * 10);
				};



declaracion: INT        identificadores  
		   | STR        identificadores  
		   | DEC        identificadores  
		   | CHA        identificadores  
		   | BOO        identificadores  
		   | INT GLOBAL identificadores 
		   | STR GLOBAL identificadores 
		   | DEC GLOBAL identificadores 
		   | CHA GLOBAL identificadores 
		   | BOO GLOBAL identificadores 
		   | INT        identificadores EQU ints 
		   | STR        identificadores EQU strs 
		   | DEC        identificadores EQU decs 
		   | CHA        identificadores EQU chas 
		   | BOO        identificadores EQU boos 
		   | INT GLOBAL identificadores EQU ints
		   | STR GLOBAL identificadores EQU strs
		   | DEC GLOBAL identificadores EQU decs
		   | CHA GLOBAL identificadores EQU chas
		   | BOO GLOBAL identificadores EQU boos;

identificadores: ID identificadores | ID;

ints : INTEGER COMMA ints | INTEGER
		numero COMMA ints | numero;
strs : STRING  COMMA strs | STRING
	 | funcion_st COMMA strs 
	 | funcion_st;
decs : DECIMAL COMMA decs | DECIMAL;
chas : CHAR    COMMA chas | CHAR
	 | caracter_aleatorio COMMA chas | caracter_aleatorio;
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






asignacion : ID EQU valor; 

if_exp:   IF PAROPN condicion PARCLS THEN expresion 
		| IF PAROPN condicion PARCLS THEN bloque_ins;
elif_exp: ELSE if_exp;
else_exp: ELSE expresion
		| ELSE bloque_ins;


while_exp : WHILE PAROPN condicion PARCLS THENWHILE expresion
		  | WHILE PAROPN condicion PARCLS THENWHILE bloque_ins;


repeat: REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS expresion
	  | REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS bloque_ins; 

variable: asignacion | declaracion; 
num: ID { $$ = $1; }
   | numero { console.log("NUMERO RETORNADO POR PRODUCCION: " + $1); mostrarSintactico("NUMERO RETORNADO POR PRODUCCION: " + $1); $$ = $1; };

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
	  }
	  | num_aleatorio;  





expresiones : expresion expresiones | expresion;

expresion: declaracion SEMIC {mostrarSintactico("Expresion declaracion correctamente");}
		 | asignacion SEMIC {mostrarSintactico("Expresion asignacion terminada correctamente");}
		 | if_exp {mostrarSintactico("Expresion if terminada correctamente");}
		 //|elif_exp
		 | else_exp {mostrarSintactico("Expresion else terminada correctamente");}
		 | repeat {mostrarSintactico("Expresion repeat terminada correctamente");}
		 | while_exp {mostrarSintactico("Expresion while correctamente");}
		 | funcion_st SEMIC {mostrarSintactico("Expresion funcion correctamente");}
		 | numero_aleatorio SEMIC {mostrarSintactico("Expresion numero aleatorio terminada correctamente");}
		 | alert_info {mostrarSintactico("Expresion alert terminada correctamente");}
		 | exit {mostrarSintactico("Expresion exit terminada correctamente");}
		 | redirect {mostrarSintactico("Expresion redirect terminada correctamente.");}
		 | insert {mostrarSintactico("Expresion insert terminaa correctamente.");}
		 | error {
			mostrarSintactico('EXPRESION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		 };

function: FUNCTION ID PAROPN PARCLS COROPN expresiones CORCLS {
			console.log("Funcion " + $2 + " terminada con exito.");
			mensajesSalida += "PARSER: Funcion " + $2 + " terminada con exito.\n";
		}
        | ONLOAD      PAROPN PARCLS COROPN expresiones CORCLS{
			console.log("Funcion ONLOAD terminada correctamente.");
			mensajesSalida += "FPARSER: Funcion ONLOAD terminada correctamente.\n";
		}
		|error {
			mostrarSintactico('FUNCION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		};

bloque_ins: INIT LLAVOP COLON expresiones COLON LLAVCL END;

alert_info: ALERT_INFO PAROPN STRING PARCLS SEMIC
		  | ALERT_INFO PAROPN ID     PARCLS SEMIC;
exit : EXIT PAROPN PARCLS SEMIC;
redirect : REDIRECT PAROPN PARCLS SEMIC; 
insert : INSERT PAROPN inserts PARCLS;
inserts : STRING | STRING COMMA inserts | STRING inserts
		| ID     | ID COMMA inserts | ID insert;




