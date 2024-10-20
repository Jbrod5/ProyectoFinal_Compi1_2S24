/* parser generated by jison 0.4.18 */
/*
  Returns a Parser object of the following structure:

  Parser: {
    yy: {}
  }

  Parser.prototype: {
    yy: {},
    trace: function(),
    symbols_: {associative list: name ==> number},
    terminals_: {associative list: number ==> name},
    productions_: [...],
    performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate, $$, _$),
    table: [...],
    defaultActions: {...},
    parseError: function(str, hash),
    parse: function(input),

    lexer: {
        EOF: 1,
        parseError: function(str, hash),
        setInput: function(input),
        input: function(),
        unput: function(str),
        more: function(),
        less: function(n),
        pastInput: function(),
        upcomingInput: function(),
        showPosition: function(),
        test_match: function(regex_match_array, rule_index),
        next: function(),
        lex: function(),
        begin: function(condition),
        popState: function(),
        _currentRules: function(),
        topState: function(),
        pushState: function(condition),

        options: {
            ranges: boolean           (optional: true ==> token location info will include a .range[] member)
            flex: boolean             (optional: true ==> flex-like lexing behaviour where the rules are tested exhaustively to find the longest match)
            backtrack_lexer: boolean  (optional: true ==> lexer regexes are tested in order and for each matching regex the action code is invoked; the lexer terminates the scan when a token is returned by the action code)
        },

        performAction: function(yy, yy_, $avoiding_name_collisions, YY_START),
        rules: [...],
        conditions: {associative list: name ==> set},
    }
  }


  token location info (@$, _$, etc.): {
    first_line: n,
    last_line: n,
    first_column: n,
    last_column: n,
    range: [start_number, end_number]       (where the numbers are indexes into the input string, regular zero-based)
  }


  the parseError function receives a 'hash' object with these members for lexer and parser errors: {
    text:        (matched text)
    token:       (the produced terminal token, if any)
    line:        (yylineno)
  }
  while parser (grammar) errors will also provide these members, i.e. parser errors deliver a superset of attributes: {
    loc:         (yylloc)
    expected:    (string describing the set of expected tokens)
    recoverable: (boolean: TRUE when the parser has a error recovery rule available for this particular error)
  }
*/
var CLang = (function(){
var o=function(k,v,o,l){for(o=o||{},l=k.length;l--;o[k[l]]=v);return o},$V0=[1,5],$V1=[1,24],$V2=[2,3],$V3=[24,64],$V4=[1,60],$V5=[1,61],$V6=[65,69,71,73],$V7=[2,62,65,69,71,73],$V8=[1,95],$V9=[1,145];
var parser = {trace: function trace () { },
yy: {},
symbols_: {"error":2,"inicio":3,"cc":4,"EOF":5,"parametros":6,"parametro":7,"href":8,"background":9,"color":10,"font_size":11,"font_family":12,"text_align":13,"type":14,"id":15,"name":16,"cols":17,"rows":18,"class":19,"src":20,"width":21,"height":22,"onclick":23,"CORIZQ":24,"HREF":25,"IGUAL":26,"COMILL":27,"VALOR":28,"CORDER":29,"BACKGROUND":30,"COLOR":31,"F_SIZE":32,"F_FAM":33,"TEXT_AL":34,"TYPE":35,"ID":36,"NAME":37,"COLS":38,"ROWS":39,"CLASS":40,"SRC":41,"WIDTH":42,"HEIGHT":43,"ONCLICK":44,"etiquetas":45,"etiqueta":46,"head":47,"title":48,"body":49,"div":50,"select":51,"link":52,"spam":53,"input":54,"t_area":55,"img":56,"br":57,"button":58,"h1":59,"P":60,"valor":61,"MENQUE":62,"HEAD":63,"MAYQUE":64,"HEAD_FIN":65,"TITLE":66,"TITLE_FIN":67,"CC":68,"CC_FIN":69,"BODY":70,"BODY_FIN":71,"DIV":72,"DIV_FIN":73,"SELECT":74,"opciones":75,"SELECT_FIN":76,"option":77,"OPTION":78,"OPTION_FIN":79,"options":80,"LINK":81,"LINK_FIN":82,"SPAM":83,"SPAM_FIN":84,"INPUT":85,"INPUT_FIN":86,"TEXTAREA":87,"TEXTAREA_FIN":88,"IMG":89,"BR":90,"BARRA":91,"BUTTON":92,"BUTTON_FIN":93,"H1":94,"H1_FIN":95,"P_FIN":96,"$accept":0,"$end":1},
terminals_: {2:"error",5:"EOF",24:"CORIZQ",25:"HREF",26:"IGUAL",27:"COMILL",28:"VALOR",29:"CORDER",30:"BACKGROUND",31:"COLOR",32:"F_SIZE",33:"F_FAM",34:"TEXT_AL",35:"TYPE",36:"ID",37:"NAME",38:"COLS",39:"ROWS",40:"CLASS",41:"SRC",42:"WIDTH",43:"HEIGHT",44:"ONCLICK",62:"MENQUE",63:"HEAD",64:"MAYQUE",65:"HEAD_FIN",66:"TITLE",67:"TITLE_FIN",68:"CC",69:"CC_FIN",70:"BODY",71:"BODY_FIN",72:"DIV",73:"DIV_FIN",74:"SELECT",75:"opciones",76:"SELECT_FIN",78:"OPTION",79:"OPTION_FIN",81:"LINK",82:"LINK_FIN",83:"SPAM",84:"SPAM_FIN",85:"INPUT",86:"INPUT_FIN",87:"TEXTAREA",88:"TEXTAREA_FIN",89:"IMG",90:"BR",91:"BARRA",92:"BUTTON",93:"BUTTON_FIN",94:"H1",95:"H1_FIN",96:"P_FIN"},
productions_: [0,[3,2],[6,2],[6,0],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[8,7],[9,7],[10,7],[11,7],[12,7],[13,7],[14,7],[15,7],[16,7],[17,7],[18,7],[19,7],[20,7],[21,7],[22,7],[23,7],[45,2],[45,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[46,1],[61,1],[47,5],[48,5],[4,6],[49,6],[50,6],[51,6],[77,5],[80,2],[80,1],[52,6],[53,6],[54,6],[55,6],[56,4],[57,3],[57,4],[58,6],[59,6],[60,6]],
performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate /* action[1] */, $$ /* vstack */, _$ /* lstack */) {
/* this == yyval */

var $0 = $$.length - 1;
switch (yystate) {
case 2:

				params = $$[$0]; 
				par = $$[$0-1];
				res = [];
				res.push(par);

				if(params != undefined){
					params.foreach(p=>{
						res.push(p);
					});
				}
				this.$ = res; 
			
break;
case 3:
 this.$ = undefined;  
break;
case 4: case 5: case 6: case 7: case 8: case 9: case 10: case 11: case 12: case 13: case 14: case 15: case 16: case 17: case 18: case 19:
 this.$ = $$[$0]; 
break;
case 20:
 this.$ = new PARAMETRO("HREF"		  , $$[$0-2]); 
break;
case 21:
 this.$ = new PARAMETRO("BACKGROUND" , $$[$0-2]); 
break;
case 22:
 this.$ = new PARAMETRO("COLOR"	  , $$[$0-2]); 
break;
case 23:
 this.$ = new PARAMETRO("FONT_SIZE"  , $$[$0-2]); 
break;
case 24:
 this.$ = new PARAMETRO("FONT_FAMILY", $$[$0-2]); 
break;
case 25:
 this.$ = new PARAMETRO("TEXT_ALIGN" , $$[$0-2]); 
break;
case 26:
 this.$ = new PARAMETRO("TIPO"       , $$[$0-2]); 
break;
case 27:
 this.$ = new PARAMETRO("ID"         , $$[$0-2]); 
break;
case 28:
 this.$ = new PARAMETRO("NAME"       , $$[$0-2]); 
break;
case 29:
 this.$ = new PARAMETRO("COLS"       , $$[$0-2]); 
break;
case 30:
 this.$ = new PARAMETRO("ROWS"       , $$[$0-2]); 
break;
case 31:
 this.$ = new PARAMETRO("CLASS"      , $$[$0-2]); 
break;
case 32:
 this.$ = new PARAMETRO("SRC"        , $$[$0-2]); 
break;
case 33:
 this.$ = new PARAMETRO("WIDTH"      , $$[$0-2]); 
break;
case 34:
 this.$ = new PARAMETRO("HEIGHT"     , $$[$0-2]); 
break;
case 35:
 this.$ = new PARAMETRO("ONCLICK"    , $$[$0-2]); 
break;
case 53:

	console.log('Error: ' + yytext + ' linea: ' + (this._$.first_line) + ' columna: ' + (this._$.first_column));

break;
}
},
table: [{3:1,4:2,62:[1,3]},{1:[3]},{5:[1,4]},{68:$V0},{1:[2,1]},{6:6,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{64:[1,25]},{6:26,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},o($V3,[2,4]),o($V3,[2,5]),o($V3,[2,6]),o($V3,[2,7]),o($V3,[2,8]),o($V3,[2,9]),o($V3,[2,10]),o($V3,[2,11]),o($V3,[2,12]),o($V3,[2,13]),o($V3,[2,14]),o($V3,[2,15]),o($V3,[2,16]),o($V3,[2,17]),o($V3,[2,18]),o($V3,[2,19]),{25:[1,27],30:[1,28],31:[1,29],32:[1,30],33:[1,31],34:[1,32],35:[1,33],36:[1,34],37:[1,35],38:[1,36],39:[1,37],40:[1,38],41:[1,39],42:[1,40],43:[1,41],44:[1,42]},{2:$V4,4:47,45:43,46:44,47:45,48:46,49:48,50:49,51:50,52:51,53:52,54:53,55:54,56:55,57:56,58:57,59:58,60:59,62:$V5},{64:[2,2]},{26:[1,62]},{26:[1,63]},{26:[1,64]},{26:[1,65]},{26:[1,66]},{26:[1,67]},{26:[1,68]},{26:[1,69]},{26:[1,70]},{26:[1,71]},{26:[1,72]},{26:[1,73]},{26:[1,74]},{26:[1,75]},{26:[1,76]},{26:[1,77]},{69:[1,78]},o($V6,[2,37],{46:44,47:45,48:46,4:47,49:48,50:49,51:50,52:51,53:52,54:53,55:54,56:55,57:56,58:57,59:58,60:59,45:79,2:$V4,62:$V5}),o($V7,[2,38]),o($V7,[2,39]),o($V7,[2,40]),o($V7,[2,41]),o($V7,[2,42]),o($V7,[2,43]),o($V7,[2,44]),o($V7,[2,45]),o($V7,[2,46]),o($V7,[2,47]),o($V7,[2,48]),o($V7,[2,49]),o($V7,[2,50]),o($V7,[2,51]),o($V7,[2,52]),o($V7,[2,53]),{60:94,62:$V8,63:[1,80],66:[1,81],68:$V0,70:[1,82],72:[1,83],74:[1,84],81:[1,85],83:[1,86],85:[1,87],87:[1,88],89:[1,89],90:[1,90],91:[1,91],92:[1,92],94:[1,93]},{27:[1,96]},{27:[1,97]},{27:[1,98]},{27:[1,99]},{27:[1,100]},{27:[1,101]},{27:[1,102]},{27:[1,103]},{27:[1,104]},{27:[1,105]},{27:[1,106]},{27:[1,107]},{27:[1,108]},{27:[1,109]},{27:[1,110]},{27:[1,111]},o([2,5,62,65,69,71,73],[2,57]),o($V6,[2,36]),{64:[1,112]},{64:[1,113]},{6:114,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:115,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:116,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:117,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:118,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:119,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:120,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:121,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{64:[1,122]},{90:[1,123]},{6:124,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:125,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{6:126,7:7,8:8,9:9,10:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:$V1,64:$V2},{60:94,62:$V8},{28:[1,127]},{28:[1,128]},{28:[1,129]},{28:[1,130]},{28:[1,131]},{28:[1,132]},{28:[1,133]},{28:[1,134]},{28:[1,135]},{28:[1,136]},{28:[1,137]},{28:[1,138]},{28:[1,139]},{28:[1,140]},{28:[1,141]},{28:[1,142]},{2:$V4,4:47,45:143,46:44,47:45,48:46,49:48,50:49,51:50,52:51,53:52,54:53,55:54,56:55,57:56,58:57,59:58,60:59,62:$V5},{28:$V9,61:144},{64:[1,146]},{64:[1,147]},{64:[1,148]},{64:[1,149]},{64:[1,150]},{64:[1,151]},{64:[1,152]},{64:[1,153]},o($V7,[2,69]),{64:[1,154]},{64:[1,155]},{64:[1,156]},{64:[1,157]},{27:[1,158]},{27:[1,159]},{27:[1,160]},{27:[1,161]},{27:[1,162]},{27:[1,163]},{27:[1,164]},{27:[1,165]},{27:[1,166]},{27:[1,167]},{27:[1,168]},{27:[1,169]},{27:[1,170]},{27:[1,171]},{27:[1,172]},{27:[1,173]},{65:[1,174]},{67:[1,175]},o([67,82,84,86,88,93,95,96],[2,54]),{2:$V4,4:47,45:176,46:44,47:45,48:46,49:48,50:49,51:50,52:51,53:52,54:53,55:54,56:55,57:56,58:57,59:58,60:59,62:$V5},{2:$V4,4:47,45:177,46:44,47:45,48:46,49:48,50:49,51:50,52:51,53:52,54:53,55:54,56:55,57:56,58:57,59:58,60:59,62:$V5},{75:[1,178]},{28:$V9,61:179},{28:$V9,61:180},{28:$V9,61:181},{28:$V9,61:182},o($V7,[2,68]),o($V7,[2,70]),{28:$V9,61:183},{28:$V9,61:184},{28:$V9,61:185},{29:[1,186]},{29:[1,187]},{29:[1,188]},{29:[1,189]},{29:[1,190]},{29:[1,191]},{29:[1,192]},{29:[1,193]},{29:[1,194]},{29:[1,195]},{29:[1,196]},{29:[1,197]},{29:[1,198]},{29:[1,199]},{29:[1,200]},{29:[1,201]},o($V7,[2,55]),o($V7,[2,56]),{71:[1,202]},{73:[1,203]},{76:[1,204]},{82:[1,205]},{84:[1,206]},{86:[1,207]},{88:[1,208]},{93:[1,209]},{95:[1,210]},{96:[1,211]},o($V3,[2,20]),o($V3,[2,21]),o($V3,[2,22]),o($V3,[2,23]),o($V3,[2,24]),o($V3,[2,25]),o($V3,[2,26]),o($V3,[2,27]),o($V3,[2,28]),o($V3,[2,29]),o($V3,[2,30]),o($V3,[2,31]),o($V3,[2,32]),o($V3,[2,33]),o($V3,[2,34]),o($V3,[2,35]),o($V7,[2,58]),o($V7,[2,59]),o($V7,[2,60]),o($V7,[2,64]),o($V7,[2,65]),o($V7,[2,66]),o($V7,[2,67]),o($V7,[2,71]),o($V7,[2,72]),o([2,24,62,64,65,69,71,73],[2,73])],
defaultActions: {4:[2,1],26:[2,2]},
parseError: function parseError (str, hash) {
    if (hash.recoverable) {
        this.trace(str);
    } else {
        var error = new Error(str);
        error.hash = hash;
        throw error;
    }
},
parse: function parse (input) {
    var self = this,
        stack = [0],
        tstack = [], // token stack
        vstack = [null], // semantic value stack
        lstack = [], // location stack
        table = this.table,
        yytext = '',
        yylineno = 0,
        yyleng = 0,
        recovering = 0,
        TERROR = 2,
        EOF = 1;

    var args = lstack.slice.call(arguments, 1);

    //this.reductionCount = this.shiftCount = 0;

    var lexer = Object.create(this.lexer);
    var sharedState = { yy: {} };
    // copy state
    for (var k in this.yy) {
      if (Object.prototype.hasOwnProperty.call(this.yy, k)) {
        sharedState.yy[k] = this.yy[k];
      }
    }

    lexer.setInput(input, sharedState.yy);
    sharedState.yy.lexer = lexer;
    sharedState.yy.parser = this;
    if (typeof lexer.yylloc == 'undefined') {
        lexer.yylloc = {};
    }
    var yyloc = lexer.yylloc;
    lstack.push(yyloc);

    var ranges = lexer.options && lexer.options.ranges;

    if (typeof sharedState.yy.parseError === 'function') {
        this.parseError = sharedState.yy.parseError;
    } else {
        this.parseError = Object.getPrototypeOf(this).parseError;
    }

    function popStack (n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }

_token_stack:
    var lex = function () {
        var token;
        token = lexer.lex() || EOF;
        // if token isn't its numeric value, convert
        if (typeof token !== 'number') {
            token = self.symbols_[token] || token;
        }
        return token;
    }

    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        // retreive state number from top of stack
        state = stack[stack.length - 1];

        // use default actions if available
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol === null || typeof symbol == 'undefined') {
                symbol = lex();
            }
            // read action for current state and first input
            action = table[state] && table[state][symbol];
        }

_handle_error:
        // handle parse error
        if (typeof action === 'undefined' || !action.length || !action[0]) {
            var error_rule_depth;
            var errStr = '';

            // Return the rule stack depth where the nearest error rule can be found.
            // Return FALSE when no error recovery rule was found.
            function locateNearestErrorRecoveryRule(state) {
                var stack_probe = stack.length - 1;
                var depth = 0;

                // try to recover from error
                for(;;) {
                    // check for error recovery rule in this state
                    if ((TERROR.toString()) in table[state]) {
                        return depth;
                    }
                    if (state === 0 || stack_probe < 2) {
                        return false; // No suitable error recovery rule available.
                    }
                    stack_probe -= 2; // popStack(1): [symbol, action]
                    state = stack[stack_probe];
                    ++depth;
                }
            }

            if (!recovering) {
                // first see if there's any chance at hitting an error recovery rule:
                error_rule_depth = locateNearestErrorRecoveryRule(state);

                // Report error
                expected = [];
                for (p in table[state]) {
                    if (this.terminals_[p] && p > TERROR) {
                        expected.push("'"+this.terminals_[p]+"'");
                    }
                }
                if (lexer.showPosition) {
                    errStr = 'Parse error on line '+(yylineno+1)+":\n"+lexer.showPosition()+"\nExpecting "+expected.join(', ') + ", got '" + (this.terminals_[symbol] || symbol)+ "'";
                } else {
                    errStr = 'Parse error on line '+(yylineno+1)+": Unexpected " +
                                  (symbol == EOF ? "end of input" :
                                              ("'"+(this.terminals_[symbol] || symbol)+"'"));
                }
                this.parseError(errStr, {
                    text: lexer.match,
                    token: this.terminals_[symbol] || symbol,
                    line: lexer.yylineno,
                    loc: yyloc,
                    expected: expected,
                    recoverable: (error_rule_depth !== false)
                });
            } else if (preErrorSymbol !== EOF) {
                error_rule_depth = locateNearestErrorRecoveryRule(state);
            }

            // just recovered from another error
            if (recovering == 3) {
                if (symbol === EOF || preErrorSymbol === EOF) {
                    throw new Error(errStr || 'Parsing halted while starting to recover from another error.');
                }

                // discard current lookahead and grab another
                yyleng = lexer.yyleng;
                yytext = lexer.yytext;
                yylineno = lexer.yylineno;
                yyloc = lexer.yylloc;
                symbol = lex();
            }

            // try to recover from error
            if (error_rule_depth === false) {
                throw new Error(errStr || 'Parsing halted. No suitable error recovery rule available.');
            }
            popStack(error_rule_depth);

            preErrorSymbol = (symbol == TERROR ? null : symbol); // save the lookahead token
            symbol = TERROR;         // insert generic error symbol as new lookahead
            state = stack[stack.length-1];
            action = table[state] && table[state][TERROR];
            recovering = 3; // allow 3 real symbols to be shifted before reporting a new error
        }

        // this shouldn't happen, unless resolve defaults are off
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error('Parse Error: multiple actions possible at state: '+state+', token: '+symbol);
        }

        switch (action[0]) {
            case 1: // shift
                //this.shiftCount++;

                stack.push(symbol);
                vstack.push(lexer.yytext);
                lstack.push(lexer.yylloc);
                stack.push(action[1]); // push state
                symbol = null;
                if (!preErrorSymbol) { // normal execution/no error
                    yyleng = lexer.yyleng;
                    yytext = lexer.yytext;
                    yylineno = lexer.yylineno;
                    yyloc = lexer.yylloc;
                    if (recovering > 0) {
                        recovering--;
                    }
                } else {
                    // error just occurred, resume old lookahead f/ before error
                    symbol = preErrorSymbol;
                    preErrorSymbol = null;
                }
                break;

            case 2:
                // reduce
                //this.reductionCount++;

                len = this.productions_[action[1]][1];

                // perform semantic action
                yyval.$ = vstack[vstack.length-len]; // default to $$ = $1
                // default location, uses first token for firsts, last for lasts
                yyval._$ = {
                    first_line: lstack[lstack.length-(len||1)].first_line,
                    last_line: lstack[lstack.length-1].last_line,
                    first_column: lstack[lstack.length-(len||1)].first_column,
                    last_column: lstack[lstack.length-1].last_column
                };
                if (ranges) {
                  yyval._$.range = [lstack[lstack.length-(len||1)].range[0], lstack[lstack.length-1].range[1]];
                }
                r = this.performAction.apply(yyval, [yytext, yyleng, yylineno, sharedState.yy, action[1], vstack, lstack].concat(args));

                if (typeof r !== 'undefined') {
                    return r;
                }

                // pop off stack
                if (len) {
                    stack = stack.slice(0,-1*len*2);
                    vstack = vstack.slice(0, -1*len);
                    lstack = lstack.slice(0, -1*len);
                }

                stack.push(this.productions_[action[1]][0]);    // push nonterminal (reduce)
                vstack.push(yyval.$);
                lstack.push(yyval._$);
                // goto new state = table[STATE][NONTERMINAL]
                newState = table[stack[stack.length-2]][stack[stack.length-1]];
                stack.push(newState);
                break;

            case 3:
                // accept
                return true;
        }

    }

    return true;
}};
	
	

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

	import { PARAMETRO } from "../componentes/PARAMETRO";
	
	

	var parametros = [];



 
		//Codigo javascript incrustado
		function mostrarToken(mensaje, token){
			console.log("Token: " + mensaje + " | Valor: " + token);
		}
	/* generated by jison-lex 0.3.4 */
var lexer = (function(){
var lexer = ({

EOF:1,

parseError:function parseError(str, hash) {
        if (this.yy.parser) {
            this.yy.parser.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },

// resets the lexer, sets new input
setInput:function (input, yy) {
        this.yy = yy || this.yy || {};
        this._input = input;
        this._more = this._backtrack = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {
            first_line: 1,
            first_column: 0,
            last_line: 1,
            last_column: 0
        };
        if (this.options.ranges) {
            this.yylloc.range = [0,0];
        }
        this.offset = 0;
        return this;
    },

// consumes and returns one char from the input
input:function () {
        var ch = this._input[0];
        this.yytext += ch;
        this.yyleng++;
        this.offset++;
        this.match += ch;
        this.matched += ch;
        var lines = ch.match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno++;
            this.yylloc.last_line++;
        } else {
            this.yylloc.last_column++;
        }
        if (this.options.ranges) {
            this.yylloc.range[1]++;
        }

        this._input = this._input.slice(1);
        return ch;
    },

// unshifts one char (or a string) into the input
unput:function (ch) {
        var len = ch.length;
        var lines = ch.split(/(?:\r\n?|\n)/g);

        this._input = ch + this._input;
        this.yytext = this.yytext.substr(0, this.yytext.length - len);
        //this.yyleng -= len;
        this.offset -= len;
        var oldLines = this.match.split(/(?:\r\n?|\n)/g);
        this.match = this.match.substr(0, this.match.length - 1);
        this.matched = this.matched.substr(0, this.matched.length - 1);

        if (lines.length - 1) {
            this.yylineno -= lines.length - 1;
        }
        var r = this.yylloc.range;

        this.yylloc = {
            first_line: this.yylloc.first_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.first_column,
            last_column: lines ?
                (lines.length === oldLines.length ? this.yylloc.first_column : 0)
                 + oldLines[oldLines.length - lines.length].length - lines[0].length :
              this.yylloc.first_column - len
        };

        if (this.options.ranges) {
            this.yylloc.range = [r[0], r[0] + this.yyleng - len];
        }
        this.yyleng = this.yytext.length;
        return this;
    },

// When called from action, caches matched text and appends it on next action
more:function () {
        this._more = true;
        return this;
    },

// When called from action, signals the lexer that this rule fails to match the input, so the next matching rule (regex) should be tested instead.
reject:function () {
        if (this.options.backtrack_lexer) {
            this._backtrack = true;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. You can only invoke reject() in the lexer when the lexer is of the backtracking persuasion (options.backtrack_lexer = true).\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });

        }
        return this;
    },

// retain first n characters of the match
less:function (n) {
        this.unput(this.match.slice(n));
    },

// displays already matched input, i.e. for error messages
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },

// displays upcoming input, i.e. for error messages
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20) + (next.length > 20 ? '...' : '')).replace(/\n/g, "");
    },

