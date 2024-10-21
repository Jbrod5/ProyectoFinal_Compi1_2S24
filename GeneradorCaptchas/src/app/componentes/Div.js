import { Componente } from "./Componente";

export class Div extends Componente{
    componentes = []

    fontSize; 
    fontFamily; 
    textAlign; 
    color; 
    id; 

    clase;
    background;  

    /**
     * Agrega una opcion a la lista de componentes interna.
     * @param {Option} componente 
     */
    agregarComponente(componente){
        this.componentes.push(componente);
    }

    /**
     * Establece un parametro para el componente. 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'COLOR':
                if(this.color != undefined){
                    var mensaje ="Error Semantico: se intento establecer el parametro color pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                //1. Evaluar si es un color preestablecido
                var c = valor.toLowerCase();
                switch(c){
                    case 'black': this.color =   '#000000';
                        break;
                    case 'olive': this.color =    '#808000';
                        break;
                    case 'teal': this.color =   '#008080';
                        break; 
                    case 'red': this.color =   '#FF0000';
                        break; 
                    case 'blue': this.color =   '#0000FF';
                        break;
                    case 'maroon': this.color =   '#800000';
                        break; 
                    case 'navy': this.color =   '#000080';
                        break; 
                    case 'gray': this.color =   '#808080';
                        break; 
                    case 'lime': this.color =   '#00FF00';
                        break; 
                    case 'fucshia': this.color =   '#FF00FF';
                        break; 
                    case 'green': this.color =   '#008000';
                        break; 
                    case 'white': this.color =   '#FFFFFF';
                        break; 
                    case 'purple': this.color =   '#800080';
                        break;
                    case 'silver': this.color =   '#C0C0C0';
                        break;
                    case 'yellow': this.color =   '#FFFF00';
                        break; 
                    case 'aqua': this.color =   '#00FFFF';
                        break;
                    default: 
                        this.color = valor;  
                }
                break;
            case 'FONT_SIZE':
                if(this.font_size != undefined){
                    var mensaje ="Error Semantico: se intento establecer el parametro font-size pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.font_size = valor;  
                break;
            case 'FONT_FAMILY':
                if(this.font_family != undefined){
                    var mensaje ="Error Semantico: se intento establecer el parametro font_family pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                this.font_family = valor;
                break;
            case 'TEXT_ALIGN':
                if(this.text_align != undefined){
                    var mensaje ="Error Semantico: se intento establecer el parametro text-align pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                var al = valor.toLowerCase(); 
                switch(al){
                    case 'left': this.text_align = 'left'; break; 
                    case 'right': this.text_align = 'right'; break; 
                    case 'center': this.text_align = 'center'; break; 
                    case 'justify': this.text_align = 'justify'; break;                    
                    default: this.lanzarExcepcionSintactica("Error Sintactico: se intento establecer una alineacion de texto " + al + " pero no es una alineacion valida.")
                }
                break;
            case 'ID':
                if(this.id != undefined){
                    var mensaje ="Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            case 'CLASS':
                var c = valor.toLocaleLowerCase();
                if(c === "row" || c === "column"){
                    this.clase = c; 
                }else{
                    super.lanzarExcepcionSintactica("Error sintactico: Se quizo establecer la propiedad class " + valor + " en un Div pero no es una clase valida.");
                }
                break; 
            case 'BACKGROUND':
                if(this.background == undefined){
                    var c = valor.toLowerCase();
                    switch(c){
                        case 'black': this.background = '#000000';
                            break;
                        case 'olive': this.background =  '#808000';
                            break;
                        case 'teal': this.background = '#008080';
                            break; 
                        case 'red': this.background = '#FF0000';
                            break; 
                        case 'blue': this.background = '#0000FF';
                            break;
                        case 'maroon': this.background = '#800000';
                            break; 
                        case 'navy': this.background = '#000080';
                            break; 
                        case 'gray': this.background = '#808080';
                            break; 
                        case 'lime': this.background = '#00FF00';
                            break; 
                        case 'fucshia': this.background = '#FF00FF';
                            break; 
                        case 'green': this.background = '#008000';
                            break; 
                        case 'white': this.background = '#FFFFFF';
                            break; 
                        case 'purple': this.background = '#800080';
                            break;
                        case 'silver': this.background = '#C0C0C0';
                            break;
                        case 'yellow': this.background = '#FFFF00';
                            break; 
                        case 'aqua': this.background = '#00FFFF';
                            break;
                        default: 
                            this.background = valor;  
                    }
                }else{
                    var mensaje ="Error Semantico: se intento establecer el parametro background pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje)
                }
                break; 
            default: 
                var mensaje ="Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia Div pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica();
        }

    }


    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){

        this.color = this.color || '#000000';
        this.fontSize = this.fontSize || '10px';
        this.fontFamily = this.fontFamily || 'Arial';
        this.textAlign = this.textAlign || 'left';
        this.background = this.background || '#FFFFFF';

        var style = "style=\"font-size: " + this.fontSize + "; font-family: " + this.fontFamily + "; text-align: " + this.textAlign + "; color: " + this.color + "; background-color: " + this.background + ";";
        if(this.clase != undefined && this.clase.toLowerCase() == 'row'){
            style += "display: flex; justify-content: center;\"";
        }else{
            style += "display: flex; flex-direction: column; align-items: center;\"";
        }

        var codigo = "<div id=\"" + this.id + "\"" + style + ">\n";
        this.componentes.forEach(componente =>{
            codigo += componente.obtenerCodigo() + "\n";
        });

        codigo += "\n</div>"
        return codigo; 
    }

}