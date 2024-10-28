import { Componente } from "./Componente";

export class H1 extends Componente{

    fontSize; 
    fontFamily; 
    textAlign; 
    id;
    color; 

    valor;


    /**
     * Establece un parametro para el componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor establecido.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'COLOR':
                if(this.color != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro color pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                //1. Evaluar si es un color preestablecido
               var c = valor.toLowerCase();
                switch(c){
                    case 'black': this.color = '#000000';
                        break;
                    case 'olive': this.color =  '#808000';
                        break;
                    case 'teal': this.color = '#008080';
                        break; 
                    case 'red': this.color = '#FF0000';
                        break; 
                    case 'blue': this.color = '#0000FF';
                        break;
                    case 'maroon': this.color = '#800000';
                        break; 
                    case 'navy': this.color = '#000080';
                        break; 
                    case 'gray': this.color = '#808080';
                        break; 
                    case 'lime': this.color = '#00FF00';
                        break; 
                    case 'fucshia': this.color = '#FF00FF';
                        break; 
                    case 'green': this.color = '#008000';
                        break; 
                    case 'white': this.color = '#FFFFFF';
                        break; 
                    case 'purple': this.color = '#800080';
                        break;
                    case 'silver': this.color = '#C0C0C0';
                        break;
                    case 'yellow': this.color = '#FFFF00';
                        break; 
                    case 'aqua': this.color = '#00FFFF';
                        break;
                    default: 
                        this.color = valor;  
                }
                break;
            case 'FONT_SIZE':
                if(this.fontSize != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro font-size pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.fontSize = valor;  
                break;
            case 'FONT_FAMILY':
                if(this.fontFamily != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro font_family pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                this.fontFamily = valor;
                break;
            case 'TEXT_ALIGN':
                if(this.textAlign != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro text-align pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                var al = valor.toLowerCase(); 
                switch(al){
                    case 'left': this.textAlign = 'left'; break; 
                    case 'right': this.textAlign = 'right'; break; 
                    case 'center': this.textAlign = 'center'; break; 
                    case 'justify': this.textAlign = 'justify'; break;                    
                    default: this.lanzarExcepcionSintactica("Error Sintactico: se intento establecer una alineacion de texto " + al + " pero no es una alineacion valida.")
                }
                break;
            case 'ID':
                if(this.id != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            default: 
                var mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia H1 pero no es un parametro valido para el componente.";
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
     * @returns {String} String con el codigo html del componente.. 
     */
    obtenerCodigo(){
        this.color = this.color || '#000000';
        this.fontSize = this.fontSize || '10px';
        this.fontFamily = this.fontFamily || 'Arial';
        this.textAlign = this.textAlign || 'left';

        var style = " style=\"";
        style += "color: " + this.color + "; ";
        style += "font-family: " + this.fontFamily + "; ";
        style += "font-size: " + this.fontSize + "; ";
        style += "text-align: " + this.textAlign + "; \"";

        var codigo = "<h1 id=\"" + this.id + "\" " + style +">" + this.valor + "</h1>";
        return codigo; 
    }

}