// displays the character position where the lexing error occurred, i.e. for error messages
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c + "^";
    },

// test the lexed token: return FALSE when not a match, otherwise return token
test_match:function(match, indexed_rule) {
        var token,
            lines,
            backup;

        if (this.options.backtrack_lexer) {
            // save context
            backup = {
                yylineno: this.yylineno,
                yylloc: {
                    first_line: this.yylloc.first_line,
                    last_line: this.last_line,
                    first_column: this.yylloc.first_column,
                    last_column: this.yylloc.last_column
                },
                yytext: this.yytext,
                match: this.match,
                matches: this.matches,
                matched: this.matched,
                yyleng: this.yyleng,
                offset: this.offset,
                _more: this._more,
                _input: this._input,
                yy: this.yy,
                conditionStack: this.conditionStack.slice(0),
                done: this.done
            };
            if (this.options.ranges) {
                backup.yylloc.range = this.yylloc.range.slice(0);
            }
        }

        lines = match[0].match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno += lines.length;
        }
        this.yylloc = {
            first_line: this.yylloc.last_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.last_column,
            last_column: lines ?
                         lines[lines.length - 1].length - lines[lines.length - 1].match(/\r?\n?/)[0].length :
                         this.yylloc.last_column + match[0].length
        };
        this.yytext += match[0];
        this.match += match[0];
        this.matches = match;
        this.yyleng = this.yytext.length;
        if (this.options.ranges) {
            this.yylloc.range = [this.offset, this.offset += this.yyleng];
        }
        this._more = false;
        this._backtrack = false;
        this._input = this._input.slice(match[0].length);
        this.matched += match[0];
        token = this.performAction.call(this, this.yy, this, indexed_rule, this.conditionStack[this.conditionStack.length - 1]);
        if (this.done && this._input) {
            this.done = false;
        }
        if (token) {
            return token;
        } else if (this._backtrack) {
            // recover context
            for (var k in backup) {
                this[k] = backup[k];
            }
            return false; // rule action called reject() implying the next rule should be tested instead.
        }
        return false;
    },

