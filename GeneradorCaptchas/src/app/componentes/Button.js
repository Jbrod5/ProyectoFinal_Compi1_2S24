import { Componente } from "./Componente";

export class Button extends Componente{

    color;
    fontSize;
    fontFamily;
    textAlign;
    id;
    backround;
    

    onclick;


    valor; 

    /**
     * Establece un parametro para el componente; 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor establecido.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'COLOR':
                if(color != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro color pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                //1. Evaluar si es un color preestablecido
                c = valor.toLowerCase();
                switch(c){
                    case 'black': color = '#000000';
                        break;
                    case 'olive': color =  '#808000';
                        break;
                    case 'teal': color = '#008080';
                        break; 
                    case 'red': color = '#FF0000';
                        break; 
                    case 'blue': color = '#0000FF';
                        break;
                    case 'maroon': color = '#800000';
                        break; 
                    case 'navy': color = '#000080';
                        break; 
                    case 'gray': color = '#808080';
                        break; 
                    case 'lime': color = '#00FF00';
                        break; 
                    case 'fucshia': color = '#FF00FF';
                        break; 
                    case 'green': color = '#008000';
                        break; 
                    case 'white': color = '#FFFFFF';
                        break; 
                    case 'purple': color = '#800080';
                        break;
                    case 'silver': color = '#C0C0C0';
                        break;
                    case 'yellow': color = '#FFFF00';
                        break; 
                    case 'aqua': color = '#00FFFF';
                        break;
                    default: 
                        color = valor;  
                }
                break;
            case 'FONT_SIZE':
                if(this.font_size != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro font-size pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.font_size = valor;  
                break;
            case 'FONT_FAMILY':
                if(this.font_family != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro font_family pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                this.font_family = valor;
                break;
            case 'TEXT_ALIGN':
                if(this.text_align != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro text-align pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                al = valor.toLowerCase(); 
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
                    mensaje = "Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            case 'BACKGROUND':
                if(this.background == undefined){
                    c = valor.toLowerCase();
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
                    mensaje = "Error Semantico: se intento establecer el parametro background pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje)
                }
                break;
            case 'ONCLICK':
                if(this.onclick != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro ONCLICK pero ya estaba definido.")
                }
                this.onclick = valor; 
                break; 
            default: 
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia TextArea pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica();
        }
    }


    /**
     * Establece el valor que se encerrará entre las etiquetas de apertura y cierre.
     * @param {String} valor - Valor que se contendra entre las etiquetas de apertura y cierre. 
     */
    establecerValor(valor){
        this.valor = valor; 
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

        codigo = "<button ";
        codigo += "id=\"" + this.id + "\" ";
        codigo += "onclick=\"" + this.onclick + "\"";
        style = " style=\"";
        style += "background-color: " + this.background + "; ";
        style += "color: " + this.color + "; ";
        style += "font-family: " + this.fontFamily + "; ";
        style += "font-size: " + this.fontSize + "; ";
        style += "text-align: " + this.textAlign + "; \"";

        codigo += style + ">" + valor + "</button>"; 

        return codigo; 
    }

}