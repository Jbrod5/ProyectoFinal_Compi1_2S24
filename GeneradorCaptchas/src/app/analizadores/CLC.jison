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
		//Para tabla de simbolos: 
		var tabla = "";
		var posicion = 0;

		exports.obtenerTabla = function() {
			return tabla; 
		};



        //Codigo javascript incrustado 
        function mostrarToken(mensaje, token){
			console.log("Token: " + mensaje + " | Valor: " + token);
			mensajesSalida += "\nLEXER: \n"
			mensajesSalida += "Token: " + mensaje + " | Valor: " + token + "\n";
		}

		var nombrePagina = "";
		var codigoScript = "";
		var mensajesSalida ="";

		exports.obtenerNombre = function(){
			return nombrePagina;
		};
		exports.obtenerCodigo = function(){
			return codigoScript;
		};
		exports.obtenerMensajes = function(){
			return mensajesSalida;
		};
		exports.limpiarMensajes = function(){
			mensajesSalida = "";
			codigoScript = "";
			tabla = "";
			posicion = 0; 
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


		/** 
		 * @param ids: array de identificadores
		 * @param valores: array de valores que serán asignados a las variables
		 * @param tipo: string con el tipo de dato del simbolo
		 * @param modo: string con el modo de declaracion de la variable: @global o -
		*/
		function declararVariableValor(ids, valores, tipo, modo){
			var codigo = "";
			if( Array.isArray(ids) && Array.isArray(valores)){
				//Si solo hay un valor, todos los ids tienen ese valor
				if(valores.length == 1){
					var vl = valores[0];
					ids.forEach(i =>{
						posicion++;
						tabla += posicion + " | " + i + " | " + tipo + " | "+ vl +" | " + modo + " | ambito | declaracion\n"; 
						codigo += "var " + i + " = " + vl + ";\n";
					});
				}else{
					//Si hay varios valores, asignar hasta donde sea posible
					for(let i = 0; i < ids.length;  i++){
						posicion++;
						var vl = "undefined"; 
						if(i < valores.length){
							vl = valores[i];
						}

						tabla += posicion + " | " + ids[i] + " | " + tipo + " | "+ vl +" | " + modo + " | ambito | declaracion\n";
						codigo += "var " + ids[i] + " = " + vl + ";\n";
					}
				}
			}
			return codigo;
		}

		/**
		 * @param ids: array de identificadores
		 * @param tipo: string con el tipo del simbolo
		 * @param modo: string con el modo de declaracion de la variable: @global o -
		 */
		function declararVariable(ids, tipo, modo){
			var codigo = "";
			if(ids != undefined && Array.isArray(ids)){
				ids.forEach(id=>{
					posicion++;
					tabla += posicion + " | " + id + " | " + tipo + "| undefined | " + modo + " | ambito | declaracion\n";  
					codigo += "var " + id + ";\n";
				});
			} 
			return codigo; 
		}




		


    %}
%%


/* - - - - - - - - - - - - - - - - - PRODUCCIONES - - - - - - - - - - - - - - - - - */
inicio: functions EOF;

functions: function functions 
		 | function;
		 

valor: ID {$$ = $1;}
	 | TRUE {$$ = $1;}
	 | FALSE {$$ = $1;}
	 | DECIMAL {$$ = $1;}
	 | INTEGER {$$ = $1;}
	 | CHAR {$$ = $1;}
	 | STRING {$$ = $1;}
	 | PAROPN condicion PARCLS {$$ = $2;}
	 //| condicion
	 | valor MAS valor {try{$$ = $1 + $3;}catch(error){mensajesSalida += "ERROR: al intentar operar dos valores.\n"}}
	 | valor MEN valor {try{$$ = $1 - $3;}catch(error){mensajesSalida += "ERROR: al intentar operar dos valores.\n"}}
	 | valor TIM valor {try{$$ = $1 * $3;}catch(error){mensajesSalida += "ERROR: al intentar operar dos valores.\n"}}
	 | valor DIV valor {try{$$ = $1 / $3;}catch(error){mensajesSalida += "ERROR: al intentar operar dos valores.\n"}}
	 | funcion_st {$$ = $1;}
	 | numero_aleatorio {$$ = $1;};
	 //| numero;

funcion_st : asc {$$ = $1;}
		   | desc {$$ = $1;}
		   | letpar_num{$$ = $1; }
		   | letimpar_num{$$ = $1;}
		   | reverse{$$ = $1;}
		   | caracter_aleatorio{$$ = $1; }
		   | getElement{$$ = $1;}; 


asc: ASC PAROPN STRING PARCLS{
		$$ = $3.split('').sort().join('');
	}
	| ASC PAROPN ID PARCLS { $$ = "ASC(" + $3 + ")";};