// return next match in input
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) {
            this.done = true;
        }

        var token,
            match,
            tempMatch,
            index;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i = 0; i < rules.length; i++) {
            tempMatch = this._input.match(this.rules[rules[i]]);
            if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
                match = tempMatch;
                index = i;
                if (this.options.backtrack_lexer) {
                    token = this.test_match(tempMatch, rules[i]);
                    if (token !== false) {
                        return token;
                    } else if (this._backtrack) {
                        match = false;
                        continue; // rule action called reject() implying a rule MISmatch.
                    } else {
                        // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
                        return false;
                    }
                } else if (!this.options.flex) {
                    break;
                }
            }
        }
        if (match) {
            token = this.test_match(match, rules[index]);
            if (token !== false) {
                return token;
            }
            // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
            return false;
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. Unrecognized text.\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });
        }
    },

// return next match that has a token
lex:function lex () {
        var r = this.next();
        if (r) {
            return r;
        } else {
            return this.lex();
        }
    },

// activates a new lexer condition state (pushes the new lexer condition state onto the condition stack)
begin:function begin (condition) {
        this.conditionStack.push(condition);
    },

// pop the previously active lexer condition state off the condition stack
popState:function popState () {
        var n = this.conditionStack.length - 1;
        if (n > 0) {
            return this.conditionStack.pop();
        } else {
            return this.conditionStack[0];
        }
    },

