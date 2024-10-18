import { Componente } from "./Componente";

export class Spam extends Componente{

    color; 
    font_size;
    font_family;
    text_align;
    id;

    valor;

    /**
     * Establece un parametro del componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componete o si ese parámetro ya contaba con un valor.*/
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
                }
                color = valor;
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
            default:
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia Spam pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica(mensaje);
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

        codigo = "<p><span style=\"color: " + this.color + "; font-size: " +  this.fontSize + "; font-family: " + this.fontFamily + "; text-align: " + this.textAlign + ";>" + valor + "</span></p><>";
        return codigo; 
    }

}