desc: DESC PAROPN STRING PARCLS{
		$$ = $3.split('').sort().reverse().join('');
	}
	| DESC PAROPN ID PARCLS { $$ = "DESC(" + $3 + ")";}; 
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
		 | LETPAR_NUM PAROPN ID PARCLS { $$ = "LETPAR_NUM(" + $3 +")"; };
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
			| LETIMPAR_NUM PAROPN ID PARCLS { $$ = "LETIMPAR_NUM(" + $3 + ")"; };
reverse: REVERSE PAROPN STRING PARCLS{
			$$ = $3.split('').reverse().join('');
		}
		| REVERSE PAROPN ID PARCLS { $$ = "REVERSE(" + $3 + ")"; };
getElement: GET_ELEMENT PAROPN STRING PARCLS { $$ = "document.getElementById(" + $3 + ")"; }
		  | GET_ELEMENT PAROPN ID 	  PARCLS { $$ = "document.getElementById(" + $3 + ")"; };

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


// Posicion | Identificador | Tipo | Valor actual | Modo | Ambito 
declaracion: INT        identificadores  {
											var ids = $2;
											$$ = declararVariable(ids, "integer", "-");
										} 
		   | STR        identificadores {
											var ids = $2;
											$$ = declararVariable(ids, "string", "-");
										 }
		   | DEC        identificadores  {
											var ids = $2;
											$$ = declararVariable(ids, "decimal", "-");
										 }
		   | CHA        identificadores  {
											var ids = $2;
											$$ = declararVariable(ids, "char", "-");
										 }
		   | BOO        identificadores  {
											var ids = $2;
											$$ = declararVariable(ids, "boolean", "-");
										 }
		   | INT GLOBAL identificadores {
											var ids = $3;
											$$ = declararVariable(ids, "integer", "@global");
										 }
		   | STR GLOBAL identificadores {
											var ids = $3;
											$$ = declararVariable(ids, "string", "@global");
										 }
		   | DEC GLOBAL identificadores {
											var ids = $3;
											$$ = declararVariable(ids, "decimal", "@global");
										 }
		   | CHA GLOBAL identificadores {
											var ids = $3;
											$$ = declararVariable(ids, "char", "@global");
										 }
		   | BOO GLOBAL identificadores {
											var ids = $3;
											$$ = declararVariable(ids, "boolean", "@global");
										 }
		   | INT        identificadores EQU ints {
														var ids = $2; var valores = $4; 
														$$ = declararVariableValor(ids, valores, "integer", "-")
		   										 }
		   | STR        identificadores EQU strs {
														var ids = $2; var valores = $4; 
														$$ = declararVariableValor(ids, valores, "string", "-");
		   										 }
		   | DEC        identificadores EQU decs {
														var ids = $2; var valores = $4; 
														$$ = declararVariableValor(ids, valores, "decimal", "-");
		   										 }
		   | CHA        identificadores EQU chas {
														var ids = $2; var valores = $4; 
														$$ = declararVariableValor(ids, valores, "char", "-");
		   										 }
		   | BOO        identificadores EQU boos {
														var ids = $2; var valores = $4; 
														$$ = declararVariableValor(ids, valores, "boolean", "-");
		   										 }
		   | INT GLOBAL identificadores EQU ints{
														var ids = $3; var valores = $5; 
														$$ = declararVariableValor(ids, valores, "integer", "@global");
		   										 }
		   | STR GLOBAL identificadores EQU strs{
														var ids = $3; var valores = $5; 
														$$ = declararVariableValor(ids, valores, "string", "@global");
		   										 }
		   | DEC GLOBAL identificadores EQU decs{
														var ids = $3; var valores = $5; 
														$$ = declararVariableValor(ids, valores, "decimal", "@global");
		   										 }
		   | CHA GLOBAL identificadores EQU chas{
														var ids = $3; var valores = $5; 
														$$ = declararVariableValor(ids, valores, "char", "@global");
		   										 }
		   | BOO GLOBAL identificadores EQU boos {
														var ids = $3; var valores = $5; 
														$$ = declararVariableValor(ids, valores, "boolean", "@global");
		   										 };

identificadores: ID identificadores {
					var resultado = [];
					var identificador = $1;
					if(identificador != undefined){
						resultado.push(identificador);
					}

					var ids = $2;
					if(ids != undefined && Array.isArray(ids)){
						ids.forEach(id =>{
							resultado.push(id);
						});
					}
					$$ = resultado; 
				}
			   | ID {
				   var resultado = [];
				   resultado.push($1);
				   $$ = resultado;
			   };