// produce the lexer rule set which is active for the currently active lexer condition state
_currentRules:function _currentRules () {
        if (this.conditionStack.length && this.conditionStack[this.conditionStack.length - 1]) {
            return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
        } else {
            return this.conditions["INITIAL"].rules;
        }
    },

// return the currently active lexer condition state; when an index argument is provided it produces the N-th previous condition state, if available
topState:function topState (n) {
        n = this.conditionStack.length - 1 - Math.abs(n || 0);
        if (n >= 0) {
            return this.conditionStack[n];
        } else {
            return "INITIAL";
        }
    },

// alias for begin(condition)
pushState:function pushState (condition) {
        this.begin(condition);
    },

// return the number of states currently on the stack
stateStackSize:function stateStackSize() {
        return this.conditionStack.length;
    },
options: {},
performAction: function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {
var YYSTATE=YY_START;
switch($avoiding_name_collisions) {
case 0:/*ignorar*/
break;
case 1: mostrarToken('CC'			, yy_.yytext);   return 68;  	     
break;
case 2: mostrarToken('HEAD'		, yy_.yytext);   return 63;      
break;
case 3: mostrarToken('TITLE'		, yy_.yytext);	 return 66;     
break;
case 4: mostrarToken('LINK'		, yy_.yytext);	 return 81;      
break;
case 5: mostrarToken('BODY'		, yy_.yytext);	 return 70;      
break;
case 6: mostrarToken('SPAM'		, yy_.yytext);	 return 83;      
break;
case 7: mostrarToken('INPUT'		, yy_.yytext);	 return 85;     
break;
case 8: mostrarToken('TEXTAREA'	, yy_.yytext);	 return 87;  
break;
case 9: mostrarToken('SELECT'		, yy_.yytext);	 return 74; 	 
break;
case 10: mostrarToken('OPTION'		, yy_.yytext);	 return 78; 	 
break;
case 11: mostrarToken('DIV'		, yy_.yytext);	 return 72; 		 
break;
case 12: mostrarToken('IMG'		, yy_.yytext);	 return 89; 		 
break;
case 13: mostrarToken('BR'			, yy_.yytext);	 return 90; 		 
break;
case 14: mostrarToken('BUTTON'		, yy_.yytext);	 return 92; 	 
break;
case 15: mostrarToken('H1'			, yy_.yytext);	 return 94; 		 
break;
case 16: mostrarToken('P'			, yy_.yytext);	 return 'P'; 		 
break;
case 17: mostrarToken('SCRIPTING'	, yy_.yytext);   return 'SCRIPTING'; 
break;
case 18: mostrarToken('CC_FIN'       , yy_.yytext);	 return 69;	    
break;
case 19: mostrarToken('HEAD_FIN'     , yy_.yytext);	 return 65;     
break;
case 20: mostrarToken('TITLE_FIN'    , yy_.yytext);	 return 67;    
break;
case 21: mostrarToken('LINK_FIN'     , yy_.yytext);	 return 82;     
break;
case 22: mostrarToken('BODY_FIN'     , yy_.yytext);	 return 71;     
break;
case 23: mostrarToken('SPAM_FIN'     , yy_.yytext);     return 84;     
break;
case 24: mostrarToken('INPUT_FIN'    , yy_.yytext);     return 86;    
break;
case 25: mostrarToken('TEXTAREA_FIN' , yy_.yytext);     return 88; 
break;
case 26: mostrarToken('SELECT_FIN'   , yy_.yytext);     return 76;   
break;
case 27: mostrarToken('OPTION_FIN'   , yy_.yytext);     return 79;   
break;
case 28: mostrarToken('DIV_FIN'      , yy_.yytext);	 return 73;      
break;
case 29: mostrarToken('IMG_FIN'      , yy_.yytext);	 return 'IMG_FIN';      
break;
case 30: mostrarToken('BR_FIN'       , yy_.yytext);	 return 'BR_FIN';       
break;
case 31: mostrarToken('BUTTON_FIN'   , yy_.yytext);     return 93;   
break;
case 32: mostrarToken('H1_FIN'       , yy_.yytext);	 return 95;       
break;
case 33: mostrarToken('P_FIN'        , yy_.yytext);	 return 96;        
break;
case 34: mostrarToken('SCRIPTING_FIN', yy_.yytext);     return 'SCRIPTING_FIN';
break;
case 35: mostrarToken("MENQUE", yy_.yytext); return 62; 
break;
case 36: mostrarToken("MAYQUE", yy_.yytext); return 64; 
break;
case 37: mostrarToken("CORIZQ", yy_.yytext); return 24; 
break;
case 38: mostrarToken("CORDER", yy_.yytext); return 29; 
break;
case 39: mostrarToken("IGUAL" , yy_.yytext);  return 26; 
break;
case 40: mostrarToken("BARRA" , yy_.yytext);  return 91; 
break;
case 41: mostrarToken("COMILL", yy_.yytext); return 27; 
break;
case 42: mostrarToken('HREF'		 , yy_.yytext);   return 25;	  
break;
case 43: mostrarToken('BACKGROUND', yy_.yytext);   return 30;
break;
case 44: mostrarToken('COLOR'	 , yy_.yytext);   return 31;	  
break;
case 45: mostrarToken('F_SIZE'	 , yy_.yytext);   return 32;	  
break;
case 46: mostrarToken('F_FAM' 	 , yy_.yytext);   return 33;	  
break;
case 47: mostrarToken('TEXT_AL'	 , yy_.yytext);   return 34;	  
break;
case 48: mostrarToken('TYPE'		 , yy_.yytext);   return 35;	  
break;
case 49: mostrarToken('ID'		 , yy_.yytext);   return 36;		  
break;
case 50: mostrarToken('NAME'		 , yy_.yytext);   return 37;      
break;
case 51: mostrarToken('COLS' 	 , yy_.yytext);   return 38;      
break;
case 52: mostrarToken('ROWS'		 , yy_.yytext);   return 39;      
break;
case 53: mostrarToken('CLASS'	 , yy_.yytext);   return 40;     
break;
case 54: mostrarToken('SRC'		 , yy_.yytext);   return 41;       
break;
case 55: mostrarToken('WIDTH'	 , yy_.yytext);   return 42;     
break;
case 56: mostrarToken('HEIGHT'	 , yy_.yytext);   return 43;    
break;
case 57: mostrarToken('ONCLICK'	 , yy_.yytext);   return 44;   
break;
case 58:mostrarToken("VALOR", yy_.yytext); return 28;
break;
case 59:return 5
break;
case 60:return 'INVALID'
break;
}
},
rules: [/^(?:[ \r\t\n])/,/^(?:C_CC\b)/,/^(?:C_HEAD\b)/,/^(?:C_TITLE\b)/,/^(?:C_LINK\b)/,/^(?:C_BODY\b)/,/^(?:C_SPAM\b)/,/^(?:C_INPUT\b)/,/^(?:C_TEXTAREA\b)/,/^(?:C_SELECT\b)/,/^(?:C_OPTION\b)/,/^(?:C_DIV\b)/,/^(?:C_IMG\b)/,/^(?:C_BR\b)/,/^(?:C_BUTTON\b)/,/^(?:C_H1\b)/,/^(?:C_P\b)/,/^(?:C_SCRIPTING\b)/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_CC[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_HEAD[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_TITLE[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_LINK[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_BODY[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_SPAM[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_INPUT[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_TEXTAREA[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_SELECT[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_OPTION[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_DIV[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_IMG[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_BR[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_BUTTON[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_H1[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_P[\r\t\n]*>))/,/^(?:(<[ \r\t\n]*\/[ \r\t\n]*C_SCRIPTING[\r\t\n]*>))/,/^(?:<)/,/^(?:>)/,/^(?:\[)/,/^(?:\])/,/^(?:=)/,/^(?:\/)/,/^(?:(“|”|"))/,/^(?:href\b)/,/^(?:background\b)/,/^(?:color\b)/,/^(?:font-size\b)/,/^(?:font-family\b)/,/^(?:text-align\b)/,/^(?:type\b)/,/^(?:id\b)/,/^(?:name\b)/,/^(?:cols\b)/,/^(?:rows\b)/,/^(?:class\b)/,/^(?:src\b)/,/^(?:width\b)/,/^(?:height\b)/,/^(?:onclick\(\))/,/^(?:[a-zA-Z0-9.#/%_()]+)/,/^(?:$)/,/^(?:.)/],
conditions: {"INITIAL":{"rules":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60],"inclusive":true}}
});
return lexer;
})();
parser.lexer = lexer;
function Parser () {
  this.yy = {};
}
Parser.prototype = parser;parser.Parser = Parser;
return new Parser;
})();


if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = CLang;
exports.Parser = CLang.Parser;
exports.parse = function () { return CLang.parse.apply(CLang, arguments); };
exports.main = function commonjsMain (args) {
    if (!args[1]) {
        console.log('Usage: '+args[0]+' FILE');
        process.exit(1);
    }
    var source = require('fs').readFileSync(require('path').normalize(args[1]), "utf8");
    return exports.parser.parse(source);
};
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(process.argv.slice(1));
}
}