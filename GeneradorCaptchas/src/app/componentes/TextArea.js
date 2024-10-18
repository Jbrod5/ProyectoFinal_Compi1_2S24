import { Componente } from "./Componente";

export class TextArea extends Componente{

    fontSize; 
    fontFamily; 
    textAlign; 
    id; 
    cols; 
    rows; 

    /**
     * Establece un parametro para el componente. 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'COLS':
                if(this.cols != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro cols pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.cols = valor; 
                break; 
            case 'ROWS':
                if(this.rows != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro rows pero ya estaba definido";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.rows = valor;
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
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia TextArea pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica();
        }
    }

    /**
     * @returns {String} El codigo HTML del componente. 
     */
    obtenerCodigo(){
        this.fontSize = this.fontSize || '10px';
        this.fontFamily = this.fontFamily || 'Arial';
        this.textAlign = this.textAlign || 'left';

        this.cols = this.cols || '40';
        this.rows = this.rows || '15';
        style = "style=\"font-size: " + this.fontSize + "; font-family: " + this.fontFamily + "; text-align: " + this.textAlign + ";\"";
        codigo = "<textarea id=\"" + this.id + "\" rows=\"" + this.rows + "\" cols=\"" + this.cols + "\" " + style + "></textarea>";
        return codigo; 
    }

}