ints : numero COMMA ints  {
								var resultado = [];
								resultado.push($1);

								var ints = $3;
								if(ints != undefined && Array.isArray(ints)){
									ints.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado; 
						  }
	 | numero  { var resultado = []; resultado.push($1); $$ = resultado; };
strs : STRING  COMMA strs {
								var resultado = [];
								resultado.push($1);

								var sts = $3;
								if(sts != undefined && Array.isArray(sts)){
									sts.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado;
						  }
	 | STRING { var resultado = []; resultado.push($1); $$ = resultado;}
	 | funcion_st COMMA strs {
								var resultado = [];
								resultado.push($1);

								var sts = $3;
								if(sts != undefined && Array.isArray(sts)){
									sts.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado;
						  }
	 | funcion_st {var resultado = []; resultado.push($1); $$ = resultado; };
decs : DECIMAL COMMA decs {
								var resultado = [];
								resultado.push($1);

								var sts = $3;
								if(sts != undefined && Array.isArray(sts)){
									sts.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado;
						  }
	 | DECIMAL {var resultado = []; resultado.push($1); $$ = resultado; };
chas : CHAR    COMMA chas {
								var resultado = [];
								resultado.push($1);

								var sts = $3;
								if(sts != undefined && Array.isArray(sts)){
									sts.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado;
						  }
	 | CHAR {var resultado = []; resultado.push($1); $$ = resultado; }
	 | caracter_aleatorio COMMA chas {
										var resultado = [];
										resultado.push($1);

										var sts = $3;
										if(sts != undefined && Array.isArray(sts)){
											sts.forEach(i=>{
												resultado.push(i);
											});
										}
										$$ = resultado;
						  			}
	 | caracter_aleatorio {var resultado = []; resultado.push($1); $$ = resultado; };
boos : valbool COMMA boos {
								var resultado = [];
								resultado.push($1);

								var sts = $3;
								if(sts != undefined && Array.isArray(sts)){
									sts.forEach(i=>{
										resultado.push(i);
									});
								}
								$$ = resultado;
						   }
	| valbool {var resultado = []; resultado.push($1); $$ = resultado;};

valbool: TRUE { $$ = $1; } 
	  | FALSE { $$ = $1; };

condicion: //PAROPN condicion PARCLS
		    valor AND AND    valor{/*try{$$=$1 && $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
								  	$$ = $1 + " && " + $4;
								  }
		   |valor ORS ORS    valor{/*try{$$=$1 || $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   							$$ = $1 + " || " + $4; 
		   						  }
		   | 		  EXCLAM valor{/*try{$$=!$2;	   }catch(error){mensajesSalida += "ERROR: al negar una condicion\n";  $$ = false;}*/
		   						  	$$ = "!" + $2; 
								  }
		   |valor EQU EQU 	 valor{/*try{$$=$1 == $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " == " + $4; 
								  }
		   |valor EXCLAM EQU valor{/*try{$$=$1 != $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " != " + $4; 
								  }
		   |valor MENQUE 	 valor{/*try{$$=$1 < $4; }catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " < " + $3; 
								  }
		   |valor MENQUE EQU valor{/*try{$$=$1 <= $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " <= " + $4;
								  }
		   |valor MAYQUE 	 valor{/*try{$$=$1 > $4; }catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " > " + $3; 
								  }
		   |valor MAYQUE EQU valor{/*try{$$=$1 >= $4;}catch(error){mensajesSalida += "ERROR: al operar una condicion\n"; $$ = false;}*/
		   						  	$$ = $1 + " >= " + $4; 
								  }
		   |valor {$$ = $1;};






asignacion : ID EQU valor{
							var id = $1;
							var vl = $3; 
							var as = "asignacion"
							var encontrado = false; 

							var codigo = "";
							
							//Buscar si el id ya fue declarado anteriormente
							var filas = tabla.split('\n');
							filas.forEach(fila => {
								if(fila.includes(id) && fila.includes("ambito")){
									encontrado = true; 
									codigo += id + " = " + vl + ";\n";
								}
							});
							posicion ++; 
							if(!encontrado){
								as = "NO DECLARADO"
							}
							tabla += posicion + " | " + id + " |  |" + vl + " |  | ambito | "+as+"\n"
							$$ = codigo; 
						 }; 

if_exp:   IF PAROPN condicion PARCLS THEN expresion {
														var codigo = "if(" + $3 + "){\n" + $6 + "\n}";
														$$ = codigo; 
													}
		| IF PAROPN condicion PARCLS THEN bloque_ins{
														var codigo = "if(" + $3 + "){\n" + $6 + "\n}";
														$$ = codigo; 
													};
elif_exp: ELSE if_exp;
else_exp: ELSE expresion {
								var codigo = "else{\n" + $2 + "}\n";
								$$ = codigo; 
						 }
		| ELSE bloque_ins{
							var codigo = "else{\n" + $2 + "}\n";
							$$ = codigo; 
						 };


while_exp : WHILE PAROPN condicion PARCLS THENWHILE expresion{
																	var codigo = "while(" + $3 + "){\n" + $6 + "}\n";
																	$$ = codigo; 
															 }
		  | WHILE PAROPN condicion PARCLS THENWHILE bloque_ins{
																	var codigo = "while(" + $3 + "){\n" + $6 + "}\n";
																	$$ = codigo; 
		  													  };


repeat: REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS expresion {
																			var id = "";
																			if($3.length > 1){
																				var partes = $3.split(" ");
																				if(partes[0] === "var"){
																					id = partes[1]; 
																				}else{
																					id = partes[0];
																				}
																			}

																			var codigo = "for(" + $3 + " " + id + " <= " + $7 + "; " + id + "++){\n" + $9 + "}\n";
																			$$ = codigo; 
																		 }
	  | REPEAT PAROPN variable PARCLS HUNTIL PAROPN num PARCLS bloque_ins{
																			var id = "";
																			if($3.length > 1){
																				var partes = $3.split(" ");
																				if(partes[0] === "var"){
																					id = partes[1]; 
																				}else{
																					id = partes[0];
																				}
																			}

																			var codigo = "for(" + $3 + " " + id + " <= " + $7 + "; " + id + "++){\n" + $9 + "}\n";
																			$$ = codigo; 
	  																	 }; 

variable: asignacion {$$ = $1;}| declaracion{$$ = $1; }; 
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





expresiones : expresion expresiones {$$ = $1 + $2; }
		    | expresion{ $$ = $1;};

expresion: declaracion SEMIC {
								mostrarSintactico("Expresion declaracion correctamente");
								$$ = $1; 
							}
		 | asignacion SEMIC {
								mostrarSintactico("Expresion asignacion terminada correctamente");
								$$ = $1; 
							}
		 | if_exp {
					mostrarSintactico("Expresion if terminada correctamente");
					$$ = $1;
				  }
		 //|elif_exp
		 | else_exp {
						mostrarSintactico("Expresion else terminada correctamente");
						$$ = $1; 
					}
		 | repeat {
					mostrarSintactico("Expresion repeat terminada correctamente");
				  	$$ = $1; 
				  }
		 | while_exp {
						mostrarSintactico("Expresion while correctamente");
					 	$$ = $1; 
					 }
		 | funcion_st SEMIC {mostrarSintactico("Expresion funcion correctamente"); $$ = "";}
		 | numero_aleatorio SEMIC {mostrarSintactico("Expresion numero aleatorio terminada correctamente"); $$ = "";}
		 | alert_info {
						mostrarSintactico("Expresion alert terminada correctamente"); 
					    $$ = $1; 
					  }
		 | exit {
					mostrarSintactico("Expresion exit terminada correctamente");
					$$ = $1; 	
				}
		 | redirect {mostrarSintactico("Expresion redirect terminada correctamente."); $$ = "";}
		 | insert {mostrarSintactico("Expresion insert terminaa correctamente.");$$ = "";}
		 | error {
			mostrarSintactico('EXPRESION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = "";
		 };

function: FUNCTION ID PAROPN PARCLS COROPN expresiones CORCLS {
			console.log("Funcion " + $2 + " terminada con exito.");
			mensajesSalida += "PARSER: Funcion " + $2 + " terminada con exito.\n";
			tabla = tabla.replaceAll("ambito", $1 + $2 + "()");

			var codigo = "function FUNCTION_" + $2 + "(){\n" + $6 + "}\n";
			codigoScript += codigo;

		}
        | ONLOAD      PAROPN PARCLS COROPN expresiones CORCLS{
			console.log("Funcion ONLOAD terminada correctamente.");
			mensajesSalida += "FPARSER: Funcion ONLOAD terminada correctamente.\n";
			//tabla = tabla.replace(/ambito/g, "ON_LOAD()");
			tabla = tabla.replaceAll("ambito", "ON_LOAD()");

			var codigo = "window.onload = function(){\n" + $5 + "};\n";
			codigoScript += codigo; 
		}
		|error {
			mostrarSintactico('FUNCION COMO ERROR -> \nError: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));
			$$ = undefined;
		};

bloque_ins: INIT LLAVOP COLON expresiones COLON LLAVCL END{
																$$ = $4;
														  };

alert_info: ALERT_INFO PAROPN STRING PARCLS SEMIC{$$ = "alert(" + $3 + ");\n";}
		  | ALERT_INFO PAROPN ID     PARCLS SEMIC{$$ = "alert(" + $3 + ");\n";};
exit : EXIT PAROPN PARCLS SEMIC {$$ = "return;\n"};
redirect : REDIRECT PAROPN PARCLS SEMIC {$$ = "";}; 
insert : INSERT PAROPN inserts PARCLS {$$ = "";};
inserts : STRING | STRING COMMA inserts | STRING inserts
		| ID     | ID COMMA inserts | ID insert;




